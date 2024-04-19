namespace ChecklistProd.Views;

public partial class EditGoalsPage : ContentPage
{
	public EditGoalsPage()
	{
		InitializeComponent();

        
	}





    private void btnAddGoals_Clicked(object sender, EventArgs e)
    {
		Shell.Current.GoToAsync(nameof(AddGoalsPage));
    }

    private void btnCancelEditGoals_Clicked(object sender, EventArgs e)
    {
        Shell.Current.GoToAsync("..");
    }
}