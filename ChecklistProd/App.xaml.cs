namespace ChecklistProd
{
    public partial class App : Application
    {
        public App()
        {
            Syncfusion.Licensing.SyncfusionLicenseProvider.RegisterLicense("MzIzOTQ0MUAzMjM1MmUzMDJlMzBOR3YveStqT3BnN05LOEY5R1ZORGxpTU5teVB1alJVL3RlaWV4MGY1eE5nPQ==");
            InitializeComponent();

            MainPage = new AppShell();
        }
    }
}
