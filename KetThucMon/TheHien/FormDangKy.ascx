<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormDangKy.ascx.cs" Inherits="KetThucMon.TheHien.FormDangKy" %>
<div class="main-container register vh-100  bg-dark d-flex align-items-center justify-content-center">
    <div class="register-form-container w-50 bg-light rounded box-shadow p-4">
        <form>
            <div class="form-row">
                <div class="form-group col-md-6 col-sm-12">
                    <label for="txtFullName">Họ tên</label>
                    <asp:TextBox ID="txtFullName" AutoPostBack="true" aria-describedby="fullNameCheck" OnTextChanged="txtFullName_TextChanged" runat="server" CssClass="form-control" placeholder="Nhập họ tên"></asp:TextBox>
                    <small id="fullNameCheck" class="form-text text-danger">
                        <asp:Label ID="fullNameError" runat="server">
                        </asp:Label>
                    </small>
                </div>
                <div class="form-group col-md-6 col-sm-12">
                    <label for="txtPhone">Sô điện thoại</label>
                    <asp:TextBox ID="txtPhone" AutoPostBack="true" OnTextChanged="txtPhone_TextChanged" aria-describedby="phoneCheck" runat="server" CssClass="form-control" placeholder="Sô điện thoại"></asp:TextBox>
                    <small id="phoneCheck" class="form-text text-danger">
                        <asp:Label ID="phoneError" runat="server">
                        </asp:Label>
                    </small>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6 col-sm-12">
                    <label for="txtBirth">Ngày sinh</label>
                    <asp:TextBox ID="txtBirth" runat="server" AutoPostBack="true" OnTextChanged="txtBirth_TextChanged" CssClass="form-control" placeholder="Ngày sinh" type="date"></asp:TextBox>
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
                <asp:TextBox type="text" CssClass="form-control" AutoPostBack="true" aria-describedby="addrCheck" OnTextChanged="txtAddress_TextChanged" ID="txtAddress" runat="server" placeholder="Nhập địa chỉ"></asp:TextBox>
                <small id="addrCheck" class="form-text text-danger">
                    <asp:Label ID="addrError" runat="server">
                    </asp:Label>
                </small>
            </div>
            <div class="form-group">
                <label for="txtEmail">Địa chỉ email</label>
                <asp:TextBox CssClass="form-control" AutoPostBack="true" OnTextChanged="txtEmail_TextChanged" ID="txtEmail" runat="server" aria-describedby="emailCheck" placeholder="Nhập email của bạn"></asp:TextBox>
                <small id="emailCkeck" class="form-text text-danger">
                    <asp:Label ID="emailError" runat="server">
                    </asp:Label>
                </small>
            </div>
            <div class="form-group">
                <label for="txtUsername">Tên đăng nhập</label>
                <asp:TextBox ID="txtUsername" runat="server" AutoPostBack="true" aria-describedby="usernameCheck" OnTextChanged="txtUsername_TextChanged" CssClass="form-control" placeholder="Nhập tên đăng nhập"></asp:TextBox>
                <small id="usernameCheck" class="form-text text-danger">
                    <asp:Label ID="usernameError" runat="server">
                    </asp:Label>
                </small>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6 col-sm-12">
                    <label for="txtPassword">Mật khẩu</label>
                    <asp:TextBox type="password" ID="txtPassword" AutoPostBack="true" aria-describedby="passwordCheck" runat="server" OnTextChanged="txtPassword_TextChanged" CssClass="form-control" placeholder="Nhập mật khẩu"></asp:TextBox>
                    <small id="passwordCheck" class="form-text text-danger">
                        <asp:Label ID="passwordError" runat="server">
                        </asp:Label>
                    </small>
                </div>
                <div class="form-group col-md-6 com-sm-12">
                    <label for="txtRePassword">Nhập lại mật khẩu</label>
                    <asp:TextBox type="password" ID="txtRePassword" AutoPostBack="true" runat="server" aria-describedby="repasswordCheck" OnTextChanged="txtRePassword_TextChanged" CssClass="form-control" placeholder="Nhập lại mật khẩu"></asp:TextBox>
                    <small id="repasswordCheck" class="form-text text-danger">
                        <asp:Label ID="repasswordError" runat="server">
                        </asp:Label>
                    </small>
                </div>
            </div>


            <asp:Button Text="Đăng ký" ID="btnFormSubmit" runat="server" OnClick="btnFormSubmit_Click" CssClass="btn btn-primary btn-block" />

        </form>
    </div>
</div>
