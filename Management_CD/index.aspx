<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Management_CD.index" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Tune Source</title>
    <style type="text/css">
        .auto-style1 {
            height: 64px;
        }

        .auto-style3 {
            font-size: xx-large;
        }

        .auto-style4 {
            width: 968px;
        }

        .auto-style5 {
            text-align: center;
            height: 66px;
        }

        .auto-style6 {
            text-align: center;
            width: 564px;
            height: 40px;
        }

        .auto-style7 {
            color: #FF0000;
            background-color: #FFFFFF;
        }

        .auto-style8 {
            width: 100%;
            text-align:center;
        }

        .auto-style9 {
            width: 698px;
        }
        .auto-style10 {
            width: 332px;
        }
        .auto-style11 {
            width: 118px;
        }
    </style>
</head>

<body style="height: 510px">
    <form runat="server">
        <header>
            <div class="auto-style5">
                <td class="auto-style4">
                    <strong>&nbsp;&nbsp;&nbsp;
                    <table class="auto-style8">
                        <tr>
                            <td class="auto-style9">
                                <strong>
                                    <asp:Label ID="Label1" runat="server" CssClass="auto-style3" Text="TUNESOURCE"></asp:Label>
                                </strong>
                            </td>
                            <td class="auto-style10">
                                <asp:TextBox ID="tbSearch" placeholder="Search CD" runat="server" Width="240px" Height="25px"></asp:TextBox>
                                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" Height="29px" Width="62px" />
                            </td>
                            <td class="auto-style11">
                                Hello
                                <asp:Label ID="lb_User" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" />
                            </td>
                        </tr>
                    </table>
                        <br />
                        <div class="auto-style6">
                            <asp:Label ID="lblDate" runat="server"></asp:Label>
                            &nbsp;
                <asp:Label ID="Label2" runat="server" Text="Visiter: "></asp:Label>
                            <asp:Label ID="lbVisitor" runat="server" CssClass="auto-style7"></asp:Label>
                        </div>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </strong>
                </td>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
            </div>
        </header>
        <section>
            <div align="center">
                <br />
                <div class="title">
                    <h2 class="auto-style4">------------------------------------------------------ List CDs ------------------------------------------------------</h2>
                    <div align="center">
                        <asp:DataList ID="dlCD" runat="server" RepeatColumns="5" RepeatDirection="Horizontal" HorizontalAlign="Center" OnItemCommand="dlCD_ItemCommand">
                            <EditItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" ForeColor="Black" />
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" Height="156px" ImageUrl='<%# Bind("Picture") %>' Width="176px" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                                <em>
                                    <table class="auto-style8">
                                        <tr>
                                            <td>
                                                <em>
                                                    <strong>
                                                        <asp:Label ID="lbTitle" runat="server" CssClass="auto-style1" Font-Names="Adobe Gothic Std B" Text='<%# Eval("Title") %>'></asp:Label>
                                                    </strong>
                                                </em>
                                            </td>
                                        </tr>
                                    </table>
                                </em>&nbsp;
                            </ItemTemplate>
                        </asp:DataList>
                        &nbsp;&nbsp;&nbsp;
                    <br />
                    </div>
                </div>
            </div>
        </section>
    </form>
</body>

</html>
