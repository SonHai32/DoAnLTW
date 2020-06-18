using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace KetThucMon.TheHien
{
    public partial class Header : System.Web.UI.UserControl
    {
        protected void showOrderList()
        {
            DataTable orderList = (DataTable)Session["order"];
            if (orderList.Rows.Count > 0)
            {
                dataOrderList.DataSource = orderList.DefaultView;
                dataOrderList.DataBind();

            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                showOrderList();
            if (Session["Mkh"].ToString() != "")
            {
                lblUserInfo.Visible = true;
                lblHeaderLoginForm.Visible = false;
                lblUserInfoName.Text = Session["username"].ToString();
                lblUserInfoREmail.Text = Session["email"].ToString();
            }
            else
            {

                lblUserInfo.Visible = false;
                lblHeaderLoginForm.Visible = true;
            }
        }

        protected void btnLoginHeader_Click(object sender, EventArgs e)
        {
            string getUserData = @"SELECT * FROM KHACH_HANG WHERE Ten_dang_nhap='" + txtUsernameHeaderFormLogin.Text + "' AND Mat_khau='" + txtPasswordHeaderFormLogin.Text + "'";
            DataTable user_data = XL_DuLieu.Doc_bang(getUserData);

            if (user_data.Rows.Count > 0)
            {
                Session["Mkh"] = user_data.Rows[0]["Mkh"].ToString();
                Session["Tenkhachhang"] = user_data.Rows[0]["Ho_ten"].ToString();
                Session["username"] = user_data.Rows[0]["Ten_dang_nhap"].ToString();
                Session["email"] = user_data.Rows[0]["Email"].ToString();
                Session["diachi"] = user_data.Rows[0]["Dia_chi"].ToString();
                Session["sodienthoai"] = user_data.Rows[0]["Dien_thoai"].ToString();
                Response.Redirect(Request.RawUrl);
            }
            else
                Response.Write("<script>alert('Danh nhap khong thanh cong')</script>");



        }

        protected void btnLogoutHeader_Click(object sender, EventArgs e)
        {
            Session["Mkh"] = "";
            Session["Tenkhachhang"] = "";
            Session["username"] = "";
            Session["email"] = "";

            Response.Redirect(Request.Url.ToString(), true);
        }

        protected void showListSearchProduct(string searchKey)
        {
            string querySearchProduct = @"SELECT * FROM SAN_PHAM SP INNER JOIN DANH_MUC DM ON SP.Madm = DM.Madm WHERE SP.Tensp like N'%" + searchKey + "%'"
                + @"or SP.Masp like N'%" + searchKey + "%'" + @"or SP.Madm like N'%" + searchKey + "%'" + @"or DM.Tendm like N'%" + searchKey + "%'";
            DataTable productList = XL_DuLieu.Doc_bang(querySearchProduct);
            productSearchList.DataSource = productList.DefaultView;
            productSearchList.DataBind();
        }

        protected void headerSearchBox_TextChanged(object sender, EventArgs e)
        {
            showListSearchProduct(headerSearchBox.Text);
        }

    }
}