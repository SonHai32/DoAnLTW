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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Mkh"].ToString() != "")
                Response.Redirect("Default.aspx");
        }

        protected void btnFormSubmit_Click(object sender, EventArgs e)
        {
            string test = @"INSERT INTO KHACH_HANG (Ho_ten,Dien_thoai,Dia_chi,Ten_dang_nhap,Mat_khau,Ngay_sinh,Gioi_tinh,Email) VALUES('" + txtFullName.Text + "','" + txtPhone.Text + "','" + txtAddress.Text + "','" + txtUsername.Text + "','" + txtPassword.Text + "','" + txtBirth.Text + "'," + txtGender.Text + ",'" + txtEmail.Text + "')";
            if (XL_DuLieu.Thuc_hien_lenh(test))
                Response.Write("<script>alert('Dang Ky Thanh Cong')</script>");
            else
                Response.Write("<script>alert('Dang Ky Khong Thanh Cong')</script>");

        }


    }
}