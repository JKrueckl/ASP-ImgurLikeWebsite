using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Album_Display_Page : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.PreviousPage != null && Page.PreviousPage.IsCrossPagePostBack)
        {
            if (Session["UserID"] != null)
            {
                ImagesPlaceHolder.Controls.Clear();
                Session["UserPicCount"] = Directory.EnumerateFiles(MapPath("~/Uploads/" + Session["UserID"] + "/")).ToList().Count;

                object obj = Page.PreviousPage.FindControl("LastFileUploaded");
                HiddenField LastFileUploaded = null;

                if (obj is HiddenField)
                    LastFileUploaded = obj as HiddenField;

                foreach (string s in Directory.EnumerateFiles(MapPath("~/Uploads/" + Session["UserID"] + "/")).Select(Path.GetFileName))
                {
                    Image img = new Image();
                    img.ImageUrl = "/Uploads/" + Session["UserID"] + "/" + s;
                    img.Height = 200;

                    if(LastFileUploaded != null)
                    {
                        if (LastFileUploaded.Value == s)
                        {
                            img.BorderWidth = 2;
                            img.BorderColor = System.Drawing.Color.Red;
                        }
                    }
                    ImagesPlaceHolder.Controls.Add(img);
                }

                Title.Text = Session["UserID"] + "'s Album of [" + Session["UserPicCount"] + "]";
            }
            else
            {
                Title.Text = "Not signed in, please head back to the log in menu.";
                AddAgain.Text = "Log in";
            }
        }
    }
}