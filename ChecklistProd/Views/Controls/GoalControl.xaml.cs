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
	public string EXP
	{
		get { return entryEXP.Text; }
		set { entryEXP.Text = value; }
	}

	public bool isPriority
	{
		get { return chkboxSetPriority.IsChecked; }
		set { chkboxSetPriority.IsChecked = value; }
	}

    private void btnPushEdit_Clicked(object sender, EventArgs e)
    {
        int parseCheck;

		if (entryTask.Text == null || entryTask.Text == "")
		{
			OnError?.Invoke(sender, "Please enter a goal you would like to complete.");
		}
		else if (!Int32.TryParse(entryEXP.Text, out parseCheck))
		{
            OnError?.Invoke(sender, "The value entered for EXP was not an interger.");
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