<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Content.ascx.cs" Inherits="KetThucMon.TheHien.Content" %>
<script src="../Scripts/Banner.js"></script>
<div class="banner">
    <div class="switch-banner prev-banner">
        <i class="fal fa-chevron-left"></i>
    </div>
    <div class="switch-banner next-banner">
        <i class="fal fa-chevron-right"></i>
    </div>
</div>
<!-- Editable Region -->




<div class="main-container flex flex-row">

    <div class="menu-items flex flex-column">
        <h1>Menu
        </h1>
        <div class="item item-ao flex flex-row space-between">
            <a href="../Website/Default.aspx?DanhMuc=SHIRT">Áo</a>
            <i class="far fa-chevron-right"></i>
            <ul class="list-ao">
                <li><a href="../Website/Default.aspx?DanhMuc=TSHIRT">T-SHIRT</a></li>
                <li><a href="../Website/Default.aspx?DanhMuc=HOODIE">HOODIE</a></li>
            </ul>
        </div>
        <div class="item item-quan flex flex-row space-between align-center">
            <a href="../Website/Default.aspx?DanhMuc=TROUSER">Quần</a>
            <i class="far fa-chevron-right"></i>
            <ul class="list-quan">
                <li><a href="../Website/Default.aspx?DanhMuc=PANTS">Quần Dài</a></li>
                <li><a href="../Website/Default.aspx?DanhMuc=SHORTS">Quần short</a></li>
            </ul>
        </div>
        <div class="item item-balo flex flex-row space-between">
            <a href="../Website/Default.aspx?DanhMuc=BACK_PACK">Balo</a>
        </div>
        <div class="item item-giay flex flex-row space-between">
            <a href="../Website/Default.aspx?DanhMuc=SHOES">Giày</a>
        </div>
        <div class="item flex flex-row space-between">
            <a href="../Website/Default.aspx?DanhMuc=SALE">Khuyến mãi</a>
        </div>
    </div>
    <div class="sale-items">
        <div class="sale-header flex align-center">
            <p>Sản phẩm bán chạy</p>
        </div>
        <asp:DataList ID="productList" OnItemCommand="productList_ItemCommand" CssClass="sale-list-items" runat="server" RepeatDirection="Horizontal" RepeatColumns="4" CellPadding="3" CellSpacing="3">
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="25%" />
            <ItemTemplate>
                <div class="sale-item flex flex-column space-between align-center">
                    <asp:HyperLink ID="linkProuct" runat="server" NavigateUrl='<%# "~/Website/Product.aspx?Ma-san-pham=" + Eval("Masp") %>'>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "../images/"+Eval("Anhhienthi") %>' />
                    </asp:HyperLink>
                    <asp:Label CssClass="sale-item-id" ID="Label1" runat="server" Text='<%# Eval("Tensp") %>'></asp:Label>
                    <asp:Label ID="Label2" CssClass="sale-item-price" runat="server" Text='<%# double.Parse(Eval("Giatien").ToString()).ToString("#,###") %>'></asp:Label>
                    <asp:Button CssClass="sale-item-add" ID="Button1" runat="server" Text="Thêm vào giỏ hàng" CommandName="buy" CommandArgument='<%# Eval("Masp") %>' />
                </div>


            </ItemTemplate>
        </asp:DataList>

        <div class="page-controller-container d-flex align-items-center  py-3 justify-content-center">
            <asp:LinkButton ID="lbtnFirstPage" OnClick="lbtnFirstPage_Click" CssClass="btn btn-dark text-white mx-2 " runat="server">
        <i class="fas fa-step-backward"></i>
            </asp:LinkButton>
            <asp:LinkButton ID="lbtnPrevPage" OnClick="lbtnPrevPage_Click" CssClass="btn btn-dark text-white mx-2" runat="server">
        <i class="fas fa-backward"></i>
            </asp:LinkButton>
            <asp:Label ID="lblCurrentPage" CssClass="px-4 py-1 mx-1 border rounded" Text="1" runat="server"></asp:Label>
            <asp:LinkButton ID="lbtnNextPage" OnClick="lbtnNextPage_Click" CssClass="btn btn-dark text-white mx-2" runat="server">
        <i class="fas fa-forward"></i>
            </asp:LinkButton>
            <asp:LinkButton ID="lbtnLastPage" OnClick="lbtnLastPage_Click" CssClass="btn btn-dark text-white mx-2" runat="server">
        <i class="fas fa-step-forward"></i>
            </asp:LinkButton>
        </div>



    </div>

</div>


