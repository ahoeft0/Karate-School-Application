<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Administrator.aspx.cs" Inherits="KarateSchoolApplication.Administrator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .content {
            text-align: center;
        }

        .content div {
            display: inline-block;
            margin: 0 10px;
            vertical-align: top;
        }

        .centered-container {
            margin-left: auto;
            margin-right: auto;
            text-align: left; 
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <div class="content">
        <div class="centered-container">
            <asp:RadioButtonList ID="PageSelectRBTN" runat="server" OnSelectedIndexChanged="PageSelectRBTN_SelectedIndexChanged" RepeatDirection="Horizontal" AutoPostBack="True" Width="700px" Font-Size="XX-Large">
                <asp:ListItem Value="0" Selected="True">Member</asp:ListItem>
                <asp:ListItem Value="1">Instructor</asp:ListItem>
                <asp:ListItem Value="2">Section</asp:ListItem>
            </asp:RadioButtonList>
            <br />
        </div>
        <br />
        <asp:MultiView ID="UserMULTI" runat="server" ActiveViewIndex="0">
            <asp:View ID="MemberVIEW" runat="server">
                <div>
                    <div>
                        <asp:Label ID="Label31" runat="server" Font-Bold="True" Font-Underline="True" Text="Members" Font-Size="X-Large"></asp:Label>
                        <br />
                        <asp:GridView ID="MemberGridView" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="570px" DataKeyNames="Member_UserID" AutoGenerateColumns="False">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="memberFirstName" HeaderText="First Name:">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="memberLastName" HeaderText="Last Name:">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="memberPhoneNumber" HeaderText="Phone Number:">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="memberDateJoined" HeaderText="Member Date Joined:">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
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
                        <asp:Button ID="MemberDeleteBtn" runat="server" OnClick="MemberDeleteBtn_Click" Text="Delete" Width="127px" BackColor="#8F91A2" />
                        <br />
                        <br />
                    </div>
                    
                    <div>
                        <asp:Label ID="Label24" runat="server" Font-Bold="True" Font-Underline="True" Text="New Member Information:" Font-Size="X-Large"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="Label3" runat="server" Text="User Name:"></asp:Label>
                        &nbsp;&nbsp;
                        <asp:TextBox ID="MUserNameTxt" runat="server" Width="170px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="MUserNameTxt" Display="Dynamic" ErrorMessage="Please enter User Name" ForeColor="Red" ValidationGroup="MemberGroup"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                        <asp:Label ID="Label4" runat="server" Text="User Password:"></asp:Label>
                        &nbsp;&nbsp;
                        <asp:TextBox ID="MPasswordTxt" runat="server" Width="170px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="MPasswordTxt" Display="Dynamic" ErrorMessage="Please enter User Password" ForeColor="Red" ValidationGroup="MemberGroup"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                        <asp:Label ID="Label5" runat="server" Text="First Name:"></asp:Label>
                        &nbsp;&nbsp;
                        <asp:TextBox ID="MFirstNameTxt" runat="server" Width="170px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="MFirstNameTxt" Display="Dynamic" ErrorMessage="Please enter First Name" ForeColor="Red" ValidationGroup="MemberGroup"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                        <asp:Label ID="Label6" runat="server" Text="Last Name:"></asp:Label>
                        &nbsp;&nbsp;
                        <asp:TextBox ID="MLastNameTxt" runat="server" Width="170px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="MLastNameTxt" Display="Dynamic" ErrorMessage="Please enter Last Name" ForeColor="Red" ValidationGroup="MemberGroup"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                        <asp:Label ID="Label7" runat="server" Text="Date Joined:"></asp:Label>
                        &nbsp;&nbsp;
                        <asp:TextBox ID="MDateJoinedTxt" runat="server" Text='<%# Bind("DateofBirth", "{0:yyyy-MM-dd}") %>' TextMode="Date"></asp:TextBox> </EditItemTemplate>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="MDateJoinedTxt" Display="Dynamic" ErrorMessage="Please enter Date Joined" ForeColor="Red" ValidationGroup="MemberGroup"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                        <asp:Label ID="Label8" runat="server" Text="Phone Number:"></asp:Label>
                        &nbsp;&nbsp;
                        <asp:TextBox ID="MPhoneNumberTxt" runat="server" Width="170px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="MPhoneNumberTxt" Display="Dynamic" ErrorMessage="Please enter Phone Number" ForeColor="Red" ValidationGroup="MemberGroup"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                        <asp:Label ID="Label9" runat="server" Text="Email:"></asp:Label>
                        &nbsp;&nbsp;
                        <asp:TextBox ID="MEmailTxt" runat="server" Width="170px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="MEmailTxt" Display="Dynamic" ErrorMessage="Please enter Email" ForeColor="Red" ValidationGroup="MemberGroup"></asp:RequiredFieldValidator>
                        <br />
                        &nbsp;<br />
                        <asp:Button ID="MemberAddButton" runat="server" OnClick="MemberAddButton_Click" Text="Add" Width="127px" ValidationGroup="MemberGroup" BackColor="#8F91A2" />
                    </div>
                </div>
            </asp:View>

                <asp:View ID="InstructorVIEW" runat="server">
                    <div>
                        <div>
                            <asp:Label ID="Label32" runat="server" Font-Bold="True" Font-Underline="True" Text="Instructors" Font-Size="X-Large"></asp:Label>
                            <br />
                            <asp:GridView ID="InstructorGridView" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="477px" DataKeyNames="InstructorID" AutoGenerateColumns="False">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:CommandField ShowSelectButton="True" />
                                    <asp:BoundField DataField="instructorID" HeaderText="ID:">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="instructorFirstName" HeaderText="First Name:">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="instructorLastName" HeaderText="Last Name:">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
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
                            <asp:Button ID="InstructorDeleteBtn" runat="server" OnClick="InstructorDeleteBtn_Click" Text="Delete" Width="127px" BackColor="#8F91A2" />
                        </div>

                        <div>
                            <asp:Label ID="Label25" runat="server" Font-Bold="True" Font-Underline="True" Text="New Instructor Information:" Font-Size="X-Large"></asp:Label>
                            <br />
                            <br />
                            <asp:Label ID="Label26" runat="server" Text="User Name:"></asp:Label>
                            &nbsp;&nbsp;
                            <asp:TextBox ID="IUserNameTxt" runat="server" Width="170px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="IUserNameTxt" Display="Dynamic" ErrorMessage="Please enter User Name" ForeColor="Red" ValidationGroup="InstructorGroup"></asp:RequiredFieldValidator>
                            <br />
                            <br />
                            <asp:Label ID="Label27" runat="server" Text="User Password:"></asp:Label>
                            &nbsp;&nbsp;
                            <asp:TextBox ID="IPasswordTxt" runat="server" Width="170px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="IPasswordTxt" Display="Dynamic" ErrorMessage="Please enter User Password" ForeColor="Red" ValidationGroup="InstructorGroup"></asp:RequiredFieldValidator>
                            <br />
                            <br />
                            <asp:Label ID="Label28" runat="server" Text="First Name:"></asp:Label>
                            &nbsp;&nbsp;
                            <asp:TextBox ID="IFirstNameTxt" runat="server" Width="170px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="IFirstNameTxt" Display="Dynamic" ErrorMessage="Please enter First Name" ForeColor="Red" ValidationGroup="InstructorGroup"></asp:RequiredFieldValidator>
                            <br />
                            <br />
                            <asp:Label ID="Label29" runat="server" Text="Last Name:"></asp:Label>
                            &nbsp;&nbsp;
                            <asp:TextBox ID="ILastNameTxt" runat="server" Width="170px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="ILastNameTxt" Display="Dynamic" ErrorMessage="Please enter Last Name" ForeColor="Red" ValidationGroup="InstructorGroup"></asp:RequiredFieldValidator>
                            <br />
                            <br />
                            <asp:Label ID="Label30" runat="server" Text="Phone Number"></asp:Label>
                            &nbsp;&nbsp;
                            <asp:TextBox ID="IPhoneNumberTxt" runat="server" Width="170px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="IPhoneNumberTxt" Display="Dynamic" ErrorMessage="Please enter Phone Number" ForeColor="Red" ValidationGroup="InstructorGroup"></asp:RequiredFieldValidator>
                            <br />
                            <br />
                            <asp:Button ID="InstructorAddButton" runat="server" OnClick="InstructorAddButton_Click" Text="Add" Width="127px" ValidationGroup="InstructorGroup" BackColor="#8F91A2" />  
                        </div>
                    </div>
                </asp:View>

                <asp:View ID="SectionVIEW" runat="server">
                    <div>
                        <div>
                            <asp:Label ID="Label33" runat="server" Font-Bold="True" Font-Underline="True" Text="Members" Font-Size="X-Large"></asp:Label>
                            <br />
                            <asp:GridView ID="SectionMemberGridView" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="425px" DataKeyNames="Member_UserID" AutoGenerateColumns="False">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:CommandField ShowSelectButton="True" />
                                    <asp:BoundField DataField="memberFirstName" HeaderText="First Name:">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="memberLastName" HeaderText="Last Name:">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="memberPhoneNumber" HeaderText="Phone Number:">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="memberDateJoined" HeaderText="Member Date Joined:">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
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
                        </div>
                        
                        <div>
                            <asp:Label ID="Label34" runat="server" Font-Bold="True" Font-Underline="True" Text="Sections" Font-Size="X-Large"></asp:Label>
                            <asp:GridView ID="SectionGridView" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="SectionID" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:CommandField ShowSelectButton="True" />
                                    <asp:BoundField DataField="sectionName" HeaderText="Section Name:" />
                                    <asp:BoundField DataField="sectionStartDate" HeaderText="Start Date:" />
                                    <asp:BoundField DataField="sectionInstructor" HeaderText="Instructor ID:" />
                                    <asp:BoundField DataField="sectionFee" HeaderText="Section Fee:" />
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
                            <br />
                            <br />
                            <asp:Button ID="MAddSectionBtn" runat="server" Text="Add to Section" BackColor="#8F91A2" />
                        </div>
                    </div>
                </asp:View>
        </asp:MultiView>
        <br />
    </div>
</asp:Content>


