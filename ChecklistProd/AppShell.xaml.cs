using ChecklistProd.Views;

namespace ChecklistProd
{
    public partial class AppShell : Shell
    {
        public AppShell()
        {
            InitializeComponent();

            Routing.RegisterRoute(nameof(HomePage), typeof(HomePage));
            Routing.RegisterRoute(nameof(EditGoalsPage), typeof(EditGoalsPage));
            Routing.RegisterRoute(nameof(AddGoalsPage), typeof(AddGoalsPage));
            Routing.RegisterRoute(nameof(SettingsPage), typeof(SettingsPage));
            Routing.RegisterRoute(nameof(LoginPage), typeof(LoginPage));
            Routing.RegisterRoute(nameof(SignUpPage), typeof(SignUpPage));
            Routing.RegisterRoute(nameof(LoadingPage), typeof(LoadingPage));
        }
    }
}
