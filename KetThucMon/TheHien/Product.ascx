<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Product.ascx.cs" Inherits="KetThucMon.TheHien.Product" %>

<asp:DataList ID="dataListProduct" CssClass="w-100" runat="server" OnItemCommand="dataListProduct_ItemCommand">
    <ItemTemplate>
        <div class="product-container flex flex-row align-center space-around ">

            <div class="product-img-list flex flex-column justify-center">
                <div class="product-img flex justify-center align-center">
                    <asp:ImageButton ID="productImage0" runat="server" CssClass="img-fit" />
                </div>
                <div class="product-img flex justify-center align-center">
                    <asp:ImageButton ID="productImage1" runat="server" CssClass="img-fit" />
                </div>
                <div class="product-img flex justify-center align-center">
                    <asp:ImageButton ID="productImage2" runat="server" CssClass="img-fit" />
                </div>
                <div class="product-img flex justify-center align-center">
                    <asp:ImageButton ID="productImage3" runat="server" CssClass="img-fit" />
                </div>
            </div>
            <div class="main-product-img flex justify-center align-center">

                <asp:Image ID="productImage" runat="server" CssClass="img-fit" ImageUrl='<%# "../images/" + Eval("Anhhienthi") %>' />
            </div>
            <div class="product-info">
                <h1 class='product-name text-black'>
                    <asp:Label ID="productName" runat="server" Text='<%# Eval("Tensp") %>'></asp:Label>
                </h1>
                <div class="product-price flex flex-column">
                    <h1 class='text-black' id='product-price'>
                        <h1 class='text-black line-through' id='product-sale-price'></h1>
                        <asp:Label ID="productPrice" runat="server" Text='<%# double.Parse(Eval("Giatien").ToString()).ToString("#,### Đ") %>'></asp:Label>
                        <h1></h1>
                    </h1>
                </div>

                <h1 class='product-name text-black'></h1>

                <div class="product-size">
                    <div class="size-list-btn">
                    </div>
                </div>
                <div class="product-amount flex flex-column">
                    <span class="product-amount-title">SỐ LƯỢNG
        </span>
                    <input type="number" value="1" id="amount" />
                </div>
                <asp:Button runat="server" Text="THÊM VÀO GIỎ HÀNG" CommandName="buy" CommandArgument='<%# Eval("Masp") %>' CssClass="add-to-card-btn" ID="btnAddToCard" />


            </div>
        </div>
    </ItemTemplate>
</asp:DataList>
