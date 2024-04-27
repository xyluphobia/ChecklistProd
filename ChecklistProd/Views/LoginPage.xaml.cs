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
		_authService.Login(entryEmail.Text, entryPassword.Text);
		await Shell.Current.GoToAsync($"//{nameof(HomePage)}");
    }

    private async void btnGoToSignUp_Clicked(object sender, EventArgs e)
    {
        await Shell.Current.GoToAsync(nameof(SignUpPage));
    }
}