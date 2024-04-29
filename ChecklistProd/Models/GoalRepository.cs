using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;
using System.IO;
using System.Text.Json;
using System.Diagnostics;
using ChecklistProd.Views;
using ChecklistProd.Services;
using Microsoft.Data.SqlClient;
using Microsoft.Maui.ApplicationModel.Communication;


namespace ChecklistProd.Models
{
    public static class GoalRepository
    {
        public static List<Goal> _goals = new List<Goal>(){};
        public static List<Goal> GetGoals() => _goals;
        public static Goal? GetGoalById(int goalId)
        {
            var goal = _goals.FirstOrDefault(x => x.GoalId == goalId);
            if (goal != null)
            {
                return new Goal
                {
                    GoalId = goalId,
                    Task = goal.Task,
                    EXP = goal.EXP,
                    Status = goal.Status,
                    GoalColor = goal.GoalColor,
                    isPriority = goal.isPriority,
                    GoalComplete = goal.GoalComplete,
                };
            }

            return null;
        }

        public static void DeleteGoalById(int goalId)
        {
            var goal = _goals.FirstOrDefault(x =>x.GoalId == goalId);
            if (goal != null)
            {
                _goals.Remove(goal);
            }

            SaveData(true);
        }

        public static void UpdateGoal(int goalId, Goal goal)
        {
            if (goalId != goal.GoalId) return;

            var goalToUpdate = _goals.FirstOrDefault(x => x.GoalId == goalId);
            if (goalToUpdate != null)
            {
                goalToUpdate.Task = goal.Task;
                goalToUpdate.EXP = goal.EXP;
                goalToUpdate.Status = goal.Status;
                goalToUpdate.isPriority = goal.isPriority;
                goalToUpdate.GoalComplete = goal.GoalComplete;
                
                if (string.Equals(goalToUpdate.Status, "complete"))
                    goalToUpdate.GoalColor = "#005246";
                else if (string.Equals(goalToUpdate.Status, "partial"))
                    goalToUpdate.GoalColor = "#4c8077";
                else if (string.Equals(goalToUpdate.Status, "recomplete"))
                    goalToUpdate.GoalColor = "#ff7e33";
                else if (string.Equals(goalToUpdate.Status, "incomplete") || goalToUpdate.Status == null)
                    if (goalToUpdate.EXP > 10)
                        goalToUpdate.GoalColor = "MediumPurple";
                    else
                        goalToUpdate.GoalColor = "#C70039";
                else
                    goalToUpdate.GoalColor = "#C70039";
            }

            SaveData(true);
        }

        public static void AddGoal(Goal goal)
        {
            var maxId = 0;
            if (_goals.Count > 0)
                maxId = _goals.Max(x => x.GoalId);

            goal.GoalId = maxId + 1;
            goal.EXP = goal.isPriority ? 20 : 10;
            _goals.Add(goal);

            SaveData(true);
        }

        public static void ResetGoalCompletion()
        {
            var completedGoals = _goals.Where(goal => !Equals(goal.Status, "incomplete") || goal.GoalComplete == true);

            foreach (Goal goal in completedGoals)
            {
                goal.Status = "incomplete";
                goal.GoalComplete = false;
                UpdateGoal(goal.GoalId, goal);
            }
        }

        public static void SaveData(bool saveToSql)
        {
            var path = FileSystem.Current.AppDataDirectory;
            var fullPathGoals = Path.Combine(path, "GoalStorage.json");

            var serializedDataGoals = JsonSerializer.Serialize(_goals);

            File.WriteAllText(fullPathGoals, serializedDataGoals);

            if (saveToSql)
                SaveDataToSql(serializedDataGoals, "goals");
        }

        public static void ReadData(bool readFromSql)
        {
            var path = FileSystem.Current.AppDataDirectory;
            var fullPathGoals = Path.Combine(path, "GoalStorage.json");

            if (!File.Exists(fullPathGoals))
                return;
            
            var rawDataGoals = readFromSql ? ReadDataFromSQL(1) : File.ReadAllText(fullPathGoals);

            try
            {
                if (Equals(rawDataGoals, ""))
                    _goals = [];
                else
                    _goals = JsonSerializer.Deserialize<List<Goal>>(rawDataGoals);
            }
            catch (Exception e)
            {
                _goals = new List<Goal>();
                Debug.WriteLine("Exception", e.Message, "Ok");
            }
        }

        public static void SaveDataToSql(string serializedData, string keyToSaveTo)
        {
            string userEmail = Preferences.Default.Get<string>(AuthService.EmailKey, "");
            if (Equals(userEmail, "")) return; // this should throw an error

            string? connectionString = Environment.GetEnvironmentVariable("ENV_SqlConnection");
            using SqlConnection connection = new SqlConnection(connectionString);
            using SqlCommand command = connection.CreateCommand();
            command.CommandText = $"UPDATE UsersAndGoals SET {keyToSaveTo}='{serializedData}' WHERE email='{userEmail}'";

            try
            {
                connection.Open();
                command.ExecuteNonQuery();
            }
            catch (SqlException exception)
            {
                Debug.WriteLine("Error", exception.Message, "Ok");
                return;
            }
        }

        public static string ReadDataFromSQL(int columnToRetrieve)
        {
            string userEmail = Preferences.Default.Get<string>(AuthService.EmailKey, "");
            if (Equals(userEmail, "")) return ""; // this should throw an error

            string? connectionString = Environment.GetEnvironmentVariable("ENV_SqlConnection");
            using SqlConnection connection = new SqlConnection(connectionString);
            using SqlCommand command = connection.CreateCommand();
            command.CommandText = $"SELECT * FROM UsersAndGoals WHERE email = '{userEmail}'";

            try
            {
                connection.Open();
                using SqlDataReader reader = command.ExecuteReader();

                if (!reader.Read() || reader.IsDBNull(columnToRetrieve))
                    return "";

                return (string)reader.GetValue(columnToRetrieve);

            }
            catch (SqlException exception)
            {
                Debug.WriteLine("Error", exception.Message, "Ok");
                return "";
            }
        }
    }
}
