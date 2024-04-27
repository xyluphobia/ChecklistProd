using Microsoft.Maui.ApplicationModel.Communication;
using System.Data.SqlClient;

namespace ChecklistProd.Views;

public partial class SignUpPage : ContentPage
{
	public SignUpPage()
	{
        InitializeComponent();
    }

    private async void btnSignUp_Clicked(object sender, EventArgs e)
    {
        string email = entryEmail.Text;
        string password = entryPassword.Text;

        if (behaviorEmailValidator.IsNotValid)
        {
            await DisplayAlert("Invalid Credentials", "The email address entered is invalid, please try again.", "Ok");
            return;
        }
        else if (Equals(email, "") || Equals(password, ""))
        {
            await DisplayAlert("Error", "Please fill out all fields.", "Ok");
            return;
        }
        else if (!Equals(password, entryConfirmPassword.Text))
        {
            await DisplayAlert("Error", "Passwords do not match.", "Ok");
            return;
        }
        else if (password.Length < 8)
        {
            await DisplayAlert("Error", "Passwords must be at least 8 characters long.", "Ok");
            return;
        }


        string? connectionString = Environment.GetEnvironmentVariable("ENV_SqlConnection");
        using SqlConnection connection = new SqlConnection(connectionString);
        using SqlCommand command = connection.CreateCommand();
        command.CommandText = $"BEGIN TRANSACTION INSERT INTO Accounts (email, password) VALUES ('{email}', '{password}') INSERT INTO UsersAndGoals (email) VALUES ('{email}') COMMIT";
        connection.Open();

        try
        {
            command.ExecuteNonQuery();  
        }
        catch (SqlException exception)
        {
            if (exception.Number == 2627 || exception.Number == 2601) // These error numbers are for duplicate primary/unique keys, in this case the email address.
            {
                await DisplayAlert("Error", "This email address is already registered to an account.", "Ok");
                return;
            }
        }

        await DisplayAlert("Success!", "You have signed up successfully!", "Ok");
        await Shell.Current.GoToAsync($"//{nameof(LoginPage)}");
    }

    private void btnShowPassword_Clicked(object sender, EventArgs e)
    {
        entryPassword.IsPassword = !entryPassword.IsPassword;
        entryConfirmPassword.IsPassword = !entryConfirmPassword.IsPassword;
    }

    private async void btnGoToLogin_Clicked(object sender, EventArgs e)
    {
        await Shell.Current.GoToAsync($"//{nameof(LoginPage)}");
    }
}