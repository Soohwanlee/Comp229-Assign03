<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="Comp229_Assign03.Update" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row">
                <h1 class="text-center">Update Student's Information</h1>
                <div>

                    <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" DataKeyNames="StudentID" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField HeaderText="StudentID" DataField="StudentID" InsertVisible="False" ReadOnly="True" SortExpression="StudentID" />
                            <asp:BoundField HeaderText="LastName" DataField="LastName" SortExpression="LastName" />
                            <asp:BoundField HeaderText="FirstMidName" DataField="FirstMidName" SortExpression="FirstMidName" />
                            <asp:BoundField DataField="EnrollmentDate" HeaderText="EnrollmentDate" SortExpression="EnrollmentDate" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Comp229Assign03ConnectionString %>" 
                        SelectCommand="SELECT * FROM [Students] WHERE ([StudentID] = @StudentID)"
                        UpdateCommand="update Comp229Assign03.[dbo].Students set [FirstMidName] =@FirstMidName, [LastName]=@LastName, [EnrollmentDate]=@EnrollmentDate Where [StudentID]=@StudentID"
                        >
                        <SelectParameters>
                            <asp:QueryStringParameter Name="StudentID" QueryStringField="StudentID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>

        </div>

    </div>

</asp:Content>
