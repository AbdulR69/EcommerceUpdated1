<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PreHome.aspx.cs" Inherits="EcommerceApplication.PreHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <div class="navbar p-2 bg-blue-100 w-screen">
                <nav class="flex justify-between ">
                    <div class="logo ml-16">Logo</div>
                    <div class="flex justify-between w-1/4 mr-10">
                        <asp:LinkButton ID="btnLogin" runat="server" PostBackUrl="~/Login.aspx" Text="Login"></asp:LinkButton>
                        <asp:LinkButton ID="btnRegister" runat="server" PostBackUrl="~/Register.aspx" Text="Register"></asp:LinkButton>
                    </div>
                </nav>
            </div>
            <div class="flex flex-col w-screen h-screen justify-center items-center mt-4">
                <asp:Label ID="lblWelcome" runat="server" Text="Welcome" CssClass="text-6xl font-bold"></asp:Label>
                <br />
                <asp:Label ID="lblTo" runat="server" Text="To" CssClass="text-4xl font-bold"></asp:Label>
                <br />
                <asp:Label ID="lblShopper" runat="server" Text="CarWale" CssClass="text-6xl font-bold underline"></asp:Label>
                <br />
            </div>
          <div id="ItemsListing" class="flex gap-8 transition-transform duration-500">
                    <asp:Repeater ID="rptItems" runat="server">
                        <ItemTemplate>
                            <div class="hero-item bg-white shadow-lg rounded-lg flex flex-col items-center justify-center p-8 pb-16">
                                <asp:Image ID="imgItem" runat="server" ImageUrl='<%# Eval("image_url") %>' CssClass="w-16 md:w-32 lg:w-48" />
                                <asp:Label ID="lblItemName" runat="server" Text='<%# Eval("Car_details") %>' CssClass="text-sm font-bold mt-4"></asp:Label>
                                <asp:Label ID="lblItemPrice" runat="server" Text='<%# Eval("price", "Rs: {0}/-") %>' CssClass="text-sm font-bold"></asp:Label>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
          </div>


    </form>
</body>
</html>
