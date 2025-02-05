<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginStatus.ascx.cs" Inherits="ProjectAppWeb.UserControls.LoginStatus" %>

<div class="d-flex justify-content-end me-5">
    <div class="login-status">
        <asp:HyperLink ID="HyperLinkLogin" runat="server" NavigateUrl="~/Login.aspx" CssClass="btn btn-primary">Login</asp:HyperLink>
        &nbsp;&nbsp;
    <asp:HyperLink ID="HyperLinkRegister" runat="server" NavigateUrl="~/Register.aspx" CssClass="btn btn-secondary">Register</asp:HyperLink>
        &nbsp;&nbsp;
    <asp:Label ID="lblLoginStatus" runat="server" CssClass="text-info"></asp:Label>&nbsp;&nbsp;
    <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" CssClass="btn btn-danger" />
    <asp:Button ID="btnPurchase" runat="server" Text="Purchase" OnClick="btnPurchase_Click" CssClass="btn btn-primary" Visible="False" />
    </div>
</div>
