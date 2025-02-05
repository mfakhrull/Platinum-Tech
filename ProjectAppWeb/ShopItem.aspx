<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ShopItem.aspx.cs" Inherits="ProjectAppWeb.ShopItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- SweetAlert2 CSS file -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10" />

    <!-- SweetAlert2 JS file -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <link href="Styles/StyleSheet1.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="gridview-container">
        <div class="mb-4">
            <div class="card shadow-sm mb-4">
                <div class="card-body">
                    <h4>Sales Items</h4>
                    <div class="row mb-3">
                        <div class="col-auto">
                            <span class="fw-bold">Sales id:</span>
                            <asp:Label ID="lblSalesId" runat="server" CssClass="text-info"></asp:Label>
                        </div>
                        <div class="col-auto">
                            <span class="fw-bold">Date and Time:</span>
                            <asp:Label ID="lblDateTime" runat="server" CssClass="text-info"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="card shadow-sm mb-4">
            <div class="card-body">
                <div class="row mb-4">
                    <div class="col-md-4">
                        <span class="fw-bold">Select category: </span>
                        <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceCategories" DataTextField="CatName" DataValueField="CatId" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" CssClass="form-select mt-2"></asp:DropDownList>
                    </div>
                </div>

                <asp:GridView ID="GridViewItems" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ItemId" DataSourceID="SqlDataSourceItems" OnSelectedIndexChanged="GridViewItems_SelectedIndexChanged" CssClass="table table-striped table-light table-responsive" style="margin-top: 0px">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="ItemId" HeaderText="Item ID" SortExpression="ItemId" />
                        <asp:BoundField DataField="ItemTitle" HeaderText="Item Title" SortExpression="ItemTitle" />
                        <asp:BoundField DataField="ItemPrice" HeaderText="Price" SortExpression="ItemPrice" DataFormatString="RM {0}" />
                        <asp:BoundField DataField="ItemDesc" HeaderText="Description" SortExpression="ItemDesc" />
                        <asp:ImageField DataImageUrlField="ItemImage" DataImageUrlFormatString="Images/{0}" HeaderText="Image">
                            <ControlStyle Width="90px" />
                        </asp:ImageField>
                    </Columns>
                </asp:GridView>

                <div class="mb-3">
                    <div class="row mb-3">
                        <div class="col-md-4">
                            <span class="fw-bold">Item id:</span>
                            <asp:Label ID="lblItemId" runat="server" CssClass="text-secondary"></asp:Label>
                        </div>
                        <div class="col-md-4">
                            <span class="fw-bold">Item title:</span>
                            <asp:Label ID="lblItemTitle" runat="server" CssClass="text-secondary"></asp:Label>
                        </div>
                        <div class="col-md-4">
                            <span class="fw-bold">Item price:</span>
                            <asp:Label ID="lblItemPrice" runat="server" CssClass="text-secondary"></asp:Label>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-4">
                            <span class="fw-bold">Quantity:</span>
                            <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" CssClass="form-control form-control-sm d-inline-block" Style="width: 80px;" Text="1"></asp:TextBox>
                            <asp:Button ID="btnAddItem" runat="server" Text="Add Item to Cart" OnClick="btnAddItem_Click" CssClass="btn btn-primary ms-2" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <asp:Label ID="lblMessage1" runat="server" CssClass="text-info"></asp:Label>
                            <asp:Label ID="lblMessage2" runat="server" CssClass="text-info"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <span class="fw-bold">Total amount in cart:</span>
                            <asp:Label ID="lblTotalAmountCart" runat="server" Text="RM0.00" CssClass="text-success"></asp:Label>
                        </div>
                    </div>
                </div>


                <div>
                    <asp:Button ID="btnViewCart" runat="server" Text="View Cart" OnClick="btnViewCart_Click" /><i class="ms-2 fa-solid fa-cart-shopping"></i>
                </div>
            </div>
        </div>
    </div>
    <br />

    <asp:SqlDataSource ID="SqlDataSourceCategories" runat="server" ConnectionString="<%$ ConnectionStrings:DataBase %>" SelectCommand="SELECT * FROM [Categories] ORDER BY [CatName]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceItems" runat="server" ConnectionString="<%$ ConnectionStrings:DataBase %>" SelectCommand="SELECT * FROM [Items] WHERE ([CatId] = @CatId)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlCategory" Name="CatId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceCart" runat="server" ConnectionString="<%$ ConnectionStrings:DataBase %>" SelectCommand="spSalesGotItems" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblSalesId" Name="salesid" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>


