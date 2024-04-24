using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChecklistProd.Models
{
    public class Goal
    {
        public int GoalId { get; set; }
        public required string Task { get; set; }
        public int EXP { get; set; } = 10;
        public string Status { get; set; } = "incomplete";
        public string GoalColor { get; set; } = "Red";
        public bool isPriority { get; set; } = false;
    }
}
