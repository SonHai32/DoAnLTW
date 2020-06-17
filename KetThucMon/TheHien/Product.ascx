<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Product.ascx.cs" Inherits="KetThucMon.TheHien.Product" %>

<asp:DataList ID="dataListProduct" CssClass="w-100" OnItemDataBound="dataListProduct_ItemDataBound" runat="server">
    <ItemTemplate>
        <div class="product-container flex flex-row align-center space-around ">

            <div class="product-img-list flex flex-column justify-center">
                <div class="product-img flex justify-center align-center">
                    <asp:ImageButton ID="productImage0" runat="server" CssClass="img-fit" OnClick="productImage0_Click" />
                </div>
                <div class="product-img flex justify-center align-center">
                    <asp:ImageButton ID="productImage1" runat="server" CssClass="img-fit" OnClick="productImage1_Click" />
                </div>
                <div class="product-img flex justify-center align-center">
                    <asp:ImageButton ID="productImage2" runat="server" CssClass="img-fit" OnClick="productImage2_Click" />
                </div>
                <div class="product-img flex justify-center align-center">
                    <asp:ImageButton ID="productImage3" runat="server" CssClass="img-fit" OnClick="productImage3_Click" />
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
                <div class="product-size">
                    <span class="size-title">SIZE
                    </span>
                    <asp:Label CssClass="size-list-btn" ID="lblSizeList" runat="server" Text='<%# Eval("Size") %>'>
                    </asp:Label>
                </div>
                <h1 class='product-name text-black'></h1>

                <div class="product-size">
                    <span class="size-title">SIZE
        </span>
                    <div class="size-list-btn">
                    </div>
                </div>
                <div class="product-amount flex flex-column">
                    <span class="product-amount-title">SỐ LƯỢNG
        </span>
                    <input type="number" value="1" id="amount" />
                </div>
                <button class="add-to-card-btn">
                    THÊM VÀO GIỎ HÀNG
     
                </button>
            </div>
        </div>
    </ItemTemplate>
</asp:DataList>
