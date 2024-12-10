<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="EcommerceApplication.AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblAdminLogin" runat="server" Text="ADMIN LOGIN PAGE"></asp:Label>
        </div>
        <div>
            <asp:Label ID="lblAdminUsername" runat="server" Text="Enter Username"></asp:Label>
            <asp:TextBox ID="txtAdminUserName" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="lblAdminPassLogin" runat="server" Text="Enter Password"></asp:Label>
            <asp:TextBox ID="txtAdminPass" runat="server"></asp:TextBox>
           
        </div>
        <div>
         <asp:Button ID="btnAdminLogin" runat="server" OnClick="btnAdminLogin_Click" Text="Login" />
        </div>

        <div>
        <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
        </div>
    </form>
</body>
</html>
