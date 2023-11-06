<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="KarateSchoolApplication.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <asp:Login ID="UserLogin" runat="server" BackColor="#F7F6F3" BorderColor="#E6E2D8" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="1.2em" ForeColor="#333333" OnAuthenticate="UserLogin_Authenticate" Height="300px" Width="700px">
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
            <LoginButtonStyle BackColor="#8F91A2" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="1.2em" ForeColor="#000000" />
            <TextBoxStyle Font-Size="1.2em" />
            <TitleTextStyle BackColor="#253D5B" Font-Bold="True" Font-Size="1.4em" ForeColor="White" />
        </asp:Login>
    </form>
</body>
</html>
