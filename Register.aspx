<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="EcommerceApplication.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="text-center">
                <asp:Label ID="lblReg" runat="server" Text="Registration Form" CssClass="text-3xl font-bold underline"></asp:Label>
            </div>
            <div class="navbar p-2 bg-blue-100 w-screen">
                <nav class="flex justify-between">
                    
                    <div class="flex justify-between mr-10">
                        <asp:LinkButton CssClass="p-4" ID="LinkbtnLogin" runat="server" PostBackUrl="~/Login.aspx" Text="Login" CausesValidation="False"></asp:LinkButton>
                        <asp:LinkButton CssClass="p-4" ID="LinkbtnAdminLogin" runat="server" PostBackUrl="~/AdminLogin.aspx" Text=" Admin Login" CausesValidation="False"></asp:LinkButton>
                    </div>
                </nav>
            </div>

            <div class="my-3 flex items-center">
            <asp:Label ID="lblUsername" runat="server" Text="Username:" CssClass="mr-2 w-24 font-bold"></asp:Label>
            <asp:TextBox ID="txtUsername" runat="server" CssClass="border-2 border-black rounded-lg p-3"></asp:TextBox>
            <asp:RequiredFieldValidator
                ID="RfvUser"
                runat="server"
                ErrorMessage="UserName is required"
                ControlToValidate="txtUsername"
                ForeColor="Red"
                Display="Dynamic">
            </asp:RequiredFieldValidator>
        </div>
            <div>
                <asp:Label ID="lblName" runat="server" Text="Name:" CssClass="mr-2 w-24 font-bold"></asp:Label>
                <asp:TextBox ID="txtName" runat="server" CssClass="border-2 border-black rounded-lg p-3"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RfvNameVald" runat="server" ErrorMessage="Name is Required" ControlToValidate="txtName" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <div>
                <asp:Label ID="lblEmail" runat="server" Text="Email" CssClass="mr-2 w-24 font-bold"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="border-2 border-black rounded-lg p-3"></asp:TextBox>
                <%--<asp:RequiredFieldValidator ID="RfvEmailVald" runat="server" ErrorMessage="Email is Required" ForeColor="Red" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator">--%>
                <asp:RegularExpressionValidator
                    ID="RevEmailVald"
                    runat="server"
                    ControlToValidate="txtEmail"
                    ErrorMessage="Please enter a valid email address."
                    ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$">
                </asp:RegularExpressionValidator>


            </div>
            <div>
                <asp:Label ID="lblPhone" runat="server" Text="Phone no:" CssClass="mr-2 w-24 font-bold"></asp:Label>
                <asp:TextBox ID="txtPhone" runat="server" CssClass="border-2 border-black rounded-lg p-3"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="RfvPhone"
                    runat="server"
                    ErrorMessage="Phone number is required."
                    ControlToValidate="txtPhone"
                    ForeColor="Red"
                    Display="Dynamic">
                </asp:RequiredFieldValidator>

            </div>
            <div>
                <asp:Label ID="lblGender" runat="server" Text="Gender:" CssClass="mr-2 w-24 font-bold"></asp:Label>
                <asp:DropDownList ID="ddlGender" runat="server" CssClass="border-2 border-black rounded-lg p-3" OnSelectedIndexChanged="ddlGender_SelectedIndexChanged">
                    <asp:ListItem Text="Select Gender" Value="-1"></asp:ListItem>
    <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
    <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator
                    ID="RfvGender"
                    runat="server"
                    ErrorMessage="Please select a gender."
                    ControlToValidate="ddlGender"
                    InitialValue=""
                    ForeColor="Red"
                    Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>

            <div>
                <asp:Label ID="lblPass" runat="server" Text="Password:" CssClass="mr-2 w-24 font-bold"></asp:Label>
                <asp:TextBox ID="txtPass" runat="server" CssClass="border-2 border-black rounded-lg p-3" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="RfvPassword"
                    runat="server"
                    ErrorMessage="Password is required."
                    ControlToValidate="txtPass"
                    ForeColor="Red"
                    Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>
            <div>
                <asp:Label ID="lblPassConfirm" runat="server" Text="Confirm Password:" CssClass="mr-2 w-24 font-bold"></asp:Label>
                <asp:TextBox ID="txtPassConfirm" runat="server" CssClass="border-2 border-black rounded-lg p-3" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="RfvPasswordConfirm"
                    runat="server"
                    ErrorMessage="Re Enter password"
                    ControlToValidate="txtPassConfirm"
                    ForeColor="Red"
                    Display="Dynamic">
                </asp:RequiredFieldValidator>
                <asp:CompareValidator
                    ID="CvPasswordMatch"
                    runat="server"
                    ErrorMessage="Passwords do not match."
                    ControlToCompare="txtPass"
                    ControlToValidate="txtPassConfirm"
                    ForeColor="Red"
                    Display="Dynamic">
                </asp:CompareValidator>
            </div>
            <div>
                <asp:Button ID="Button1" runat="server" Text="Register" CssClass="text-white bg-black p-3 text-center rounded-lg font-bold"  OnClick="Button1_Click"/>
           
                </div>

            <div>
                <span class="text-white font-bold pr-2">Have an account?</span>
                <asp:Button ID="btnSignIn" runat="server" Text="Sign In!" PostBackUrl="~/Login.aspx" CausesValidation="False" ValidateRequestMode="Enabled" OnClick="btnSignIn_Click" />
                <br />
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </div>


        </div>
    </form>
</body>
</html>
