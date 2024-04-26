using ChecklistProd.Models;
using ChecklistProd.Services;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Text.Json;

namespace ChecklistProd.Views;

public partial class HomePage : ContentPage
{
    public int goalsPerDay = 5;
    int goalsCompletedToday = 0;
    public double currentLevelPercent = 0d;
    public int currentLevel = 0;
    private bool isHardDay = false;
    private bool localLoadingAsHardDay = false;
    bool dailyTimerRunning;
    List<bool> currentStreak = new List<bool>();
    int weeksCompletedStreak;

    public HomePage()
    {
        InitializeComponent();
        dailyTimerRunning = false;
        GoalRepository.ReadData();
    }

    protected override void OnAppearing()
    {
        base.OnAppearing();

        ReadLocalData();
        checkAndResetGoalsDaily();

        if (isHardDay)
        {
            localLoadingAsHardDay = true;
            chkboxHardDay.IsChecked = true;
        }

        LoadGoals();
        UpdateReadData();
    }

    private void chkboxHardDay_CheckedChanged(object sender, CheckedChangedEventArgs e)
    {
        var priorityGoals = GoalRepository._goals.Where(goal => goal.isPriority);
        isHardDay = chkboxHardDay.IsChecked;

        // set back to original exp when hard day is off
        if (!isHardDay) 
        {
            foreach (Goal goal in priorityGoals)
            {
                goal.EXP = 10;
                GoalRepository.UpdateGoal(goal.GoalId, goal);
            }
        }
        else if (!localLoadingAsHardDay && Preferences.Default.Get("HardDaysUsed", 0) >= Preferences.Default.Get("HardDaysPerWeek", 2))
        {
            chkboxHardDay.IsChecked = false;
            isHardDay = false;
        }
        // set priority goals to be worth double
        else
        {
            foreach (Goal goal in priorityGoals)
            {
                goal.EXP = 20;
                GoalRepository.UpdateGoal(goal.GoalId, goal);
            }
            Preferences.Default.Set("HardDaysUsed", Preferences.Default.Get("HardDaysUsed", 0) + 1);
        }
        localLoadingAsHardDay = false;

        SaveLocalData();
        LoadGoals();
    }
    private void btnSettings_Clicked(object sender, EventArgs e)
    {
        Shell.Current.GoToAsync(nameof(SettingsPage));
    }

    /* 
     * Desired logic for and relating to goals:
     *   2 Buttons to the left of each goal:
     *     Button 1 = Partial complete, this gives you half the reward for the goal
     *     Button 2 = Full complete, gives you full reward for the goal unless this goal has been partially completed already, in this case give half reward.
     *   Click on goal: Allows you to edit only that goal in a popup window
     *   Button to the right of goal: re-complete button, this gives you the reward for completing the goal again
     *   
     *   ((Goal)listGoals.SelectedItem).GoalId <- how to get goal by Id for popup editing
     */
    private async void listGoals_ItemSelected(object sender, SelectedItemChangedEventArgs e)
    {
        if (listGoals.SelectedItem == null)  // This event triggers on select and deselect, check ensures that logic doesn't run on deselect.
            return;

        await Shell.Current.GoToAsync($"{nameof(EditGoalsPage)}?Id={((Goal)listGoals.SelectedItem).GoalId}");
    }

    private void listGoals_ItemTapped(object sender, ItemTappedEventArgs e)
    {
        listGoals.SelectedItem = null;
    }

    private void btnAddGoals_Clicked(object sender, EventArgs e)
    {
        Shell.Current.GoToAsync(nameof(AddGoalsPage));
    }

    private void Delete_Clicked(object sender, EventArgs e)
    {
        var menuItem = sender as MenuItem;
        var goal = menuItem.CommandParameter as Goal;

        GoalRepository.DeleteGoalById(goal.GoalId);

        LoadGoals();
    }

    private void GoalComplete_Clicked(object sender, EventArgs e)
    {
        var btnListItem = sender as Button;
        var goal = GoalRepository.GetGoalById((int)btnListItem.CommandParameter);

        if (string.Equals(goal.Status, "partial"))
            progressLevelBarByRatio(0.5d, goal);
        else
        {
            progressLevelBarByRatio(1d, goal);
            goal.GoalComplete = true;
        }

        if (string.Equals(goal.Status, "recomplete") || string.Equals(goal.Status, "complete"))
        {
            goal.Status = "recomplete";
            goal.GoalComplete = true;
        }
        else
        {
            goal.Status = "complete";
            goal.GoalComplete = true;
        }

        GoalRepository.UpdateGoal(goal.GoalId, goal);
        LoadGoals();
    }

