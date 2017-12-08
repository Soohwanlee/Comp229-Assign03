<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Students.aspx.cs" Inherits="Comp229_Assign03.Students" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid">
        <div class="row">
            <h1 class="text-center">Student's Information</h1>
            <div class="col-md-6">
                <h2 style="text-align: center">Personal Information</h2>
                <div>
                    <center>
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                        <Columns>
                            <asp:BoundField HeaderText="Student Number" DataField="StudentID" />
                            <asp:BoundField HeaderText="First Name" DataField="FirstMidName" />
                            <asp:BoundField HeaderText="Last Name" DataField="LastName" />
                            <asp:TemplateField HeaderText="Enrollment Date">
                                <ItemTemplate>
                                    <%# ((DateTime)Eval("EnrollmentDate")).ToString("yyyy-MM-dd")%>
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
                        </center>

                </div>
            </div>

            <div class="col-md-6">

                <h2 style="text-align: center">Course Information</h2>
                <div>
                    <center>
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                        <Columns>
                            <asp:BoundField HeaderText="Cousre Number" DataField="CourseID" />

                            <asp:HyperLinkField HeaderText="Title"
                                DataTextField="Title"
                                DataNavigateUrlFormatString="Course.aspx?CourseID={0}"
                                DataNavigateUrlFields="CourseID" />
                            <asp:BoundField HeaderText="Credit" DataField="Credits" />
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

                    <br />
                   
                    </center>
                </div>
            </div>
            <center>
             <asp:Button CssClass="btn btn-info" ID="btnUpdate" runat="server" Text="Update Info" OnClick="btnUpdate_Click" />
             <asp:Button CssClass="btn btn-danger" ID="btnDelete" runat="server" Text="Delete Info" OnClick="btnDelete_Click" OnClientClick="javascript:return confirm('Are you sure?');" />
                </center>
        </div>


    </div>
</asp:Content>
