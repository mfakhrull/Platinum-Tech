<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="SalesCart.aspx.cs" Inherits="ProjectAppWeb.SalesCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- SweetAlert2 CSS file -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10" />

    <!-- SweetAlert2 JS file -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <link href="Styles/StyleSheet1.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h4>Sales Cart</h4>
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

        <div class="row">
            <div class="col">
                <asp:GridView ID="GridViewCart" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceCart" CssClass="table table-striped table-light table-responsive">
                    <Columns>
                        <asp:BoundField DataField="ItemId" HeaderText="ItemId" SortExpression="ItemId" />
                        <asp:BoundField DataField="ItemTitle" HeaderText="Item" SortExpression="ItemTitle" />
                        <asp:BoundField DataField="ItemPrice" DataFormatString="RM {0}" HeaderText="Price" SortExpression="ItemPrice" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                        <asp:BoundField DataField="SubTotal" DataFormatString="RM {0}" HeaderText="SubTotal" ReadOnly="True" SortExpression="SubTotal" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-auto">
                <span class="fw-bold">Total amount:</span>
                <asp:Label ID="lblTotalAmountCart" runat="server" Text="RM0.00" CssClass="text-success"></asp:Label>
            </div>
        </div>

        <div class="row">
            <div class="col-auto">
                <asp:Button ID="btnConfirm" runat="server" Text="Confirm Sales" OnClick="btnConfirm_Click" OnClientClick="toggleCardVisibility();" CssClass="btn btn-success" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel Sales" OnClick="btnCancel_Click" CssClass="btn btn-danger ms-2" />
                <asp:Button ID="btnNew" runat="server" Text="New Sales" OnClick="btnNew_Click" CssClass="btn btn-primary ms-2" />
            </div>
        </div>

        <div class="row">
            <div class="col">
                <asp:Label ID="lblMessage2" runat="server" CssClass="text-info"></asp:Label>
            </div>
        </div>
        <asp:HiddenField ID="hiddenCardVisible" runat="server" Value="false" />

        <div class="row">
            <div class="col">
                <div class="card shadow-sm" id="summaryCard" style="display: none;">
                    <div class="card-body">
                        <h5 class="card-title">Summary</h5>
                        <p class="card-text">
                            <span class="fw-bold">Total Amount:</span>
                            <asp:Label ID="lblTotalAmount" runat="server"></asp:Label><br />
                            <span class="fw-bold">Service Tax:</span>
                            <asp:Label ID="lblServiceTax" runat="server"></asp:Label><br />
                            <span class="fw-bold">Amount After Tax:</span>
                            <asp:Label ID="lblAmountAfterTax" runat="server"></asp:Label><br />
                            <span class="fw-bold">Rounding:</span>
                            <asp:Label ID="lblRounding" runat="server"></asp:Label><br />
                            <span class="fw-bold">Amount Rounded:</span>
                            <asp:Label ID="lblAmountRounded" runat="server"></asp:Label><br />
                        </p>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <asp:SqlDataSource ID="SqlDataSourceCart" runat="server" ConnectionString="<%$ ConnectionStrings:DataBase %>" SelectCommand="spSalesGotItems" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblSalesId" Name="salesid" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <script type="text/javascript">
        function toggleCardVisibility() {
            var card = document.getElementById('summaryCard');
            var hiddenField = document.getElementById('<%= hiddenCardVisible.ClientID %>');

            if (card.style.display === 'none') {
                card.style.display = 'block';
                hiddenField.value = 'true';
            } else {
                card.style.display = 'none';
                hiddenField.value = 'false';
            }
        }
    </script>

</asp:Content>




