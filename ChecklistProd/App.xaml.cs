namespace ChecklistProd
{
    public partial class App : Application
    {
        public App()
        {
            Syncfusion.Licensing.SyncfusionLicenseProvider.RegisterLicense("Ngo9BigBOggjHTQxAR8/V1NBaF5cXmZCekx0THxbf1x0ZFxMY1lbQHRPIiBoS35RckVnW31ccXdQQmJcWEdx ");
            InitializeComponent();

            MainPage = new AppShell();
        }
    }
}