    private void GoalPartialComplete_Clicked(object sender, EventArgs e)
    {
        var btnListItem = sender as Button;
        var goal = GoalRepository.GetGoalById((int)btnListItem.CommandParameter);

        progressLevelBarByRatio(0.5d, goal);

        if (string.Equals(goal.Status, "partial"))
            goal.Status = "complete";
        else if (string.Equals(goal.Status, "recomplete"))
            goal.Status = "recomplete";
        else
            goal.Status = "partial";

        GoalRepository.UpdateGoal(goal.GoalId, goal);
        LoadGoals();
    }

    private void GoalReComplete_Clicked(object sender, EventArgs e)
    {
        var btnListItem = sender as Button;
        var goal = GoalRepository.GetGoalById((int)btnListItem.CommandParameter);

        if (!string.Equals(goal.Status, "complete") && !string.Equals(goal.Status, "recomplete"))
            return;

        progressLevelBarByRatio(1d, goal);

        goal.Status = "recomplete";
        GoalRepository.UpdateGoal(goal.GoalId, goal);
        LoadGoals();
    }


    private void entryGoalsPerDay_Unfocused(object sender, FocusEventArgs e)
    {
        if (entryGoalsPerDay.Text == null || entryGoalsPerDay.Text == "")
        {
            entryGoalsPerDay.Text = goalsPerDay.ToString();
        }
        else
        {
            int throwaway;
            if (Int32.TryParse(entryGoalsPerDay.Text, out throwaway))
            {
                double goalsCompletedSimple = (currentLevelPercent * goalsPerDay) / 100d; 
                goalsPerDay = throwaway;

                currentLevelPercent = (goalsCompletedSimple / goalsPerDay) * 100d;

                if (goalsCompletedSimple > goalsPerDay)
                    LevelUp();
                else
                    progressBarLevel.Progress = currentLevelPercent;

                progressBarUpdateSegmentCount();
                SaveLocalData();
            }
            else
            {
                entryGoalsPerDay.Text = goalsPerDay.ToString();
                DisplayAlert("Error", "Goal count entered must be an Integer.", "Ok");
            }
        }
    }

    private void progressBarUpdateSegmentCount()
    {
        progressBarLevel.SegmentCount = goalsPerDay;
        progressBarLevel.SecondaryProgress = currentLevelPercent + (100d / goalsPerDay);
    }

    private void LevelUp()
    {
        while (currentLevelPercent > 99) 
        {
            progressBarLevel.SetProgress(0d, 1d, Easing.Linear);
            currentLevelPercent = currentLevelPercent - 100d;
            
            currentLevel += 1;
            lblCurrentLevel.Text = currentLevel.ToString();

            GoalRepository.SaveData();
            SaveLocalData();

            if (currentLevelPercent > 0)
                progressBarLevel.Progress = currentLevelPercent;
        }

        progressBarLevel.SecondaryProgress = currentLevelPercent + (100d / goalsPerDay);
    }

    private async void progressLevelBarByRatio(double ratio, Goal? goal)
    {
        // goalsperday x 10 is the full amount of exp needed per level
        // find the percent the exp gained is of goalsperday x10

        int EXPNeeded = goalsPerDay * 10;
        double percentGainedForCompletion = (goal.EXP * 100d) / EXPNeeded * ratio;

        currentLevelPercent = currentLevelPercent + percentGainedForCompletion;
        double savedPercent = currentLevelPercent;

        if (currentLevelPercent > 99)
        {
            await Task.Run(() => 
            { 
                progressBarLevel.Progress = 100; 
                Task.Delay(1000).Wait(); 
            });
            currentLevelPercent = savedPercent;
            LevelUp();
        }
        else
        {
            progressBarLevel.Progress = currentLevelPercent;
            progressBarLevel.SecondaryProgress = currentLevelPercent + (100d / goalsPerDay);
        }

        ProgressStreak();
        GoalRepository.SaveData();
        SaveLocalData();
    }

    private void LoadGoals()
    {
        var goals = new ObservableCollection<Goal>(GoalRepository.GetGoals());

        foreach (Goal goal in goals.Where(goal => goal.isPriority))
        {
            if (isHardDay)
                goal.EXP = 20;
            else
                goal.EXP = 10;

            GoalRepository.UpdateGoal(goal.GoalId, goal);
        }

        listGoals.ItemsSource = goals;
        ReadLocalData();
    }

    public void SaveLocalData()
    {
        var path = FileSystem.Current.AppDataDirectory;
        var fullPathData = Path.Combine(path, "LocalData.json");

        var serializedData = JsonSerializer.Serialize(new Data
        {
            goalsPerDayData = goalsPerDay,
            goalsCompletedTodayData = goalsCompletedToday,
            currentLevelPercentData = currentLevelPercent,
            currentLevelData = currentLevel,
            isHardDayData = isHardDay,
            currentStreakData = currentStreak,
            weeksCompletedStreakData = weeksCompletedStreak,
        });

        File.WriteAllText(fullPathData, serializedData);
    }

