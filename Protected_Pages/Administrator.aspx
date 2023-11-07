<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Administrator.aspx.cs" Inherits="KarateSchoolApplication.Administrator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 222px;
            width: 519px;
        }
        .auto-style2 {
            height: 240px;
            width: 519px;
        }
        .auto-style3 {
            height: 240px;
            width: 507px;
        }
        .auto-style4 {
            height: 222px;
            width: 507px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
                <div class="content">

                    <br />
                    <table class="w-100">
                        <tr>
                            <td class="auto-style3" style="vertical-align: top; text-align: center">
                                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Underline="True" Text="Members"></asp:Label>
                                <br />
                                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="510px">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                </asp:GridView>
                            </td>
                            <td class="auto-style2" style="vertical-align: top; text-align: center">
                                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Underline="True" Text="Instructors"></asp:Label>
                                <br />
                                <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="500px">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4" style="vertical-align: top; text-align: center">
                                <asp:Label ID="Label24" runat="server" Font-Bold="True" Font-Underline="True" Text="New Member Information:"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="Label3" runat="server" Text="User Name:"></asp:Label>
&nbsp;&nbsp;
                                <asp:TextBox ID="TextBox1" runat="server" Width="170px"></asp:TextBox>
                                <br />
                                <br />
                                <asp:Label ID="Label4" runat="server" Text="User Password:"></asp:Label>
&nbsp;&nbsp;
                                <asp:TextBox ID="TextBox2" runat="server" Width="170px"></asp:TextBox>
                                <br />
                                <br />
                                <asp:Label ID="Label5" runat="server" Text="First Name:"></asp:Label>
&nbsp;&nbsp;
                                <asp:TextBox ID="TextBox3" runat="server" Width="170px"></asp:TextBox>
                                <br />
                                <br />
                                <asp:Label ID="Label6" runat="server" Text="Last Name:"></asp:Label>
&nbsp;&nbsp;
                                <asp:TextBox ID="TextBox4" runat="server" Width="170px"></asp:TextBox>
                                <br />
                                <br />
                                <asp:Label ID="Label7" runat="server" Text="Date Joined:"></asp:Label>
&nbsp;&nbsp;
                                <asp:TextBox ID="TextBox5" runat="server" Width="170px"></asp:TextBox>
                                <br />
                                <br />
                                <asp:Label ID="Label8" runat="server" Text="Phone Number:"></asp:Label>
&nbsp;&nbsp;
                                <asp:TextBox ID="TextBox6" runat="server" Width="170px"></asp:TextBox>
                                <br />
                                <br />
                                <asp:Label ID="Label9" runat="server" Text="Email:"></asp:Label>
&nbsp;&nbsp;
                                <asp:TextBox ID="TextBox7" runat="server" Width="170px"></asp:TextBox>
                                <br />
&nbsp;<br />
                                <asp:Button ID="Button1" runat="server" Text="Add" Width="127px" />
                            </td>
                            <td class="auto-style1" style="text-align: center; vertical-align: top">
                                <asp:Label ID="Label25" runat="server" Font-Bold="True" Font-Underline="True" Text="New Instructor Information:"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="Label26" runat="server" Text="User Name:"></asp:Label>
&nbsp;&nbsp;
                                <asp:TextBox ID="TextBox8" runat="server" Width="170px"></asp:TextBox>
                                <br />
                                <br />
                                <asp:Label ID="Label27" runat="server" Text="User Password:"></asp:Label>
&nbsp;&nbsp;
                                <asp:TextBox ID="TextBox9" runat="server" Width="170px"></asp:TextBox>
                                <br />
                                <br />
                                <asp:Label ID="Label28" runat="server" Text="First Name:"></asp:Label>
&nbsp;&nbsp;
                                <asp:TextBox ID="TextBox10" runat="server" Width="170px"></asp:TextBox>
                                <br />
                                <br />
                                <asp:Label ID="Label29" runat="server" Text="Last Name:"></asp:Label>
&nbsp;&nbsp;
                                <asp:TextBox ID="TextBox11" runat="server" Width="170px"></asp:TextBox>
                                <br />
                                <br />
                                <asp:Label ID="Label30" runat="server" Text="Phone Number"></asp:Label>
&nbsp;&nbsp;
                                <asp:TextBox ID="TextBox12" runat="server" Width="170px"></asp:TextBox>
                                <br />
                                <br />
                                <asp:Button ID="Button2" runat="server" Text="Add" Width="127px" />
                            </td>
                        </tr>
                    </table>
                    <br />

                </div>
            </asp:Content>


