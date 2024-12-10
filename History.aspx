<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="History.aspx.cs" Inherits="EcommerceApplication.History" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <div class="flex justify-between w-1/4 mr-10">
            <asp:LinkButton ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click"></asp:LinkButton>
        </div>
        <asp:GridView ID="HistoryGV" runat="server" AutoGenerateColumns="False" Visible="False">
            <Columns>
                <asp:BoundField HeaderText="Brand 1" DataField="Brand1" />
                <asp:BoundField HeaderText="Model 1" DataField="Model1" />
                <asp:BoundField HeaderText="Brand 1" DataField="Brand2" />
                <asp:BoundField HeaderText="Model 2" DataField="Model2" />
            </Columns>
        </asp:GridView>
        
    </form>
</body>
</html>
