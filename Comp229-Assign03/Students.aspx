<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Students.aspx.cs" Inherits="Comp229_Assign03.Students" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid">
        <div class="row">
            <h1 class="text-center">Student's Information</h1>
            <div class="col-md-6">
                <h2>Personal Information</h2>
                <div>
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false">
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
                    </asp:GridView>
                    <hr />
                </div>
            </div>

            <div class="col-md-6">

                <h2>Course Information</h2>
                <div>
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField HeaderText="Cousre Number" DataField="CourseID" />

                            <asp:HyperLinkField HeaderText="Title"
                                DataTextField="Title"
                                DataNavigateUrlFormatString="Course.aspx?CourseID={0}"
                                DataNavigateUrlFields="CourseID" />
                            <asp:BoundField HeaderText="Credit" DataField="Credits" />
                        </Columns>
                    </asp:GridView>
                    <hr />
                </div>
            </div>

        </div>
        <asp:Button CssClass="btn btn-info" ID="btnUpdate" runat="server" Text="Update Info" OnClick="btnUpdate_Click"/>
        <asp:Button CssClass="btn btn-info" ID="btnDelete" runat="server" Text="Delete Info" OnClick="btnDelete_Click" />

    </div>
</asp:Content>
