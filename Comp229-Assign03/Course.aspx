<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Course.aspx.cs" Inherits="Comp229_Assign03.Course" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid">
        <div class="row">
            <h1 class="text-center">Course's Information</h1>
            <div class="col-md-6">
                <h2 style="text-align: center">Enrolled Studnets</h2>
                <div>
                    <center>
                    <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
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

                <h2 style="text-align: center">Add a student for this course</h2>
                <center>
            Student ID : <asp:TextBox ID="txtStudnetID" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="valAddion" runat="server" ControlToValidate="txtStudnetID" Display="Dynamic" ErrorMessage="Please input Student ID!"></asp:RequiredFieldValidator>
                    <br />
            <br />
        <asp:Button CssClass="btn btn-info" ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click"/>
        <asp:Button CssClass="btn btn-danger" ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click"/>
            </center>
            </div>

        </div>

    </div>
</asp:Content>
