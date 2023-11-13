<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Instructor.aspx.cs" Inherits="KarateSchoolApplication.Instructor1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
                <div class="content">

                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="GreetUserLBL" runat="server" Font-Size="XX-Large"></asp:Label>
                    <asp:GridView ID="MembersGRID" runat="server" CellPadding="4" CssClass="auto-style1" ForeColor="#333333" Width="1100px" style="margin-left: auto; margin-right: auto" AutoGenerateColumns="False" Height="300px" BorderColor="Black" BorderStyle="Outset" BorderWidth="3px">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="section" HeaderText="Section:" HeaderStyle-HorizontalAlign="Center">
                                <HeaderStyle HorizontalAlign="Center" Font-Size="X-Large"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="Larger" />
                            </asp:BoundField>
                            <asp:BoundField DataField="firstName" HeaderText="Member First Name:" HeaderStyle-HorizontalAlign="Center">
                                <HeaderStyle HorizontalAlign="Center" Font-Size="X-Large"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="Larger" />
                            </asp:BoundField>
                            <asp:BoundField DataField="lastName" HeaderText="Member Last Name:" HeaderStyle-HorizontalAlign="Center">
                                <HeaderStyle HorizontalAlign="Center" Font-Size="X-Large"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="Larger" />
                            </asp:BoundField>
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#253D5B" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </div>
            </asp:Content>

