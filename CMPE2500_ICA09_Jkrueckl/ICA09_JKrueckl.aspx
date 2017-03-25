<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ICA09_JKrueckl.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Includes -->

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"/>

    <!-- Custom StyleSheet -->
    <link rel="stylesheet" href="StyleSheet.css" />

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!-- End Includes -->

    <title> Jacob Krueckl ICA09 </title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="jumbotron text-center"><h1>Asp Imgur </h1></div>
    
    <div class="container bg-info">
        <asp:MultiView ID="MultiViewControl" runat="server" ActiveViewIndex="0">

            <!-- Login view -->
            <asp:View ID="LoginView" runat="server">
                <div class="row">
                    <div class="col-md-3">
                        <asp:Label ID="UserNameLabel" runat="server" Text="User Name : "></asp:Label>
                    </div>
                    <div class="col-md-3">
                        <asp:TextBox ID="UsernameTextBox" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <asp:Label ID="PassWordLabel" runat="server" Text="Password : "></asp:Label>
                    </div>
                    <div class="col-md-3">
                        <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password"></asp:TextBox>
                    </div>                                       
                </div>     
                <div class="row">
                    <asp:Button ID="NextButton1" runat="server" Text="Next" UseSubmitBehavior="False" OnClick="NextButton1_Click" />
                </div>

            </asp:View>

            <!-- Logged in view -->
            <asp:View ID="LoggedInView" runat="server">
                <div class="row">
                    <asp:Label ID="AddToAlbumLabel" runat="server" Text="Add to your album : "></asp:Label>
                </div>
                <div class="row">
                    <asp:FileUpload ID="UploadImageControl" runat="server" />
                </div>
                <div class="row">
                    <asp:Button ID="NextButton2" runat="server" Text="Next" UseSubmitBehavior="False" OnClick="NextButton2_Click" />
                </div>
            </asp:View>

            <!-- Uploaded View -->
            <asp:View ID="UploadedView" runat="server">

            </asp:View>
        </asp:MultiView>
               
        <!-- Static Controls-->

        <div class="row">
            <asp:Label runat="server" Text="Lets begin" id="statusLabel" BorderStyle="Inset" BackColor="#99FF99"></asp:Label>
        </div>

        <div class="row">
            <asp:Button ID="GoToAlbum" runat="server" Text="Go To Album" UseSubmitBehavior="False" PostBackUrl="Album_Display_Page.aspx"/>
        </div>
        
        <div class="row">
            <asp:Button ID="Logout" runat="server" Text="Logout" UseSubmitBehavior="False" OnClick="Logout_Click" />
        </div>

        <!-- End static controls -->
    </div>

    <div class="container-fluid bg-info text-center">
        <h3><span class="glyphicon glyphicon-copyright-mark"/> Copyright 2017 by Jacob Krueckl</h3>
    </div>
    
    <asp:HiddenField ID="LastFileUploaded" runat="server" />

    </form>
</body>
</html>