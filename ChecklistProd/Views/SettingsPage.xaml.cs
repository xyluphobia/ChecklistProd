using ChecklistProd.Services;
using ChecklistProd.Views.Controls;
using CommunityToolkit.Maui.Views;
using Microsoft.Maui.ApplicationModel.Communication;
using Microsoft.Data.SqlClient;

namespace ChecklistProd.Views;

public partial class SettingsPage : ContentPage
{
    private readonly AuthService _authService;
    public SettingsPage(AuthService authService)
	{
		InitializeComponent();
        _authService = authService;
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

    private async void btnLogout_Clicked(object sender, EventArgs e)
    {
        _authService.Logout();
        await Shell.Current.GoToAsync($"//{nameof(LoginPage)}");
    }

    private async void btnDeleteAccount_Clicked(object sender, EventArgs e)
    {
        var popup = new DeleteAccountPopup();
        var confirmed = await this.ShowPopupAsync(popup, CancellationToken.None);

        if (confirmed is bool boolResult)
        {
            if (boolResult)
            {
                string? connectionString = Environment.GetEnvironmentVariable("ENV_SqlConnection");
                using SqlConnection connection = new SqlConnection(connectionString);
                using SqlCommand command = connection.CreateCommand();
                command.CommandText = $"BEGIN TRANSACTION DELETE FROM Accounts WHERE email='{Preferences.Default.Get(AuthService.EmailKey, "")}' DELETE FROM UsersAndGoals WHERE email='{Preferences.Default.Get(AuthService.EmailKey, "")}' COMMIT";
                connection.Open();

                try
                {
                    command.ExecuteNonQuery();
                }
                catch (SqlException ex)
                {
                    await DisplayAlert("Error", ex.Message, "Ok");
                    return;
                }
                await DisplayAlert("Success", "Your account has been deleted.", "Ok");

                _authService.Logout();
                await Shell.Current.GoToAsync($"//{nameof(LoginPage)}");
            }
        }
    }
}