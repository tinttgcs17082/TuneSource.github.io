<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Management_CD.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style type="text/css">
        .auto-style3 {
            font-size: xx-large;
        }

        .auto-style5 {
            font-size: large;
        }
        .auto-style6 {
            width: 92px;
            text-align: justify;
        }
        .auto-style7 {
            width: 837px;
        }
        .auto-style8 {
            text-align: left;
            width: 713px;
        }
        .auto-style9 {
            width: 32%;
            height: 79px;
        }
        .auto-style10 {
            width: 126px;
            text-align: right;
            font-size: large;
        }
        .auto-style11 {
            text-align: left;
        }
        .auto-style12 {
            text-align: center;
        }
        .auto-style14 {
            color: #CC0000;
        }
        .auto-style15 {
            width: 126px;
            text-align: right;
            font-size: large;
            height: 35px;
        }
        .auto-style16 {
            text-align: left;
            height: 35px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style12">
            <table align="center" class="auto-style7">
                <tr>
                    <td class="auto-style8">
                        <strong>
                            <asp:Label ID="Label1" runat="server" CssClass="auto-style3" Text="TUNESOURCE"></asp:Label>
                        </strong>
                    </td>
                    <td class="auto-style6">
                        <asp:LinkButton ID="HyperLink1" runat="server" CssClass="auto-style5" PostBackUrl="~/Registration.aspx">Registration</asp:LinkButton>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <table align="center" class="auto-style9">
                <tr>
                    <td class="auto-style10">Username:</td>
                    <td class="auto-style11">
                        <asp:TextBox ID="txtUser" runat="server" CssClass="auto-style5"></asp:TextBox>
                    &nbsp;<asp:Label ID="lbUser" runat="server" CssClass="auto-style14"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style15">Password:</td>
                    <td class="auto-style16">
                        <asp:TextBox ID="txtPass" runat="server" CssClass="auto-style5" TextMode="Password"></asp:TextBox>
                    &nbsp;<asp:Label ID="lbPass" runat="server" CssClass="auto-style14"></asp:Label>
                    </td>
                </tr>
            </table>
            <asp:Label ID="lbMess" runat="server" CssClass="auto-style14"></asp:Label>
            <br />
            <br />
            <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
