using ChecklistProd.Models;
using System.Collections.ObjectModel;

namespace ChecklistProd.Views;

public partial class HomePage : ContentPage
{
	public HomePage()
	{
        InitializeComponent();
    }

    protected override void OnAppearing()
    {
        base.OnAppearing();

        var goals = new ObservableCollection<Goal>(GoalRepository.GetGoals());
        listGoals.ItemsSource = goals;
    }


    // progress to 75% over 500ms using linear easing
    //progressBarLevel.ProgressTo(0.75, 500, Easing.Linear);

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
}