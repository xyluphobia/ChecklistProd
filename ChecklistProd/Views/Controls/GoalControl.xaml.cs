namespace ChecklistProd.Views.Controls;

public partial class GoalControl : ContentView
{
	public event EventHandler<string> OnError;
    public event EventHandler<EventArgs> OnSave;
    public event EventHandler<EventArgs> OnCancel;
	public GoalControl()
	{
		InitializeComponent();
	}

	public string Task 
	{
		get { return entryTask.Text; }
		set { entryTask.Text = value; }
	}

	public bool isPriority
	{
		get { return chkboxSetPriority.IsChecked; }
		set { chkboxSetPriority.IsChecked = value; }
	}

    private void btnPushEdit_Clicked(object sender, EventArgs e)
    {
		if (entryTask.Text == null || entryTask.Text == "")
		{
			OnError?.Invoke(sender, "Please enter a goal you would like to complete.");
		}
		else
		{
            OnSave?.Invoke(sender, e);
        }
    }

    private void btnCancelEditGoals_Clicked(object sender, EventArgs e)
    {
		OnCancel?.Invoke(sender, e);
    }
}