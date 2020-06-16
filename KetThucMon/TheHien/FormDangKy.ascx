<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormDangKy.ascx.cs" Inherits="KetThucMon.TheHien.FormDangKy" %>
<div class="main-container register vh-100  bg-dark d-flex align-items-center justify-content-center">
    <div class="register-form-container w-50 bg-light rounded box-shadow p-4">
        <form>
            <div class="form-row">
                <div class="form-group col-md-6 col-sm-12">
                    <label for="txtFullName">Họ tên</label>
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Nhập họ tên"></asp:TextBox>
                </div>
                <div class="form-group col-md-6 col-sm-12">
                    <label for="txtPhone">Sô điện thoại</label>
                    <asp:TextBox ID="txtPhone" type="number" runat="server" CssClass="form-control" placeholder="Sô điện thoại"></asp:TextBox>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6 col-sm-12">
                    <label for="txtBirth">Ngày sinh</label>
                    <asp:TextBox ID="txtBirth" runat="server" CssClass="form-control" placeholder="Ngày sinh" type="date"></asp:TextBox>
                </div>
                <div class="form-group col-md-6 col-sm-12">
                    <label for="txtGender">Giới tính</label>
                    <asp:DropDownList ID="txtGender" runat="server" CssClass="form-control">
                        <asp:ListItem Enabled="true" Selected="True" Text="Nam" Value="1"></asp:ListItem>
                        <asp:ListItem Enabled="true" Text="Nữ" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="form-group">
                <label for="txtAddress">Địa chỉ</label>
                <asp:TextBox type="text" CssClass="form-control" ID="txtAddress" runat="server" placeholder="Nhập địa chỉ"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtEmail">Địa chỉ email</label>
                <asp:TextBox type="email" CssClass="form-control" ID="txtEmail" runat="server" aria-describedby="emailHelp" placeholder="Nhập email của bạn"></asp:TextBox>
                <small id="emailHelp" class="form-text text-muted">Chúng tôi sẽ không cung cấp bất kì thông tin nào về email của bạn cho người khác</small>
            </div>
            <div class="form-group">
                <label for="txtUsername">Tên đăng nhập</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Nhập tên đăng nhập"></asp:TextBox>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6 col-sm-12">
                    <label for="txtPassword">Mật khẩu</label>
                    <asp:TextBox type="password" ID="txtPassword" runat="server" CssClass="form-control" placeholder="Nhập mật khẩu"></asp:TextBox>
                </div>
                <div class="form-group col-md-6 com-sm-12">
                    <label for="txtRePassword">Nhập lại mật khẩu</label>
                    <asp:TextBox type="password" ID="txtRePassword" runat="server" CssClass="form-control" placeholder="Nhập lại mật khẩu"></asp:TextBox>
                </div>
            </div>


            <asp:Button Text="Đăng ký" ID="btnFormSubmit" runat="server" OnClick="btnFormSubmit_Click" CssClass="btn btn-primary btn-block" />

        </form>
    </div>
</div>
