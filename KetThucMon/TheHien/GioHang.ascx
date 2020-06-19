<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GioHang.ascx.cs" Inherits="KetThucMon.TheHien.GioHang" %>

<link href="../Style/Cart.css" rel="stylesheet" />

<div class="main-container vh-100 w-100 d-flex p-4">
    <div class="cart-container  w-75 bg-white d-flex flex-column">
        <div class="cart-title w-100">
            <h2>
                <i class="fas fa-shopping-cart text-dark font-weight-bold"></i>Giỏ hàng của bạn
            </h2>
        </div>
        <div class="cart-list overflow-auto w-100 border">
            <asp:DataList CssClass="w-100 " ID="listCartItem" runat="server" OnItemCommand="listCartItem_ItemCommand">
                <ItemTemplate>
                    <div class="cart-info border d-flex">
                        <asp:LinkButton ID="btnRemoveProduct" runat="server" CommandName="removeFromCart" CommandArgument='<%# Eval("Masp") %>' CssClass="remove-product-item">
                                <i class="fas fa-times text-dark font-weight-bold"></i>
                        </asp:LinkButton>
                        <asp:HyperLink ID="cartImageContainer" runat="server" Width="100" Height="100" CssClass="p-1" NavigateUrl='<%# "/Website/Product.aspx?Ma-san-pham=" + Eval("Masp") %>'>
                            <asp:Image ID="cartImage" runat="server" CssClass="w-100" ImageUrl='<%# "../images/" + Eval("Anhhienthi") %>' />
                        </asp:HyperLink>
                        <asp:Label ID="lblCardInfo" runat="server" CssClass="w-100 d-flex flex-column">
                            <asp:HyperLink ID="productName" runat="server" CssClass="d-block text-center font-weight-bold" Text='<%# Eval("Tensp") %>' NavigateUrl='<%# "/Website/Product.aspx?Ma-san-pham=" + Eval("Masp") %>'>
                            </asp:HyperLink>
                            <asp:Label ID="lblProductPrice" CssClass="text-muted d-block text-center" runat="server" Text='<%# double.Parse(Eval("Giatien").ToString()).ToString("#,### Đ") %>'>
                            </asp:Label>
                            <asp:Label ID="lblProductSize" CssClass="text-dark d-block text-center" runat="server" Text='<%# Eval("Size") %>'>
                            </asp:Label>
                            <asp:Label ID="amountAndTotalPriceContainer" runat="server" CssClass="w-100 d-flex justify-content-between">
                                <asp:Label ID="productAmountController" role="group" CssClass="btn-group" runat="server">
                                    <asp:Button ID="upAmount" runat="server" CssClass="btn btn-secondary text-center" Text="+" CommandName="increase" CommandArgument='<%# Eval("Masp") %>' />
                                    <asp:TextBox ID="txtAmount" CssClass="text-center" Width="55" runat="server" Text='<%# Eval("Soluong") %>'></asp:TextBox>
                                    <asp:Button ID="downAmount" runat="server" CssClass="btn btn-secondary" Text="-" CommandName="decrease" CommandArgument='<%# Eval("Masp") %>' />
                                </asp:Label>
                                <asp:Label ID="totalPrice" runat="server" CssClass="text-muted pr-4" Text='<%# double.Parse(Eval("Thanhtien").ToString()).ToString("#,### Đ") %>'>

                                </asp:Label>
                            </asp:Label>
                        </asp:Label>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
        <div class="w-100 d-flex align-items-center justify-content-end p-4">
            <h2 class="font-weight-bolder">Thành tiền</h2>

            <asp:Label ID="cartTotalPrice" CssClass="text-muted pl-4" runat="server">

            </asp:Label>
        </div>
        <asp:Label ID="CardPurcharse" runat="server" CssClass=" d-flex align-items-end" Height="80">
            <asp:Button ID="btnSubmitPurcharse" OnClick="btnSubmitPurcharse_Click" runat="server" Text="ĐẶT HÀNG" CssClass="btn h-100 btn-danger btn-block rounded-0" />
        </asp:Label>

    </div>
    <div class="w-25 h-100 bg-dark d-flex flex-column align-items-center p-3">
        <h3 class="text-light text-center py-3">Thông tin khách hàng 
        </h3>
        <asp:Label ID="userFormControl" CssClass="w-100" runat="server" Enabled="false">
            <div class="form-group w-100">
                <label for="txtFullName" class="text-light">Họ tên</label>
                <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Nhập họ tên"></asp:TextBox>
            </div>
            <div class="form-group w-100">
                <label for="txtEmail" class="text-light">Địa chỉ email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Nhập email"></asp:TextBox>
            </div>
            <div class="form-group w-100">
                <label for="txtPhone" class="text-light">Số điện thoại</label>
                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Nhập số điện thoại"></asp:TextBox>
            </div>
            <div class="form-group w-100">
                <label for="txtAddress" class="text-light">Địa chỉ Giao hàng</label>
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Nhập họ tên"></asp:TextBox>
            </div>
            <asp:Button Text="Cập nhật thông tin" CssClass="btn btn-danger btn-block mt-3" ID="updateUserPorfile" runat="server" />


        </asp:Label>

        <asp:Label CssClass="w-100 mt-4" ID="loginContainer" runat="server">
            <small class="form-text text-muted text-center">Đăng nhập hoặc đăng ký để tiếp tục mua hàng ?
            </small>
            <div class="form-row w-100">
                <div class="form-group col-md-6 text-right">
                    <asp:HyperLink ID="registerLink" runat="server" NavigateUrl="~/Website/Register.aspx?backto=cart" Text="Đăng ký" CssClass="text-primary"></asp:HyperLink>
                </div>
                <div class="form-group col-md-6 text-left">
                    <asp:HyperLink ID="LoginLink" runat="server" NavigateUrl="~/Website/Login.aspx?backto=cart" Text="Đăng nhập" CssClass="text-primary"></asp:HyperLink>
                </div>
            </div>
        </asp:Label>

    </div>

</div>
