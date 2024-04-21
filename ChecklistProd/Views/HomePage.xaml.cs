using ChecklistProd.Models;
using System.Collections.ObjectModel;
using System.Drawing;

namespace ChecklistProd.Views;

// https://www.youtube.com/watch?app=desktop&v=eeJske-Tu40&ab_channel=SingletonSean useful for making persistent login sessions
/* Saving Options:
 * Preferences:  (use for simple data, dont use for objs large things)
 *   Perefernces.Set("keyname", data);
 *   Preferences.Get("keyname", idk);
 */

public partial class HomePage : ContentPage
{
    public int goalsPerDay = 5;
    public float currentLevelPercent = 0f;
    public int currentLevel = 0;

    public HomePage()
	{
        InitializeComponent();
    }

    protected override void OnAppearing()
    {
        base.OnAppearing();

        LoadGoals();
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
        // This event only triggers when the item selection is first made, this allows you to reselct the same item after logic has completed.
        // This event always triggers when interacting with items in the list therefore we don't want to put all our logic here as it will
        // run more often and sometimes when not expected to but it is the perfect place to garentee that the selected item is unselected as
        // this event triggers AFTER the "ItemSelected" event triggers.
        listGoals.SelectedItem = null;
    }

    private void btnAddGoals_Clicked(object sender,  EventArgs e)
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
        var menuItem = sender as MenuItem;
        var goal = GoalRepository.GetGoalById((int)menuItem.CommandParameter);

        if (string.Equals(goal.Status, "partial"))
            progressLevelBarByRatio(0.5f, goal);
        else
            progressLevelBarByRatio(1f, goal);

        if (string.Equals(goal.Status, "recomplete") || string.Equals(goal.Status, "complete"))
            goal.Status = "recomplete";
        else
            goal.Status = "complete";
        GoalRepository.UpdateGoal(goal.GoalId, goal);
        LoadGoals();

        var textCell = menuItem.Parent as TextCell;  // This doesnt work because after calling 'LoadGoals()' the cells are different and this textcell is null. Need to save color to goal.
        textCell.TextColor = Colors.Green;
    }

    private void GoalPartialComplete_Clicked(object sender, EventArgs e)
    {
        var menuItem = sender as MenuItem;
        var goal = GoalRepository.GetGoalById((int)menuItem.CommandParameter);

        progressLevelBarByRatio(0.5f, goal);

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
        var menuItem = sender as MenuItem;
        var goal = GoalRepository.GetGoalById((int)menuItem.CommandParameter);

        if (!string.Equals(goal.Status, "complete"))
            return;

        progressLevelBarByRatio(1f, goal);

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
                goalsPerDay = throwaway;
            }
            else
            {
                entryGoalsPerDay.Text = goalsPerDay.ToString();
                DisplayAlert("Error", "Goal count entered must be an Integer.", "Ok");
            }
        }
    }

    private void LevelUp()
    {
        progressBarLevel.ProgressTo(0, 0, Easing.Linear);
        currentLevelPercent = currentLevelPercent - 1;
        progressBarLevel.ProgressTo(currentLevelPercent, 500, Easing.CubicOut);

        currentLevel += 1;
        lblCurrentLevel.Text = currentLevel.ToString();
    }

    private async void progressLevelBarByRatio(float ratio, Goal? goal)
    {
        // goalsperday x 10 is the full amount of exp needed per level
        // find the percent the exp gained is of goalsperday x10

        int EXPNeeded = goalsPerDay * 10;
        float percentGainedForCompletion = (((goal.EXP * 100) / EXPNeeded) * .01f) * ratio;

        currentLevelPercent = currentLevelPercent + percentGainedForCompletion;

        if (currentLevelPercent > .99f)
        {
            await progressBarLevel.ProgressTo(1f, 500, Easing.CubicOut);
            LevelUp();
        }
        else
        {
            await progressBarLevel.ProgressTo(currentLevelPercent, 500, Easing.CubicOut);
        }
    }

    private void LoadGoals()
    {
        var goals = new ObservableCollection<Goal>(GoalRepository.GetGoals());

        foreach (Goal goal in goals)            // this loops only purpose is to make goals with exp values greater than 10 have their colour be purple
        {                                       // this is probably not worth and should be removed later
            if (goal.EXP > 10)
            {
                GoalRepository.UpdateGoal(goal.GoalId, goal);
            }
        }

        listGoals.ItemsSource = goals;
    }

}