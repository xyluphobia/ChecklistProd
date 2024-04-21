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
        public static List<Goal> _goals = new List<Goal>()
        {
            new Goal { GoalId = 0, Task = "Work on Aim", EXP = 10, Status = "incomplete" },
            new Goal { GoalId = 1, Task = "Work on Movement", EXP = 20, Status = "incomplete" },
            new Goal { GoalId = 2, Task = "Progress Uni", EXP = 10, Status = "incomplete" },
            new Goal { GoalId = 3, Task = "Progress Career", EXP = 10, Status = "incomplete" },
            new Goal { GoalId = 4, Task = "Read Something", EXP = 10, Status = "incomplete" },
            new Goal { GoalId = 5, Task = "Learn Lambda Expressions in C#", EXP = 10, Status = "incomplete" }
        };

        public static List<Goal> GetGoals() => _goals;
        public static Goal GetGoalById(int goalId)
        {
            var goal = _goals.FirstOrDefault(x => x.GoalId == goalId);
            if (goal != null)
            {
                return new Goal
                {
                    GoalId = goalId,
                    Task = goal.Task,
                    EXP = goal.EXP,
                    Status = goal.Status
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
                    goalToUpdate.Color = Colors.Green;
                else if (string.Equals(goalToUpdate.Status, "partial"))
                    goalToUpdate.Color = Colors.YellowGreen;
                else if (string.Equals(goalToUpdate.Status, "recomplete"))
                    goalToUpdate.Color = Colors.Gold;
                else if (string.Equals(goalToUpdate.Status, "incomplete") || goalToUpdate.Status == null)
                    if (goalToUpdate.EXP > 10)
                        goalToUpdate.Color = Colors.MediumPurple;
                else
                    goalToUpdate.Color= Colors.Red;
            }

            SaveData();
        }

        public static void AddGoal(Goal goal)
        {
            var maxId = _goals.Max(x => x.GoalId);
            goal.GoalId = maxId + 1; 
            _goals.Add(goal);

            SaveData();
        }

        public static void SaveData()
        {
            var path = FileSystem.Current.AppDataDirectory;
            var fullPath = Path.Combine(path, "GoalStorage.json");

            var serializedData = JsonSerializer.Serialize(_goals);
          
            File.WriteAllText(fullPath, serializedData);
        }

        public static async void ReadData()
        {
            var path = FileSystem.Current.AppDataDirectory;
            var fullPath = Path.Combine(path, "GoalStorage.json");

            var rawData = File.ReadAllText(fullPath);

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
