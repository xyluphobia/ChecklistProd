namespace ChecklistProd.Views;

public partial class AddGoalsPage : ContentPage
{
	public AddGoalsPage()
	{
		InitializeComponent();
	}

    private void btnCancelAddGoal_Clicked(object sender, EventArgs e)
    {
        Shell.Current.GoToAsync("..");
    }
}