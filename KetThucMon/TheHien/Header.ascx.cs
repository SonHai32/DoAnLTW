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
                /*                Image productImage = new Image();
                                productImage.CssClass = "w-100";
                                productImage.ImageUrl = "../images/" + orderList.Rows[0]["Anhhienthi"].ToString();

                                Label lblProductImageContainer = new Label();
                                lblProductImageContainer.CssClass = "x64-img";
                                lblProductImageContainer.Width = 64;
                                lblProductImageContainer.Height = 64;
                                lblProductImageContainer.Controls.Add(productImage);

                                lblOrderList.Controls.Add(lblProductImageContainer);
                 * */
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

                Response.Redirect("Default.aspx");
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

    }
}