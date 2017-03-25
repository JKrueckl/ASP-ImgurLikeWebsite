<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Album_Display_Page.aspx.cs" Inherits="Album_Display_Page" %>

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

    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="jumbotron text-center"> <asp:Label ID="Title" runat="server" Text="Default"></asp:Label> </div>

        <div class="container-fluid"> 
            <asp:PlaceHolder ID="ImagesPlaceHolder" runat="server"></asp:PlaceHolder>

            <asp:Button ID="AddAgain" runat="server" Text="Add Again" UseSubmitBehavior="False" PostBackUrl="~/ICA09_JKrueckl.aspx" />
        </div>

         <div class="container-fluid bg-info text-center">
            <h3><span class="glyphicon glyphicon-copyright-mark"/> Copyright 2017 by Jacob Krueckl</h3>
        </div>
    </form>
</body>
</html>
