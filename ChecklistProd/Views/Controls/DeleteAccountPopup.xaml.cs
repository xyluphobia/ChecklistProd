using CommunityToolkit.Maui.Views;

namespace ChecklistProd.Views.Controls;

public partial class DeleteAccountPopup : Popup
{
	public DeleteAccountPopup()
	{
		InitializeComponent();
	}

    private async void onDeleteButtonClicked(object sender, EventArgs e)
    {
        var cts = new CancellationTokenSource(TimeSpan.FromSeconds(5));
        await CloseAsync(true, cts.Token);
    }
    private async void onCancelButtonClicked(object sender, EventArgs e)
    {
        var cts = new CancellationTokenSource(TimeSpan.FromSeconds(5));
        await CloseAsync(false, cts.Token);
    }
}