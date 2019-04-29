<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CD_Management.aspx.cs" Inherits="Management_CD.Admin.CD_Management" %>

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
            width: 424px;
        }

        .auto-style8 {
            height: 23px;
            text-align: left;
        }

        .auto-style10 {
            text-align: right;
            width: 424px;
            height: 26px;
        }

        .auto-style11 {
            text-align: left;
            height: 26px;
        }

        .auto-style17 {
            text-align: right;
            width: 424px;
            height: 41px;
        }
        .auto-style18 {
            text-align: left;
            height: 41px;
        }
        .auto-style14 {
            width: 20%;
            margin-left: 0px;
            height: 38px;
        }
        .auto-style15 {
            width: 165px;
        }
        .auto-style19 {
            height: 43px;
        }
        .auto-style20 {
            height: 69px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <div align="center" class="auto-style19">
            <strong>
            <table align="right" class="auto-style14">
                <tr>
                    <td class="auto-style15">
                        <asp:HyperLink ID="hlAccount" runat="server" NavigateUrl="~/admin/Account_Management.aspx">Account Management</asp:HyperLink>
                    </td>
                    <td>
                        <asp:HyperLink ID="hlBook" runat="server" NavigateUrl="~/Admin/CD_Management.aspx">CD Management</asp:HyperLink>
                    </td>
                </tr>
            </table>
            </strong>
        </div>
        <div class="auto-style20">
            <strong>
            <br />
            <asp:Label ID="Label1" runat="server" CssClass="auto-style1" Text="CDs MANAGEMENT"></asp:Label>
            </strong>
        </div>
        <div align="center">
            <div class="auto-style4">
                <strong>
                <br />
                ADD NEW CD<br />
                </strong>
            </div>
            <div>
                <table class="auto-style2">
                    <tr>
                        <td class="auto-style6">CD title:</td>
                        <td class="auto-style8">
                            <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style10">&nbsp;Singer:</td>
                        <td class="auto-style11">
                            <asp:TextBox ID="txtSinger" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style10">Unit price:</td>
                        <td class="auto-style11">
                            <asp:TextBox ID="TxtPrice" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style17">CD path:</td>
                        <td class="auto-style18">
                            <asp:FileUpload ID="FUCDs" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style17">Image path:</td>
                        <td class="auto-style18">
                            <asp:FileUpload ID="FUImg" runat="server" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Create New" />
                <br />
                <br />
                <strong>
                <asp:Label ID="lbMess" runat="server" CssClass="auto-style12" style="color: #CC0000"></asp:Label>
                </strong>
            </div>
            <strong>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" CssClass="auto-style1" Text="List of CDs"></asp:Label>
            <br />
            <asp:GridView ID="GVlistCDs" runat="server" BackColor="White" BorderColor="#999999" CssClass="auto-style13" Height="115px" DataKeyNames="id" OnRowDeleting="GVListofCD_RowDeleting" Width="1304px" AutoGenerateColumns="False" OnRowCancelingEdit="GVlistCDs_RowCancelingEdit" OnRowEditing="GVlistCDs_RowEditing" OnRowUpdating="GVlistCDs_RowUpdating" style="margin-left: 0px" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" HeaderText="Action" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:CommandField>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" >
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Title">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_Title" runat="server" Text='<%# Eval("Title") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbTitle" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Singer">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_Singer" runat="server" Text='<%# Eval("Singer") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbSinger" runat="server" Text='<%# Eval("Singer") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Unit Price">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_Price" runat="server" Text='<%# Eval("Price") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <strong>
                            <asp:Label ID="lbPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                            </strong>
                        </ItemTemplate>
                        <ItemStyle Font-Italic="False" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Music">
                        <EditItemTemplate>
                            <asp:FileUpload ID="FU_Music" runat="server" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <strong>
                            <asp:Label ID="lbMusic" runat="server" Text='<%# Eval("Music") %>'></asp:Label>
                            </strong>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Picture">
                        <EditItemTemplate>
                            <strong>
                            <asp:FileUpload ID="FU_Picture" runat="server" />
                            </strong>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <strong>
                            <asp:Label ID="lbPicture" runat="server" Text='<%# Bind("Picture") %>'></asp:Label>
                            </strong>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
            </strong>
            <br />
        </div>
    </form>
</body>
</html>