    public void ReadLocalData() 
    {
        var path = FileSystem.Current.AppDataDirectory;
        var fullPathData = Path.Combine(path, "LocalData.json");

        if (!File.Exists(fullPathData))
            return;

        var rawData = File.ReadAllText(fullPathData);


        try
        {
            Data data = JsonSerializer.Deserialize<Data>(rawData);

            goalsPerDay = data.goalsPerDayData;
            goalsCompletedToday = data.goalsCompletedTodayData;
            currentLevelPercent = data.currentLevelPercentData;
            currentLevel = data.currentLevelData;
            isHardDay = data.isHardDayData;
            currentStreak = data.currentStreakData;
            weeksCompletedStreak = data.weeksCompletedStreakData;
        }
        catch (Exception e)
        {
            Debug.WriteLine("Exception", e.Message, "Ok");
        }
    }

    private void UpdateReadData()
    {
        lblCurrentLevel.Text = currentLevel.ToString();
        lblCurrentStreak.Text = (currentStreak.Count + (weeksCompletedStreak * 7)).ToString();
        entryGoalsPerDay.Text = goalsPerDay.ToString();
        progressBarLevel.SetProgress(currentLevelPercent, 1d, Easing.Linear);
        progressBarUpdateSegmentCount();
        chkboxHardDay.IsChecked = isHardDay;
    }

    private void btnReset_Clicked(object sender, EventArgs e)
    {
        goalsPerDay = 5;
        goalsCompletedToday = 0;
        currentLevel = 0;
        currentLevelPercent = 0d;
        isHardDay = false;
        currentStreak.Clear();
        weeksCompletedStreak = 0;
        
        Preferences.Default.Clear();

        UpdateReadData();
        SaveLocalData();
    }
    // when i build the function that resets the goals every 24hrs dont forget to build the weekly reset that gives back all hard days
    private void checkAndResetGoalsDaily()
    {
        DateTime savedDateTime = Preferences.Default.Get("LastRefDateTime", new DateTime());
        DateTime currentDateTime = DateTime.Now;

        if (DateTime.Compare(currentDateTime.Date, savedDateTime.Date) == 0)
        {
            MidnightTimer(currentDateTime);
        }
        else if (DateTime.Compare(currentDateTime.Date, savedDateTime.Date) > 0)
        {
            DailyReset();
            MidnightTimer(currentDateTime);
        }
        else if (DateTime.Compare(currentDateTime.Date, savedDateTime.Date) < 0)
        {
            Debug.WriteLine("Error, you have time travelled.");
        }

        Preferences.Default.Set("LastRefDateTime", DateTime.Now);
    }
    private void MidnightTimer(DateTime currentDateTime)
    {
        if (dailyTimerRunning) return;

        dailyTimerRunning = true;

        TimeSpan timeUntilMidnight = (currentDateTime - currentDateTime.Date).Subtract(TimeSpan.FromHours(24)).Duration();
        Task.Delay(timeUntilMidnight).ContinueWith(o =>
        {
            Dispatcher.Dispatch(new Action(() =>
            {
                DailyReset();
                dailyTimerRunning = false;
            }));
        });
    }

    private void DailyReset()
    {
        if (currentStreak.Count < (int)DateTime.Today.DayOfWeek)
        {
            currentStreak.Clear();
        }

        goalsCompletedToday = 0;
        GoalRepository.ResetGoalCompletion();
        // if its sunday or if it has been sunday since the last referenced date
        int DaysUntilSundayFromRef = ((int) DayOfWeek.Sunday - (int)Preferences.Default.Get("LastRefDateTime", new DateTime()).DayOfWeek + 7);
        int DaysUntilTodayFromRef = ((int) DateTime.Today.DayOfWeek - (int)Preferences.Default.Get("LastRefDateTime", new DateTime()).DayOfWeek + 7);
        if (DateTime.Today.DayOfWeek == DayOfWeek.Sunday || DaysUntilTodayFromRef >= DaysUntilSundayFromRef)
            WeeklyReset();

        SaveLocalData();
        UpdateReadData();
        LoadGoals();
    }

    private void WeeklyReset()
    {
        Debug.WriteLine("Weekly Reset Popped, Check Day");

        if (currentStreak.Count >= 7)
        {
            // weekly streak success bonus
            weeksCompletedStreak += 1;
            if (Preferences.Default.Get("HardDaysUsed", 0) <= 0)
            {
                // bonus for going a week without a hard day/nice message
            }
        }
        else
        {
            weeksCompletedStreak = 0;
        }

        Preferences.Default.Set("HardDaysUsed", 0);
        currentStreak.Clear();
    }

    private void ProgressStreak()
    {
        goalsCompletedToday += 1;
        if (goalsCompletedToday >= goalsPerDay || isHardDay)
        {
            currentStreak.Add(true);
            lblCurrentStreak.Text = currentStreak.Count.ToString();
            SaveLocalData();
        }
    }
}