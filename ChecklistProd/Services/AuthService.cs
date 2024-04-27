using System;
using System.Collections.Generic;
using System.Linq;
using System.Security;
using System.Text;
using System.Threading.Tasks;

namespace ChecklistProd.Services
{
    public class AuthService
    {
        private const string AuthStateKey = "AuthState";
        public async Task<bool> IsAuthenticatedAsync()
        {
            await Task.Delay(1500);
            bool authState = Preferences.Default.Get<bool>(AuthStateKey, false);

            return authState;
        }

        public void Login(string email, string password)
        {
            // check here before setting the key to true if the credentials entered are valid
            Preferences.Default.Set<bool>(AuthStateKey, true);
        }
        public void Logout()
        {
            Preferences.Default.Remove(AuthStateKey);
        }
    }
}
