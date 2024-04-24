

namespace ChecklistProd.Views;

public partial class SettingsPage : ContentPage
{
	public SettingsPage()
	{
		InitializeComponent();
	}

    protected override void OnAppearing()
    {
        base.OnAppearing();

        entrySettingsHardDaysPerWeek.Text = Preferences.Default.Get("HardDaysPerWeek", 2).ToString();
    }

    private void btnBackToHome_Clicked(object sender, EventArgs e)
    {
        Shell.Current.GoToAsync($"//{nameof(HomePage)}");
    }

    private void entrySettingsHardDaysPerWeek_Unfocused(object sender, FocusEventArgs e)
    {
        if (entrySettingsHardDaysPerWeek.Text != null || entrySettingsHardDaysPerWeek.Text != "")
            Preferences.Default.Set("HardDaysPerWeek", Int32.Parse(entrySettingsHardDaysPerWeek.Text));
        else
            entrySettingsHardDaysPerWeek.Text = Preferences.Default.Get("HardDaysPerWeek", 2).ToString();
    }
}