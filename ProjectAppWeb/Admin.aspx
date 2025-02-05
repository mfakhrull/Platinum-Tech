<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="ProjectAppWeb.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- SweetAlert2 CSS file -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10" />

    <!-- SweetAlert2 JS file -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <link href="Styles/sign-in.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DataBase %>" DeleteCommand="DELETE FROM [UserAccount] WHERE [Id] = @Id" InsertCommand="INSERT INTO [UserAccount] ([UserName], [PasswordHash], [Role], [Enable]) VALUES (@UserName, @PasswordHash, @Role, @Enable)" SelectCommand="SELECT * FROM [UserAccount]" UpdateCommand="UPDATE [UserAccount] SET [UserName] = @UserName, [PasswordHash] = @PasswordHash, [Role] = @Role, [Enable] = @Enable WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="PasswordHash" Type="String" />
            <asp:Parameter Name="Role" Type="String" />
            <asp:Parameter Name="Enable" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="PasswordHash" Type="String" />
            <asp:Parameter Name="Role" Type="String" />
            <asp:Parameter Name="Enable" Type="Boolean" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <div class="gridview-container">
            <h1>Admin Page</h1>
        <h2>Users</h2>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="Id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="UserName" HeaderText="User Name" SortExpression="UserName" />
                <asp:BoundField DataField="PasswordHash" HeaderText="Password Hash" SortExpression="PasswordHash" />
                <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" />
                <asp:TemplateField HeaderText="Enable">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkEnable" runat="server" Checked='<%# Bind("Enable") %>' Enabled="false" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:CheckBox ID="chkEnableEdit" runat="server" Checked='<%# Bind("Enable") %>' />
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <h2>Sales</h2>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DataBase %>" SelectCommand="spGetSalesWithCombinedItems" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:BoundField DataField="SalesId" HeaderText="Sales ID" SortExpression="SalesId" />
                    <asp:BoundField DataField="CombinedItemIds" HeaderText="Items ID" SortExpression="CombinedItemIds" ReadOnly="True" />
                    <asp:BoundField DataField="TotalQuantity" HeaderText="Total Quantity" SortExpression="TotalQuantity" ReadOnly="True" />
                    <asp:BoundField DataField="SalesDate" HeaderText="Sales Date" ReadOnly="True" SortExpression="SalesDate" />
                    <asp:BoundField DataField="UserName" HeaderText="User" ReadOnly="True" SortExpression="UserName" />
                </Columns>
            </asp:GridView>
    </div>
</asp:Content>
