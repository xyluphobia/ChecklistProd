namespace ChecklistProd.Views;

public partial class refreshMainPage : ContentPage
{
	public refreshMainPage()
	{
        InitializeComponent();
        Shell.Current.GoToAsync(nameof(HomePage));
	}
}