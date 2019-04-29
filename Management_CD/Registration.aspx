<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Management_CD.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .auto-style7 {
            width: 837px;
        }
        .auto-style8 {
            text-align: left;
            width: 713px;
        }
        .auto-style3 {
            font-size: xx-large;
        }

        .auto-style6 {
            width: 92px;
            text-align: justify;
        }
        
        .auto-style5 {
            font-size: large;
        }
        .auto-style9 {
            width: 43%;
        }
        .auto-style10 {
            width: 318px;
            text-align: right;
            font-size: large;
        }
        .auto-style11 {
            text-align: left;
            width: 457px;
        }
        .auto-style12 {
            text-align: center;
        }
        .auto-style13 {
            font-size: x-large;
        }
        .auto-style14 {
            color: #CC0000;
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
                        <asp:LinkButton ID="HyperLink1" runat="server" CssClass="auto-style5" PostBackUrl="~/Login.aspx">Login</asp:LinkButton>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <strong>
            <asp:Label ID="Label2" runat="server" CssClass="auto-style13" Text="Create a new account"></asp:Label>
            <br />
            </strong>
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
                    <td class="auto-style10">Password:</td>
                    <td class="auto-style11">
                        <asp:TextBox ID="txtPass" runat="server" CssClass="auto-style5" TextMode="Password"></asp:TextBox>
                    &nbsp;
                        <asp:Label ID="lbPass" runat="server" CssClass="auto-style14"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <asp:Button ID="btnRegistration" runat="server" OnClick="btnRegistration_Click" Text="Registration" />
            <br />
        </div>
    </form>
</body>
</html>
