<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="EcommerceApplication.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="flex justify-between">
            <div class="flex justify-between w-1/4 mr-10">
                        <asp:LinkButton ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" CausesValidation="False"></asp:LinkButton>
           </div>
            </nav>
            <div class="text-center">
                <asp:Label ID="lblAdmin" runat="server" Text="Admin" CssClass="text-3xl font-bold underline"></asp:Label>
            </div>
            <div class="my-3 flex items-center">
                <asp:Label ID="lblBrand" runat="server" Text="Enter Brand" CssClass="mr-2 w-24 font-bold"></asp:Label>
                <asp:TextBox ID="txtBrand" runat="server" CssClass="border-2 border-black rounded-lg p-3"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="RfvBrand"
                    runat="server"
                    ErrorMessage="Brand is required"
                    ControlToValidate="txtBrand"
                    ForeColor="Red"
                    Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>

            <div class="my-3 flex items-center">
                <asp:Label ID="lblModel" runat="server" Text="Enter Model Name:" CssClass="mr-2 w-24 font-bold"></asp:Label>
                <asp:TextBox ID="txtModel" runat="server" CssClass="border-2 border-black rounded-lg p-3"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="RfvModel"
                    runat="server"
                    ErrorMessage="Model is required"
                    ControlToValidate="txtModel"
                    ForeColor="Red"
                    Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>
            <asp:Button ID="CheckModelExists" runat="server" Text="Enter More Details" OnClick="CheckModelExists_Click" />
            <asp:Label ID="LblExists" runat="server"></asp:Label>
            <asp:Label ID="lblMessage1" runat="server"></asp:Label>
            



        </div>
    </form>
</body>
</html>
