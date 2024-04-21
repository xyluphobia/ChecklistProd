using ChecklistProd.Models;

namespace ChecklistProd.Views;

public partial class AddGoalsPage : ContentPage
{
	public AddGoalsPage()
	{
		InitializeComponent();
	}

    private void goalCtrl_OnCancel(object sender, EventArgs e)
    {
        Shell.Current.GoToAsync($"//{nameof(HomePage)}");
    }

    private void goalCtrl_OnSave(object sender, EventArgs e)
    {
        GoalRepository.AddGoal(new Goal
        {
            Task = goalCtrl.Task,
            EXP = Int32.Parse(goalCtrl.EXP)
        });

        Shell.Current.GoToAsync($"//{nameof(HomePage)}");
    }

    private void goalCtrl_OnError(object sender, string e)
    {
        DisplayAlert("Error", e, "Ok");
    }
}