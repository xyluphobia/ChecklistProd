using Microsoft.Maui.ApplicationModel.Communication;
using Microsoft.Data.SqlClient;
using System.Text.RegularExpressions;

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

        if (behaviorEmailValidator.IsNotValid)
        {
            await DisplayAlert("Invalid Email", "The email address entered is not a valid email, please try again.", "Ok");
            return;
        }
        else if (Equals(email, "") || Equals(entryPassword.Text, "") || Equals(entryConfirmPassword.Text, "") || email == null || entryPassword == null || entryConfirmPassword == null)
        {
            await DisplayAlert("Error", "Please fill out all fields.", "Ok");
            return;
        }
        else if (!Equals(entryPassword.Text, entryConfirmPassword.Text))
        {
            await DisplayAlert("Error", "Passwords do not match.", "Ok");
            entryPassword.Text = "";
            entryConfirmPassword.Text = "";
            return;
        }
        else if (!PasswordIsStrong())
        {
            return;
        }

        string password = BCrypt.Net.BCrypt.EnhancedHashPassword(entryPassword.Text, 13); // hash and salt password before 

        string? connectionString = Environment.GetEnvironmentVariable("ENV_SqlConnection");
        using SqlConnection connection = new SqlConnection(connectionString);
        using SqlCommand command = connection.CreateCommand();
        command.CommandText = $"BEGIN TRANSACTION INSERT INTO Accounts (email, password) VALUES ('{email}', '{password}') INSERT INTO UsersAndGoals (email) VALUES ('{email}') COMMIT";

        try
        {
            connection.Open();
            command.ExecuteNonQuery();  
        }
        catch (SqlException exception)
        {
            if (exception.Number == 2627 || exception.Number == 2601) // These error numbers are for duplicate primary/unique keys, in this case the email address.
            {
                await DisplayAlert("Error", "This email address is already registered to an account.", "Ok");
                return;
            }
            throw;
        }

        entryPassword.Text = "";
        entryConfirmPassword.Text = "";

        await DisplayAlert("Success!", "You have signed up successfully!", "Ok");
        await Shell.Current.GoToAsync($"//{nameof(LoginPage)}");
    }

    private bool PasswordIsStrong()
    {
        // at least 10 characters long
        // at least 1 upper case letter & 1 special character & 1 number
        var regexNoSpecials = new Regex("^[a-zA-Z0-9 ]*$");

        bool errorFound = false;
        string messageInsert = "";

        if (entryPassword.Text.Length < 10)
        {
            messageInsert = (10 - entryPassword.Text.Length).ToString() + " characters";
            errorFound = true;
        }
        if (!entryPassword.Text.Any(char.IsUpper))
        {
            if (errorFound)
                messageInsert += ", an uppercase character";
            else
            {
                messageInsert += "an uppercase character";
                errorFound = true;
            }
        }
        if (regexNoSpecials.IsMatch(entryPassword.Text))
        {
            if (errorFound)
                messageInsert += ", a special character";
            else
            {
                messageInsert += "a special character";
                errorFound = true;
            }
        }
        if (!entryPassword.Text.Any(char.IsDigit))
        {
            if (errorFound)
                messageInsert += "and a number";
            else
            {
                messageInsert += "a number";
                errorFound = true;
            }
        }

        if (Equals(messageInsert, ""))
            return true;

        DisplayAlert("Error", $"Your password must be at least 10 characters long and contain at least 1 uppercase letter, 1 special character and 1 number. You are missing {messageInsert}.", "Ok");
        return false;
    }

    private async void btnGoToLogin_Clicked(object sender, EventArgs e)
    {
        await Shell.Current.GoToAsync($"//{nameof(LoginPage)}");
    }
}