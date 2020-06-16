using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace KetThucMon.TheHien
{
    public partial class FormDangNhap : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Mkh"].ToString() != "")
                Response.Redirect("Default.aspx");
        }

        protected void btnFormSubmit_Click(object sender, EventArgs e)
        {
            String getUser = @"SELECT * FROM KHACH_HANG WHERE Ten_dang_nhap='" + txtUsername.Text + "' AND Mat_khau='" + txtPassword.Text + "'";
            DataTable data_KH = XL_DuLieu.Doc_bang(getUser);
            if (data_KH.Rows.Count > 0)
            {
                Session["Mkh"] = data_KH.Rows[0]["Mkh"].ToString();
                Session["username"] = data_KH.Rows[0]["Ten_dang_nhap"].ToString();
                Session["email"] = data_KH.Rows[0]["Email"].ToString();
                Response.Redirect("Default.aspx");
            }
            else
                Response.Write("<script>alert('Thong tin dang nhap sai')</script>");
        }
    }
}