using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

/// <summary>
/// Methods static to multiple webpages
/// </summary>
public class StaticMethods
{
    public static void UpdateStatus(string msg, bool isGood, Label statusLabel)
    {
        statusLabel.Text = msg;

        if (isGood)
            statusLabel.BackColor = Color.Green;
        else
            statusLabel.BackColor = Color.Red;
    }
}
