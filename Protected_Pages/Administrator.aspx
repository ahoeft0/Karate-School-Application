<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Administrator.aspx.cs" Inherits="KarateSchoolApplication.Administrator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
                <div class="content">

                    <div class="content">
                        <br />
                        <table class="w-100">
                            <tr>
                                <td class="auto-style2">
                                    <asp:Label ID="Label31" runat="server" Font-Bold="True" Font-Underline="True" Text="Members"></asp:Label>
                                    <br />
                                    <asp:GridView ID="MemberGridView" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="425px">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:CommandField ShowDeleteButton="True" />
                                        </Columns>
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
                                <td class="auto-style2">
                                    <asp:Label ID="Label32" runat="server" Font-Bold="True" Font-Underline="True" Text="Instructors"></asp:Label>
                                    <br />
                                    <asp:GridView ID="InstructorGridView" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="477px">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:CommandField ShowDeleteButton="True" />
                                        </Columns>
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
                                <td class="auto-style4">
                                    <asp:Label ID="Label24" runat="server" Font-Bold="True" Font-Underline="True" Text="New Member Information:"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label3" runat="server" Text="User Name:"></asp:Label>
                                    &nbsp;&nbsp;
                                    <asp:TextBox ID="MUserNameTxt" runat="server" Width="170px"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label4" runat="server" Text="User Password:"></asp:Label>
                                    &nbsp;&nbsp;
                                    <asp:TextBox ID="MPasswordTxt" runat="server" Width="170px"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label5" runat="server" Text="First Name:"></asp:Label>
                                    &nbsp;&nbsp;
                                    <asp:TextBox ID="MFirstNameTxt" runat="server" Width="170px"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label6" runat="server" Text="Last Name:"></asp:Label>
                                    &nbsp;&nbsp;
                                    <asp:TextBox ID="MLastNameTxt" runat="server" Width="170px"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label7" runat="server" Text="Date Joined:"></asp:Label>
                                    &nbsp;&nbsp;
                                    <asp:TextBox ID="MDateJoinedTxt" runat="server" Width="170px"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label8" runat="server" Text="Phone Number:"></asp:Label>
                                    &nbsp;&nbsp;
                                    <asp:TextBox ID="MPhoneNumberTxt" runat="server" Width="170px"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label9" runat="server" Text="Email:"></asp:Label>
                                    &nbsp;&nbsp;
                                    <asp:TextBox ID="MEmailTxt" runat="server" Width="170px"></asp:TextBox>
                                    <br />
                                    &nbsp;<br />
                                    <asp:Button ID="MemberAddButton" runat="server" OnClick="MemberAddButton_Click" Text="Add" Width="127px" />
                                    &nbsp;&nbsp;
                                    <asp:Button ID="MemberDeleteBtn" runat="server" OnClick="MemberDeleteBtn_Click" Text="Delete" Width="127px" />
                                </td>
                                <td class="auto-style1">
                                    <asp:Label ID="Label25" runat="server" Font-Bold="True" Font-Underline="True" Text="New Instructor Information:"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label26" runat="server" Text="User Name:"></asp:Label>
                                    &nbsp;&nbsp;
                                    <asp:TextBox ID="IUserNameTxt" runat="server" Width="170px"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label27" runat="server" Text="User Password:"></asp:Label>
                                    &nbsp;&nbsp;
                                    <asp:TextBox ID="IPasswordTxt" runat="server" Width="170px"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label28" runat="server" Text="First Name:"></asp:Label>
                                    &nbsp;&nbsp;
                                    <asp:TextBox ID="IFirstNameTxt" runat="server" Width="170px"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label29" runat="server" Text="Last Name:"></asp:Label>
                                    &nbsp;&nbsp;
                                    <asp:TextBox ID="ILastNameTxt" runat="server" Width="170px"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label30" runat="server" Text="Phone Number"></asp:Label>
                                    &nbsp;&nbsp;
                                    <asp:TextBox ID="IPhoneNumberTxt" runat="server" Width="170px"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Button ID="InstructorAddButton" runat="server" OnClick="InstructorAddButton_Click" Text="Add" Width="127px" />
                                    &nbsp;&nbsp;
                                    <asp:Button ID="InstructorDeleteBtn" runat="server" OnClick="InstructorDeleteBtn_Click" Text="Delete" Width="127px" />
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:TextBox ID="TxtDob" runat="server" Text='<%# Bind("DateofBirth", "{0:yyyy-MM-dd}") %>' TextMode="Date"></asp:TextBox> </EditItemTemplate>
                    </div>

                    <br />
                    <br />

                </div>
            </asp:Content>


