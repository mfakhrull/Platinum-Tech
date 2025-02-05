<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ProjectAppWeb.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DataBase %>" SelectCommand="SELECT [ItemTitle], [ItemPrice], [ItemDesc], [ItemImage] FROM [Items]"></asp:SqlDataSource>
    <div class="gridview-container">
        <div class="card shadow-sm mb-4">
            <div class="card-body d-flex align-items-center justify-content-center">
                <div class="row">
                    <div class="col-auto">
                        <div class="col">
                            <h4>Welcome To Platinum Tech</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="table table-striped table-light table-responsive">
            <Columns>
                <asp:BoundField DataField="ItemTitle" HeaderText="Item Name" SortExpression="ItemTitle" />
                <asp:BoundField DataField="ItemPrice" HeaderText="Price" SortExpression="ItemPrice" DataFormatString="RM {0}"/>
                <asp:BoundField DataField="ItemDesc" HeaderText="Description" SortExpression="ItemDesc" />
                <asp:ImageField DataImageUrlField="ItemImage" DataImageUrlFormatString="Images/{0}" HeaderText="Image">
                    <ControlStyle Height="90px" />
                </asp:ImageField>
            </Columns>
        </asp:GridView>
    </div>

</asp:Content>
