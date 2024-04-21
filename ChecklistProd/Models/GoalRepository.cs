using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChecklistProd.Models
{
    public static class GoalRepository
    {
        public static List<Goal> _goals = new List<Goal>()
        {
            new Goal { GoalId = 0, Task = "Work on Aim", EXP = 10 },
            new Goal { GoalId = 1, Task = "Work on Movement", EXP = 20 },
            new Goal { GoalId = 2, Task = "Progress Uni", EXP = 10 },
            new Goal { GoalId = 3, Task = "Progress Career", EXP = 10 },
            new Goal { GoalId = 4, Task = "Read Something", EXP = 10 }
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
                    EXP = goal.EXP
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
            }
        }

        public static void AddGoal(Goal goal)
        {
            var maxId = _goals.Max(x => x.GoalId);
            goal.GoalId = maxId + 1; 
            _goals.Add(goal);
        }

    }
}
