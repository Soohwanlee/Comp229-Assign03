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
            <asp:Button ID="btnSqlCommand" runat="server" Text="입력예시문 실행" OnClick="btnSqlCommand_Click" />
            <hr />
            <asp:Label ID="lblDisplay" runat="server"></asp:Label>

        </div>
        <div class="col-md-6">
            <h2>Registration</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>

    </div>

</asp:Content>
