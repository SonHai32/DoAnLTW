using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace KetThucMon.TheHien
{
    public partial class FormDangKy : System.Web.UI.UserControl
    {
        public static bool isFormValid = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Mkh"].ToString() != "")
                    Response.Redirect("Default.aspx");

            }
        }


        protected bool checkExistedUser(string username)
        {
            DataTable userInfo = XL_DuLieu.Doc_bang(@"SELECT * FROM KHACH_HANG WHERE Ten_dang_nhap='" + username + "'");
            if (userInfo.Rows.Count > 0)
                return true;
            else
                return false;
        }

        protected void btnFormSubmit_Click(object sender, EventArgs e)
        {

            if (isFormValid)
            {
                if (!checkExistedUser(txtUsername.Text))
                {
                    string addUserQuery = @"INSERT INTO KHACH_HANG (Ho_ten,Dien_thoai,Dia_chi,Ten_dang_nhap,Mat_khau,Ngay_sinh,Gioi_tinh,Email) VALUES(N'" + txtFullName.Text + "','" + txtPhone.Text + "',N'" + txtAddress.Text + "','" + txtUsername.Text + "','" + txtPassword.Text + "','" + txtBirth.Text + "'," + txtGender.Text + ",'" + txtEmail.Text + "')";
                    if (XL_DuLieu.Thuc_hien_lenh(addUserQuery))
                    {
                        Response.Write("<script>alert('Đăng ký thàng công')</script>");
                        Response.Redirect("Login.aspx");
                    }
                    else
                        Response.Write("<script>alert('Dang Ky Khong Thanh Cong')</script>");
                }
                else
                {
                    Response.Write(@"<script>alert('Đăng ký không thành công.Người dùng " + txtUsername.Text + " đã tồn tại')</script>");
                    isFormValid = false;
                    txtUsername.CssClass = "form-control border-danger";
                    usernameError.Visible = true;
                    usernameError.Text = "Tài khoản đã tồn tại";
                }

            }
            else
                Response.Write("<script>alert('Vui lòng điền đầy đủ thông tin người dùng')</script>");


        }


        protected void txtFullName_TextChanged(object sender, EventArgs e)
        {
            if (XL_NhapLieu.isNull(txtFullName.Text))
            {
                isFormValid = false;
                fullNameError.Visible = true;
                txtFullName.CssClass = "form-control border-danger";
                fullNameError.Text = "Vui lòng điền đủ thông tin";
            }
            else if (!XL_NhapLieu.isInRange(txtFullName.Text, 6, 32))
            {
                isFormValid = false;
                fullNameError.Visible = true;
                txtFullName.CssClass = "form-control border-danger";
                fullNameError.Text = "Họ tên phải từ 6-32 ký tự";
            }
            else
            {
                isFormValid = true;
                txtFullName.CssClass = "form-control";
                fullNameError.Text = "";
                fullNameError.Visible = false;
            }
        }

        protected void txtPhone_TextChanged(object sender, EventArgs e)
        {
            if (XL_NhapLieu.isNull(txtPhone.Text))
            {
                isFormValid = false;
                phoneError.Visible = true;
                txtPhone.CssClass = "form-control border-danger";
                phoneError.Text = "Vui lòng điền đủ thông tin";
            }
            else if (!XL_NhapLieu.isInRange(txtPhone.Text, 6, 15) && !XL_NhapLieu.isNumber(txtPhone.Text))
            {
                isFormValid = false;
                phoneError.Visible = true;
                txtPhone.CssClass = "form-control border-danger";
                phoneError.Text = "Số điện thoại không hợp lệ";
            }
            else
            {
                isFormValid = true;
                phoneError.Visible = false;
                txtPhone.CssClass = "form-control";

            }
        }

        protected void txtBirth_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtAddress_TextChanged(object sender, EventArgs e)
        {
            if (XL_NhapLieu.isNull(txtAddress.Text))
            {
                isFormValid = false;
                addrError.Visible = true;
                txtAddress.CssClass = "form-control border-danger";
                addrError.Text = "Vui lòng điền đủ thông tin";
            }
            else if (!XL_NhapLieu.isInRange(txtAddress.Text, 15, 100))
            {
                isFormValid = false;
                addrError.Visible = true;
                txtAddress.CssClass = "form-control border-danger";
                addrError.Text = "Địa chỉ phải từ 15-100 ký tự";
            }
            else
            {
                isFormValid = true;
                addrError.Visible = false;
                txtAddress.CssClass = "form-control";

            }
        }

        protected void txtEmail_TextChanged(object sender, EventArgs e)
        {
            if (XL_NhapLieu.isNull(txtEmail.Text))
            {
                isFormValid = false;
                emailError.Visible = true;
                txtEmail.CssClass = "form-control border-danger";
                emailError.Text = "Vui lòng điền đủ thông tin";
            }
            else if (!XL_NhapLieu.isInRange(txtEmail.Text, 10, 50))
            {
                isFormValid = false;
                emailError.Visible = true;
                txtEmail.CssClass = "form-control border-danger";
                emailError.Text = "Địa chỉ Email phải từ 15-100 ký tự";
            }
            else if (!XL_NhapLieu.isEmailValid(txtEmail.Text))
            {
                isFormValid = false;
                emailError.Visible = true;
                txtEmail.CssClass = "form-control border-danger";
                emailError.Text = "Địa chỉ Email không hợp lệ";
            }
            else
            {
                isFormValid = true;
                emailError.Visible = false;
                txtEmail.CssClass = "form-control";

            }
        }

        protected void txtUsername_TextChanged(object sender, EventArgs e)
        {
            if (XL_NhapLieu.isNull(txtUsername.Text))
            {
                isFormValid = false;
                usernameError.Visible = true;
                txtUsername.CssClass = "form-control border-danger";
                usernameError.Text = "Vui lòng điền đủ thông tin";
            }
            else if (!XL_NhapLieu.isInRange(txtUsername.Text, 6, 16))
            {
                isFormValid = false;
                usernameError.Visible = true;
                txtUsername.CssClass = "form-control border-danger";
                usernameError.Text = "Tên tài khoản phải từ 6-16 ký tự";
            }
            else
            {
                isFormValid = true;
                txtUsername.CssClass = "form-control";
                usernameError.Text = "";
                fullNameError.Visible = false;
            }
        }

        protected void txtPassword_TextChanged(object sender, EventArgs e)
        {
            if (XL_NhapLieu.isNull(txtPassword.Text))
            {
                isFormValid = false;
                passwordError.Visible = true;
                txtPassword.CssClass = "form-control border-danger";
                passwordError.Text = "Vui lòng nhập mật khẩu";
            }
            else if (!XL_NhapLieu.isInRange(txtPassword.Text, 6, 32))
            {
                isFormValid = false;
                passwordError.Visible = true;
                txtPassword.CssClass = "form-control border-danger";
                passwordError.Text = "Mật khẩu phải từ 6-32 kí tự";
            }
            else
            {
                isFormValid = true;
                txtPassword.CssClass = "form-control";
                passwordError.Text = "";
                passwordError.Visible = false;
            }
        }

        protected void txtRePassword_TextChanged(object sender, EventArgs e)
        {
            if (!XL_NhapLieu.isEqual(txtRePassword.Text, txtPassword.Text) || XL_NhapLieu.isNull(txtRePassword.Text))
            {
                isFormValid = false;
                repasswordError.Visible = true;
                txtRePassword.CssClass = "form-control border-danger";
                repasswordError.Text = "Mật khẩu không khớp";
            }

            else
            {
                isFormValid = true;
                txtRePassword.CssClass = "form-control";
                repasswordError.Text = "";
                repasswordError.Visible = false;
            }
        }


    }
}