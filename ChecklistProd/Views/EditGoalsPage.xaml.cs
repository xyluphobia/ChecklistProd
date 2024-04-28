using ChecklistProd.Models;

namespace ChecklistProd.Views;

[QueryProperty(nameof(GoalId), "Id")]
public partial class EditGoalsPage : ContentPage
{
    private Goal goal;

	public EditGoalsPage()
	{
		InitializeComponent();
	}

    public string GoalId
    {
        set
        {
            goal = GoalRepository.GetGoalById(int.Parse(value));

            if (goal == null)
                return;

            goalCtrl.Task = goal.Task;
            goalCtrl.isPriority = goal.isPriority;
        }
    }


    private void btnCancelEditGoals_Clicked(object sender, EventArgs e)
    {
        Shell.Current.GoToAsync("..");
    }

    private void btnPushEdit_Clicked(object sender, EventArgs e)
    {
        goal.Task = goalCtrl.Task;
        goal.isPriority = goalCtrl.isPriority;
        goal.EXP = goal.isPriority ? 20 : 10;

        GoalRepository.UpdateGoal(goal.GoalId, goal);
        Shell.Current.GoToAsync("..");
    }

    private void goalCtrl_OnError(object sender, string e)
    {
        DisplayAlert("Error", e, "Ok");
    }
}