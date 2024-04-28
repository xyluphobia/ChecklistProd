using ChecklistProd.Views;
using Microsoft.Maui.Controls;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Security;
using System.Text;
using System.Threading.Tasks;

namespace ChecklistProd.Services
{
    public class AuthService
    {
        private const string AuthStateKey = "AuthState";
        public const string EmailKey = "AuthSavedEmail";
        public async Task<bool> IsAuthenticatedAsync()
        {
            await Task.Delay(1500);
            bool authState = Preferences.Default.Get<bool>(AuthStateKey, false);

            return authState;
        }

        public bool Login(string email, string password)
        {
            string? connectionString = Environment.GetEnvironmentVariable("ENV_SqlConnection");
            using SqlConnection connection = new SqlConnection(connectionString);
            using SqlCommand command = connection.CreateCommand();
            command.CommandText = $"SELECT * FROM Accounts WHERE email = '{email}' AND password = '{password}'";

            try
            {
                connection.Open();
                using SqlDataReader reader = command.ExecuteReader();

                if (!reader.HasRows)
                {
                    return false; // Creds DON'T exist in system
                }
            }
            catch (SqlException exception)
            {
                Debug.WriteLine("Error", exception.Message, "Ok");
                return false;
            }

            Preferences.Default.Set(EmailKey, email);
            Preferences.Default.Set(AuthStateKey, true);
            return true; // Creds DO exist in system
        }
        public void Logout()
        {
            Preferences.Default.Remove(AuthStateKey);
            Preferences.Default.Remove(EmailKey);
        }
    }
}
