using ChecklistProd.Models;
using ChecklistProd.Services;
using ChecklistProd.Views;
using Microsoft.Extensions.Logging;
using Syncfusion.Maui.Core.Hosting;
using CommunityToolkit.Maui;

namespace ChecklistProd
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .ConfigureSyncfusionCore()
                .UseMauiCommunityToolkit()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                    fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
                });
            

#if DEBUG
    		builder.Logging.AddDebug();
            Environment.SetEnvironmentVariable("ENV_SqlConnection", "Server=tcp:checklistserver.database.windows.net,1433;Initial Catalog=userAccounts;Persist Security Info=False;User ID=mattchecklistadmin;Password=Chief0826!;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
#endif
            builder.Services.AddTransient<AuthService>();
            builder.Services.AddTransient<LoadingPage>();
            builder.Services.AddTransient<LoginPage>();
            builder.Services.AddTransient<SettingsPage>();


            return builder.Build();
        }
    }
}
