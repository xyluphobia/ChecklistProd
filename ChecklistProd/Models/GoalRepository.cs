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

        public static void SaveData()
        {


            var path = FileSystem.Current.AppDataDirectory;
            var fullPathGoals = Path.Combine(path, "GoalStorage.json");

            var serializedData = JsonSerializer.Serialize(_goals);
          
            File.WriteAllText(fullPathGoals, serializedData);
        }

        public static void ReadData()
        {


            var path = FileSystem.Current.AppDataDirectory;
            var fullPathGoals = Path.Combine(path, "GoalStorage.json");

            if (!File.Exists(fullPathGoals))
                return;

            var rawData = File.ReadAllText(fullPathGoals);

            try {
                _goals = JsonSerializer.Deserialize<List<Goal>>(rawData);
            }
            catch (Exception e) { 
                _goals = new List<Goal>();
                Debug.WriteLine("Exception", e.Message, "Ok");
            }
        }
    }
}
