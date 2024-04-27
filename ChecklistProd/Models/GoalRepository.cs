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
using System.Data.SqlClient;


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

            SaveData();
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
                    goalToUpdate.GoalColor = "Green";
                else if (string.Equals(goalToUpdate.Status, "partial"))
                    goalToUpdate.GoalColor = "YellowGreen";
                else if (string.Equals(goalToUpdate.Status, "recomplete"))
                    goalToUpdate.GoalColor = "Gold";
                else if (string.Equals(goalToUpdate.Status, "incomplete") || goalToUpdate.Status == null)
                    if (goalToUpdate.EXP > 10)
                        goalToUpdate.GoalColor = "MediumPurple";
                    else
                        goalToUpdate.GoalColor = "Red";
                else
                    goalToUpdate.GoalColor = "Red";
            }

            SaveData();
        }

        public static void AddGoal(Goal goal)
        {
            var maxId = 0;
            if (_goals.Count > 0)
                maxId = _goals.Max(x => x.GoalId);

            goal.GoalId = maxId + 1; 
            _goals.Add(goal);

            SaveData();
        }

        public static void ResetGoalCompletion()
        {
            var completedGoals = _goals.Where(goal => goal.Status != "incomplete" || goal.GoalComplete == true);

            foreach (Goal goal in completedGoals)
            {
                goal.Status = "incomplete";
                goal.GoalComplete = false;
                UpdateGoal(goal.GoalId, goal);
            }
        }

        public static void SaveData()
        {
            var path = FileSystem.Current.AppDataDirectory;
            var fullPathGoals = Path.Combine(path, "GoalStorage.json");

            var serializedDataGoals = JsonSerializer.Serialize(_goals);

            File.WriteAllText(fullPathGoals, serializedDataGoals);
        }

        public static void ReadData()
        {
            var path = FileSystem.Current.AppDataDirectory;
            var fullPathGoals = Path.Combine(path, "GoalStorage.json");

            if (!File.Exists(fullPathGoals))
                return;

            var rawDataGoals = File.ReadAllText(fullPathGoals);

            try
            {
                _goals = JsonSerializer.Deserialize<List<Goal>>(rawDataGoals);
            }
            catch (Exception e)
            {
                _goals = new List<Goal>();
                Debug.WriteLine("Exception", e.Message, "Ok");
            }
        }

        public static void SaveDataToSQL()
        {
            // get user email
            // connect to sql server
            // find user email in database and add goals to the "goals" column
            // disconnect from sql server

            string userEmail = Preferences.Default.Get<string>(AuthService.EmailKey, "");
            if (Equals(userEmail, "")) return; // this should throw an error

            
        }

        public static void ReadDataFromSQL()
        {
            // get user email
            // connect to sql server
            // find user email in database and set goals to be equal to "goals" column unless it is null
            // if its null set goals to new List<Goal>(){}
            // discount from sql server
        }
    }
}
