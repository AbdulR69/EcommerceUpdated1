<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EcommerceApplication.Login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblUserLogin" runat="server" Text="LOGIN PAGE"></asp:Label>
        </div>
       
        <div class="navbar p-2 bg-blue-100 w-screen">
            <nav class="flex justify-between">
                <asp:ImageButton
                    ID="home"
                    runat="server"
                    ImageUrl="~/media/Images/logo.png"
                    PostBackUrl="~/Default.aspx"
                    CssClass="w-12 h-12 rounded-lg shadow-lg hover:opacity-80" />
                <div class="flex justify-between mr-10">
                    <asp:LinkButton CssClass="p-4" ID="LinkbtnRegister" runat="server" PostBackUrl="~/Register.aspx" Text="Register" CausesValidation="False"></asp:LinkButton>
                    <asp:LinkButton CssClass="p-4" ID="LinkbtnAdminLogin" runat="server" PostBackUrl="~/AdminLogin.aspx" Text="Admin Login" CausesValidation="False"></asp:LinkButton>
                </div>
            </nav>
            </div>

        </div>

        <div>
            <asp:Label ID="lblUserUsername" runat="server" Text="Enter Username"></asp:Label>
            <asp:TextBox ID="txtUserUserName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator
                ID="RfvUserLogin"
                runat="server"
                ErrorMessage="UserName is required"
                ControlToValidate="txtUserUsername"
                ForeColor="Red"
                Display="Dynamic" ValidationGroup="LoginFormValidate">
            </asp:RequiredFieldValidator>
        </div>
        <div>
            <asp:Label ID="lblUserPassLogin" runat="server" Text="Enter Password"></asp:Label>
            <asp:TextBox ID="txtUserPass" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator
                    ID="RfvUserPass"
                    runat="server"
                    ErrorMessage="Enter password"
                    ControlToValidate="txtUserPass"
                    ForeColor="Red"
                    Display="Dynamic" ValidationGroup="LoginFormValidate"></asp:RequiredFieldValidator>
 
        </div>
        <div><asp:Button ID="btnUserLogin" runat="server" OnClick="btnUserLogin_Click" Text="Login" /></div>
        
        <asp:LinkButton ID="lblNewUser" runat="server" PostBackUrl="~/Register.aspx" OnClick="lblNewUser_Click">New User?</asp:LinkButton>
        <asp:LinkButton ID="lblAdmin" runat="server" PostBackUrl="~/AdminLogin.aspx" OnClick="lblAdmin_Click">Admin?</asp:LinkButton>
        
        <div><asp:Label ID="lblMessage" runat="server"></asp:Label></div>
        
    </form>
</body>
</html>
