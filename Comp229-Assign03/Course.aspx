<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Course.aspx.cs" Inherits="Comp229_Assign03.Course" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid">
        <div class="row">
            <h1 class="text-center">Course's Information</h1>
            <div class="col-md-6">
                <h2>Enrolled Studnets</h2>
                <div>
                    <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="false">
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

            <h2>Add a student for this course</h2>
            Student ID : <asp:TextBox ID="txtStudnetID" runat="server"></asp:TextBox><br />
            <br />
        <asp:Button CssClass="btn btn-info" ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click"/>
        <asp:Button CssClass="btn btn-info" ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click"/>

        </div>

        </div>

    </div>
</asp:Content>
