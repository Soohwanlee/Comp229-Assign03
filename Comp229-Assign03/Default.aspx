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
            <h2>Current Student's list</h2>
                <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">
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
                            <%# Eval("EnrollmentDate")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
                    <hr />
                </div>
        </div>

        <div class="col-md-6">

            <h2>Registration</h2>
            First Name : <asp:TextBox ID="txtFname" runat="server"></asp:TextBox><br />
            Last Name : <asp:TextBox ID="txtLname" runat="server"></asp:TextBox><br />
        <asp:Button CssClass="btn btn-info" ID="btnWrite" runat="server" Text="Submit" OnClick="btnWrite_Click" />
        <hr />
            <asp:Label ID="lblDisplay" runat="server"></asp:Label>
                    
        </div>

    </div>

</asp:Content>
