<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="EcommerceApplication.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     
    <title>Car Comparison</title>
    <style>
        .comparison-table {
            border-collapse: collapse;
            width: 80%;
            margin: auto;
            margin-top: 20px;
        }
        .comparison-table th, .comparison-table td {
            border: 1px solid black;
            padding: 10px;
            text-align: center;
        }
        .comparison-table th {
            background-color: #f8f9fa;
        }
    </style>
</head>
<asp:Label runat="server" Text="L"></asp:Label>
<body>
    <form id="form1" runat="server">
        <div class="flex justify-between w-1/4 mr-10">
                        <asp:LinkButton ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click"></asp:LinkButton>
                        <asp:LinkButton ID="btnHistory" runat="server" PostBackUrl="~/History.aspx" Text="Register"></asp:LinkButton>
         </div>
        <div style="text-align: center;">
            <asp:Panel ID="CookiePanel" runat="server">
                <small><strong>Hello <%=Request.Cookies["Name"].Value.ToString()%>, Welcome!</strong></small>
            </asp:Panel>

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
            
            <div style="text-align:center; margin:20px;">
            <label for="ddlCar1">Select Car 1: </label>
            <asp:DropDownList ID="ddlCar1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCar1_SelectedIndexChanged">
                
            </asp:DropDownList>

            <label for="ddlCar2" style="margin-left:20px;">Select Car 2: </label>
            <asp:DropDownList ID="ddlCar2" runat="server" AutoPostBack="True" ></asp:DropDownList>

            <asp:Button ID="btnCompare" runat="server" Text="Compare Cars" OnClick="btnCompare_Click" style="margin-left:20px;" />
                <asp:GridView ID="gvComparison" runat="server" AutoGenerateColumns="False" Visible="False">
            <Columns>
                <asp:BoundField HeaderText="Feature" DataField="Feature" />
                <asp:BoundField HeaderText="Car 1" DataField="Car1" />
                <asp:BoundField HeaderText="Car 2" DataField="Car2" />
            </Columns>
        </asp:GridView>
        </div>
    </form>
</body>
</html>
