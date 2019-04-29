<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Account_Management.aspx.cs" Inherits="Management_CD.Admin.Account_Management" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: xx-large;
        }

        .auto-style4 {
            font-size: large;
        }

        .auto-style2 {
            width: 57%;
        }

        .auto-style6 {
            height: 23px;
            text-align: right;
            width: 429px;
        }

        .auto-style8 {
            height: 23px;
            text-align: left;
        }

        .auto-style10 {
            text-align: right;
            width: 429px;
            height: 26px;
        }

        .auto-style11 {
            text-align: left;
            height: 26px;
        }

        .auto-style14 {
            width: 21%;
            margin-left: 0px;
        }

        .auto-style19 {
            height: 41px;
        }

        .auto-style20 {
            height: 61px;
            text-align: center;
        }

        .auto-style22 {
            width: 217px;
            height: 37px;
        }

        .auto-style23 {
            width: 220px;
            height: 37px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <div align="center" class="auto-style19">
            <strong>
                <table align="right" class="auto-style14">
                    <tr>
                        <td class="auto-style23">
                            <asp:HyperLink ID="hlAccount" runat="server" NavigateUrl="~/admin/Account_Management.aspx">Account Management</asp:HyperLink>
                        </td>
                        <td class="auto-style22">
                            <asp:HyperLink ID="hlBook" runat="server" NavigateUrl="~/Admin/CD_Management.aspx">CD Management</asp:HyperLink>
                        </td>
                    </tr>
                </table>
            </strong>
        </div>
        <div class="auto-style20">
            <strong>
                <br />
                <asp:Label ID="Label1" runat="server" CssClass="auto-style1" Text="ACCOUNT MANAGEMENT"></asp:Label>
            </strong>
        </div>
        <div align="center">
            <div class="auto-style4">
                <strong>
                    <br />
                    ADD new Account<br />
                </strong>
            </div>
            <div>
                <table class="auto-style2">
                    <tr>
                        <td class="auto-style6">Username:</td>
                        <td class="auto-style8">
                            <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style10">Password:</td>
                        <td class="auto-style11">
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Create New" />
                <br />
                <br />
                <strong>
                    <asp:Label ID="lbMess" runat="server" CssClass="auto-style12"></asp:Label>
                </strong>
            </div>
            <strong>
                <br />
                <asp:Label ID="Label2" runat="server" CssClass="auto-style1" Text="List of Account"></asp:Label>
                <br />
                <asp:GridView ID="GVlistAccount" DataKeyNames="id" runat="server" AutoGenerateColumns="False" CellPadding="4" OnRowCancelingEdit="GVlistAccount_RowCancelingEdit" OnRowEditing="GVlistAccount_RowEditing" OnRowUpdating="GVlistAccount_RowUpdating" onrowdeleting="GVlistAccount_RowDeleting" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                    <Columns>
                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True">
                        <FooterStyle Wrap="True" />
                        <HeaderStyle Wrap="True" />
                        <ItemStyle Wrap="True" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Username">
                            <EditItemTemplate>
                                <asp:Label ID="lb_Username" runat="server" Text='<%# Bind("Username") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Username") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Password">
                            <EditItemTemplate>
                                <strong>
                                    <asp:TextBox ID="txt_Password" runat="server" Text='<%# Eval("Password") %>' BackColor="White"></asp:TextBox>
                                </strong>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Password") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Role">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddl_Role" runat="server" SelectedValue='<%# Eval("Role") %>'>
                                    <asp:ListItem Value="True">Administrators</asp:ListItem>
                                    <asp:ListItem Value="False">Member</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <strong>
                                <asp:Label ID="lb_Role" runat="server" Text='<%# checkRole(Eval("Role")) %>'></asp:Label>
                                </strong>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
            </strong>
            <br />
        </div>
    </form>
</body>
</html>
