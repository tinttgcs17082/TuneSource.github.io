<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="Management_CD.Details" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Tune Source</title>
    <style type="text/css">
        
        .auto-style3 {
            text-align: center;
        }

        .auto-style4 {
            text-align: center;
            font-size: xx-large;
        }
    </style>
</head>

<body>
    <form runat="server">
        <div>
            <div class="auto-style3">
                <strong>
                    <asp:Label ID="Label5" runat="server" CssClass="auto-style4" Text="TUNESOURCE"></asp:Label>
                </strong>
                <br />
                &nbsp;<asp:HyperLink ID="hlHome" runat="server" NavigateUrl="~/Home.aspx">Home</asp:HyperLink>
                <div align="center">
                    <asp:DetailsView ID="dvDetails" runat="server" AutoGenerateRows="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" CssClass="auto-style2" Height="268px" Width="314px" ForeColor="Black">
                        <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <Fields>
                            <asp:TemplateField HeaderText="CD ID" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Picture" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" Height="196px" ImageUrl='<%# Bind("Picture") %>' Width="203px" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Title:">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Singer:">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Singer") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Unit Price:">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Price") %>' CssClass="auto-style6"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Download" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbDownload" runat="server" CommandArgument='<%# Bind("Music") %>' OnCommand="lbDownload_Command">Download</asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Fields>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle ForeColor="Black" HorizontalAlign="Center" BackColor="#CCCCCC" />
                        <RowStyle BackColor="White" />
                    </asp:DetailsView>
                    <br />
                    <div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>

</html>
