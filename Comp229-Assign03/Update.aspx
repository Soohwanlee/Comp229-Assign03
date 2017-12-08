<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="Comp229_Assign03.Update" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row">
            <h1 class="text-center">Update Student's Information</h1>
            <div>
                <center>

                    <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" DataKeyNames="StudentID" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                        <Columns>
                            <asp:BoundField HeaderText="StudentID" DataField="StudentID" InsertVisible="False" ReadOnly="True" SortExpression="StudentID" />
                            <asp:BoundField HeaderText="LastName" DataField="LastName" SortExpression="LastName" />
                            <asp:BoundField HeaderText="FirstMidName" DataField="FirstMidName" SortExpression="FirstMidName" />
                            <asp:BoundField DataField="EnrollmentDate" HeaderText="EnrollmentDate" SortExpression="EnrollmentDate" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Comp229Assign03ConnectionString %>" 
                        SelectCommand="SELECT * FROM [Students] WHERE ([StudentID] = @StudentID)"
                        UpdateCommand="update Comp229Assign03.[dbo].Students set [FirstMidName] =@FirstMidName, [LastName]=@LastName, [EnrollmentDate]=@EnrollmentDate Where [StudentID]=@StudentID"
                        >
                        <SelectParameters>
                            <asp:QueryStringParameter Name="StudentID" QueryStringField="StudentID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                        </center>
            </div>

        </div>

    </div>

</asp:Content>
