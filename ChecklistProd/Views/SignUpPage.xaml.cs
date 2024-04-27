namespace ChecklistProd.Views;

public partial class SignUpPage : ContentPage
{
	public SignUpPage()
	{
        InitializeComponent();
    }

    private void btnSignUp_Clicked(object sender, EventArgs e)
    {

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