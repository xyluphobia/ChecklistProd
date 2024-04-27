using ChecklistProd.Services;

namespace ChecklistProd.Views;

public partial class LoginPage : ContentPage
{
	private readonly AuthService _authService;
	public LoginPage(AuthService authService)
	{
		InitializeComponent();
		_authService = authService;
	}

    private async void btnLogin_Clicked(object sender, EventArgs e)
    {
        string email = entryEmail.Text;
        string password = entryPassword.Text;

        if (behaviorEmailValidator.IsNotValid)
        {
            await DisplayAlert("Invalid Credentials", "The email address entered is invalid, please try again.", "Ok");
            return;
        }
        else if (Equals(email, "")|| Equals(password, ""))
        {
            await DisplayAlert("Error", "Please fill out all fields.", "Ok");
            return;
        }


        if (_authService.Login(email, password))
        {
            await Shell.Current.GoToAsync(nameof(HomePage));
        }
        else
        {
            await DisplayAlert("Invalid Credentials", "The email and password entered cannot be found in our system, please try again or sign up below.", "Ok");
        }
    }

    private void btnShowPassword_Clicked(object sender, EventArgs e)
    {
        entryPassword.IsPassword = !entryPassword.IsPassword;
    }

    private async void btnGoToSignUp_Clicked(object sender, EventArgs e)
    {
        await Shell.Current.GoToAsync(nameof(SignUpPage));
    }
}