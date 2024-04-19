namespace ChecklistProd.Views;

public partial class HomePage : ContentPage
{
	public HomePage()
	{
		InitializeComponent();

        List<Goal> goals = new List<Goal>() 
        {
            new Goal { Task = "Work on Aim" },
            new Goal { Task = "Work on Movement" },
            new Goal { Task = "Progress Uni" },
            new Goal { Task = "Progress Career" },
            new Goal { Task = "Read Something" }
        };

        listGoals.ItemsSource = goals;
    }

    public class Goal
    {
        public required string Task { get; set; }
    }

    private void btnEditGoals_Clicked(object sender, EventArgs e)
    {
        Shell.Current.GoToAsync(nameof(EditGoalsPage));

        // progress to 75% over 500ms using linear easing
        //progressBarLevel.ProgressTo(0.75, 500, Easing.Linear);
    }
}