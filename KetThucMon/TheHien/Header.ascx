<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="KetThucMon.TheHien.Header" %>
<link href="../Style/style.css" rel="stylesheet" />
<script src="../Scripts/jquery-3.0.0.min.js"></script>
<link href="../Style/Font-Awsome/css/all.css" rel="stylesheet" />
<script src="../Scripts/header-controller.js"></script>
<div class="container-fluid">
    <div class="modal fade" id="orderModal" tabindex="-1" role="dialog" aria-labelledby="orderModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="orderModalLabel"><i class="fas fa-shopping-cart font-weight-bold text-dark mr-2"></i>Giỏ hàng</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:DataList ID="dataOrderList" HorizontalAlign="Right" CellPadding="3" CellSpacing="3" RepeatDirection="Vertical" CssClass="w-100" runat="server">
                        <ItemTemplate>
                            <div class="order-product-item d-flex align-items-center">
                                <asp:HyperLink NavigateUrl='<%# "/Website/Product.aspx?Ma-san-pham=" + Eval("Masp") %>' Width="64" Height="64" ID="lkProductListContainer" runat="server">
                                    <asp:Image ID="orderProductListItem" runat="server" CssClass="'w-100 h-100" ImageUrl='<%# "../images/" + Eval("Anhhienthi") %>' />
                                </asp:HyperLink>
                                <div class="ml-3 order-product-info d-flex flex-column justify-content-between">
                                    <asp:HyperLink Text='<%# Eval("Tensp") %>' CssClass="text-danger font-weight-bold" NavigateUrl='<%# "/Website/Product.aspx?Ma-san-pham=" + Eval("Masp") %>' Height="30" ID="orderProductName" runat="server"></asp:HyperLink>
                                    <asp:Label ID="orderProductPrice" Text='<%# double.Parse(Eval("Giatien").ToString()).ToString("#,### Đ") %>' Height="30" runat="server"></asp:Label>
                                </div>
                                <asp:Label ID="orderProductCount" runat="server" CssClass="ml-auto badge badge-dark" Text='<%# Eval("Soluong") %>'>
                                        1
                                </asp:Label>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>

                </div>
                <div class="modal-footer">

                    <asp:LinkButton CssClass="btn btn-success" ID="btnlinkOrder" runat="server" Text="Xem giỏ hàng">

                    </asp:LinkButton>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <div class="header flex flex-row align-items space-between">
        <div class="logo flex align-center justify-center">
            <a href='#'>
                <img src="../images/logo.png" alt="logo">
            </a>
        </div>
        <div class="nav flex justify-center align-center">
            <ul class='list-items flex flex-row list-style-none space-around align-center'>
                <li class='nav-item-trang-chu'><a href="./index.html">Trang chủ</a></li>
                <li class='nav-item-san-pham'><a href="./page/all-product.html">Sản phẩm</a></li>
                <li class='nav-item-khuyen-mai'><a href="./page/sale.html">Khuyến mãi</a></li>
                <li class='nav-item-gioi-thieu'><a href="./page/about-us.html">Giới thiệu</a></li>
            </ul>
        </div>
        <div class="nav-items flex flex-row justify-center align-center">
            <i class="fas fa-search" id='search-icon'></i>
            <i class="fas fa-user user-icon" id="user-icon"></i>
            <i class="fas fa-shopping-basket" data-toggle="modal" data-target="#orderModal"></i>

        </div>
        <div class="user-container bg-light shadow rounded p-3 bg-light" id="user-container">
            <asp:Label ID="headerUser" runat="server" CssClass="w-100 h-100 ">
                <asp:Label ID="lblUserInfo" runat="server" CssClass="w-100 h-100 p-4">
                    <div class="user-info d-flex flex-column p-3">
                        <div class="user-info-name my-1 w-100 h-100 ">
                            <small class="text-small d-block">
                                <i class="fal fa-user text-black font-weight-bold"></i>
                                <asp:Label ID="lblUserInfoName" CssClass="text-muted ml-2" runat="server" Text=""></asp:Label>
                            </small>
                        </div>
                        <div class="user-info-email; my-1 w-100">
                            <small class="text-small d-block">
                                <i class="far fa-envelope text-black font-weight-bold"></i>
                                <asp:Label ID="lblUserInfoREmail" CssClass="text-muted ml-2" runat="server" Text=""></asp:Label>
                            </small>
                        </div>

                    </div>
                    <div class="form-group">
                        <asp:Button Text="Đăng xuất" CssClass="btn btn-danger btn-block" ID="btnLogoutHeader" OnClick="btnLogoutHeader_Click" runat="server"></asp:Button>
                    </div>
                </asp:Label>
                <asp:Label ID="lblHeaderLoginForm" runat="server">

                    <div class="form-group">

                        <label for="exampleInputEmail1">Tên đăng nhập</label>
                        <asp:TextBox CssClass="form-control" ID="txtUsernameHeaderFormLogin" runat="server" placeholder="Tên đăng nhập"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Mật khẩu</label>
                        <asp:TextBox type="password" CssClass="form-control" ID="txtPasswordHeaderFormLogin" runat="server" placeholder="Mật khẩu"></asp:TextBox>
                    </div>

                    <asp:Button Text="Đăng Nhập" CssClass="btn btn-primary btn-block" ID="btnLoginHeader" OnClick="btnLoginHeader_Click" runat="server"></asp:Button>
                    <br />
                    <small class="form-text text-muted">Bạn chưa có tài khoản ?
                    </small>
                    <asp:HyperLink ID="registerLink" runat="server" NavigateUrl="~/Website/Register.aspx" Text="Đăng ký ngay" CssClass="text-primary"></asp:HyperLink>

                </asp:Label>
            </asp:Label>
        </div>
    </div>
</div>
