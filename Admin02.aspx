<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin02.aspx.cs" Inherits="EcommerceApplication.Admin02" %>

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
        <%--<div>
            <asp:TextBox ID="txtBrand" runat="server" CssClass="border-2 border-black rounded-lg p-3"></asp:TextBox>
        </div>
        <div>
            <asp:TextBox ID="txtModel" runat="server" CssClass="border-2 border-black rounded-lg p-3"></asp:TextBox>
        </div>--%>
            <div class="my-3 flex items-center">
                <asp:Label ID="lblPrice" runat="server" Text="Enter Price" CssClass="mr-2 w-24 font-bold"></asp:Label>
                <asp:TextBox ID="txtPrice" runat="server" CssClass="border-2 border-black rounded-lg p-3"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="RfvPrice"
                    runat="server"
                    ErrorMessage="Price is required"
                    ControlToValidate="txtPrice"
                    ForeColor="Red"
                    Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>

            <div>
                <asp:Label ID="lblFuel" runat="server" Text="Enter Fuel Type" CssClass="mr-2 w-24 font-bold"></asp:Label>
                <asp:DropDownList ID="ddlFuel" runat="server" CssClass="border-2 border-black rounded-lg p-3" OnSelectedIndexChanged="ddlFuel_SelectedIndexChanged">
                    <asp:ListItem Text="Select Fuel Type" Value="-1"></asp:ListItem>
                    <asp:ListItem Text="Petrol" Value="Petrol"></asp:ListItem>
                    <asp:ListItem Text="Diesel" Value="Diesel"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator
                    ID="RfvFuel"
                    runat="server"
                    ErrorMessage="Please select Fuel Type."
                    ControlToValidate="ddlFuel"
                    InitialValue=""
                    ForeColor="Red"
                    Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>


            <div class="my-3 flex items-center">
                <asp:Label ID="lblMileage" runat="server" Text="Enter MileAge" CssClass="mr-2 w-24 font-bold"></asp:Label>
                <asp:TextBox ID="txtMileage" runat="server" CssClass="border-2 border-black rounded-lg p-3"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="RfvMileage"
                    runat="server"
                    ErrorMessage="Mileage is required"
                    ControlToValidate="txtMileage"
                    ForeColor="Red"
                    Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>

            <div class="my-3 flex items-center">
                <asp:Label ID="lblImage" runat="server" Text="Uplaod Image" CssClass="mr-2 w-24 font-bold"></asp:Label>
                <asp:FileUpload ID="fileUpload1" runat="server" />
     
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </div>

        <div>
                <asp:Button ID="BtnUploadData" runat="server" Text="Upload Data" CssClass="text-white bg-black p-3 text-center rounded-lg font-bold"  OnClick="btnDataUpload_Click"/>
           
                </div>

           
            
           <asp:Label ID="lblMessage" runat="server"></asp:Label>
       
    </form>
</body>
</html>
