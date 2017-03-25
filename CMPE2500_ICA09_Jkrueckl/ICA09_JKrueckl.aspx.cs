using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            MultiViewControl.ActiveViewIndex = 0;

        if (Page.PreviousPage != null && Page.PreviousPage.IsCrossPagePostBack)
        {
            if(Session["UserID"] != null)
            {
                MultiViewControl.ActiveViewIndex = 1;

                StaticMethods.UpdateStatus("Welcome back " + Session["UserID"] + ", you have " + Session["UserPicCount"] + " pictures.", true, statusLabel);
            }
        }
    }

    protected void NextButton1_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(UsernameTextBox.Text))
        {
            StaticMethods.UpdateStatus("Please enter a username.", false, statusLabel);
            UsernameTextBox.Focus();
            return;
        }
        else if (string.IsNullOrWhiteSpace(PasswordTextBox.Text))
        {
            StaticMethods.UpdateStatus("Please enter a password.", false, statusLabel);
            PasswordTextBox.Focus();
            return;
        }

        Session["UserID"] = UsernameTextBox.Text;

        StaticMethods.UpdateStatus("Welcome " + Session["UserID"].ToString() + ", please upload a picture!", true, statusLabel);
        MultiViewControl.ActiveViewIndex++;
    }

    protected void NextButton2_Click(object sender, EventArgs e)
    {
        // Needs a file
        if (!UploadImageControl.HasFile)
        {
            StaticMethods.UpdateStatus("Please upload a file.", false, statusLabel);
            return;
        }

        // Needs the correct file type
        if (UploadImageControl.PostedFile.ContentType != "image/jpeg")
        {
            StaticMethods.UpdateStatus("File type of uploaded file is incorrect.", false, statusLabel);
            return;
        }

        Directory.CreateDirectory(MapPath("/Uploads/" + Session["UserID"]));

        string destDir = MapPath("/Uploads/" + Session["UserID"]);
        string savePath = destDir + @"\" + UploadImageControl.FileName;

        try
        {
            UploadImageControl.SaveAs(savePath);
        }
        catch (Exception ex)
        {
            StaticMethods.UpdateStatus("Failed to upload : " + savePath + " : " + ex.ToString(), false, statusLabel);
            return;
        }

        StaticMethods.UpdateStatus("Thanks " + Session["UserID"] + " - Successfully uploaded (" + new FileInfo(savePath).Name + ") to : " + @"\Uploads\" + Session["UserID"], true, statusLabel);
        LastFileUploaded.Value = new FileInfo(savePath).Name;
        MultiViewControl.ActiveViewIndex++;
    }

    protected void Logout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        StaticMethods.UpdateStatus("Successfully logged out.", true, statusLabel);
        MultiViewControl.ActiveViewIndex = 0;
    }
}