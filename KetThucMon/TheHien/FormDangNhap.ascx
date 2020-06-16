<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormDangNhap.ascx.cs" Inherits="KetThucMon.TheHien.FormDangNhap" %>
<div class="main-container register vh-100  bg-dark d-flex align-items-center justify-content-center">
    <div class="register-form-container w-25 bg-light rounded box-shadow p-4">
        <form>

            <div class="form-group">
                <label for="txtUsername">Tên đăng nhập</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Nhập tên đăng nhập"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtPassword">Mật khẩu</label>
                <asp:TextBox type="password" ID="txtPassword" runat="server" CssClass="form-control" placeholder="Nhập mật khẩu"></asp:TextBox>
            </div>


            <asp:Button Text="Đăng ký" ID="btnFormSubmit" runat="server" OnClick="btnFormSubmit_Click" CssClass="btn btn-primary btn-block" />

        </form>
    </div>
</div>

