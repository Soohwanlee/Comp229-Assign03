<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Comp229_Assign03._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <div class="container-fluid">
        <div class="row">
            <!--I got this image from picture of the Seoul university's hospital  -->
            <img src="Assets/images/school.jpg" alt="School" class="img-rounded img-responsive center-block">
        </div>
    </div>

    <div class="row">
        <h1 class="text-center">Welcome to Suwon College!</h1>
        <div class="col-md-6">
            <h2 style="text-align: center">Current Student's list</h2>
            <div class="center-block">
                <center>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                <Columns>
                    <asp:BoundField HeaderText="Student Number" DataField="StudentID" />

                    <asp:HyperLinkField HeaderText="First Name" 
                        DataTextField="FirstMidName" 
                        DataNavigateUrlFormatString="Students.aspx?StudentID={0}"
                        DataNavigateUrlFields="StudentID"
                        />
                        
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

            <h2 style="text-align: center">Registration</h2>
            <center>
            <div style="padding:5px">
            First Name : <asp:TextBox ID="txtFname" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="valFirstName" runat="server" ControlToValidate="txtFname" Display="Dynamic" ErrorMessage="Please input First Name!"></asp:RequiredFieldValidator>
                <br />
            </div>
            <div style="padding:5px">
            Last Name : <asp:TextBox ID="txtLname" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="valLastName" runat="server" ControlToValidate="txtLname" Display="Dynamic" ErrorMessage="Please input Last Name!"></asp:RequiredFieldValidator>
                <br />
            <br />
            </div>
        <asp:Button CssClass="btn btn-info" ID="btnWrite" runat="server" Text="Submit" OnClick="btnWrite_Click" />
        </div>
        </center>
    </div>

</asp:Content>
