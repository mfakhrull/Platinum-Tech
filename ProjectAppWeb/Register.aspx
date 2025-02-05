<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ProjectAppWeb.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- SweetAlert2 CSS file -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10"/>

    <!-- SweetAlert2 JS file -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <link href="Styles/sign-in.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex align-items-center py-4 bg-body-tertiary actbody">
    <div class="form-signin w-100 m-auto">
        <img src="Images/logo-platinum.png" class="mb-2 mx-auto d-block" alt="" width="190" height="150"/>
        <h1 class="h3 mb-3 fw-normal">Please Register</h1>
        <div class="form-floating">
            Enter email as your username:
            <asp:TextBox ID="txtUserName" runat="server"  CssClass="form-control floatingPassword form-signin-email"></asp:TextBox>
        </div>
        <div class="form-floating">
            Enter Password:
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control floatingPassword form-signin-password"></asp:TextBox>
        </div>
        <p>
            <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" CssClass="btn btn-primary w-100 py-2" />
        </p>
        <p>
            <asp:Label ID="lblStatus" runat="server" Text="Status: "></asp:Label>
        </p>
    </div>
</div>
</asp:Content>
