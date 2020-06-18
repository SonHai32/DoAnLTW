using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace KetThucMon.TheHien
{
    public partial class GioHang : System.Web.UI.UserControl
    {
        public static PagedDataSource page = new PagedDataSource();
        public int currentPage = 0;
        protected void Show()
        {

            DataTable cartList = (DataTable)Session["order"];
            listCartItem.DataSource = cartList.DefaultView;
            listCartItem.DataBind();
            if (cartList.Rows.Count > 0)
            {
                int totalPrice = int.Parse(cartList.Compute("sum (Thanhtien)", "").ToString());
                cartTotalPrice.Text = @"<h2>" + totalPrice.ToString("#,### Đ") + "</h2>";
            }
            else
                Response.Redirect("Default.aspx");
            if (Session["Mkh"].ToString() != "")
            {

                userFormControl.Enabled = true;
                loginContainer.Visible = false;
                txtFullName.Text = Session["Tenkhachhang"].ToString();
                txtEmail.Text = Session["email"].ToString();
                txtPhone.Text = Session["sodienthoai"].ToString();
                txtAddress.Text = Session["diachi"].ToString();
            }
            else
            {
                userFormControl.Enabled = false;
                loginContainer.Visible = true;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                Show();
        }

        protected void listCartItem_ItemCommand(object source, DataListCommandEventArgs e)
        {
            DataTable cart = (DataTable)Session["order"];
            string Masp = e.CommandArgument.ToString();
            TextBox txtAmount = (TextBox)listCartItem.FindControl("txtAmount");




            if (e.CommandName == "increase")
            {
                for (int i = 0; i < cart.Rows.Count; i++)
                {
                    if (cart.Rows[i]["Masp"].ToString() == Masp)
                    {
                        cart.Rows[i]["Soluong"] = int.Parse(cart.Rows[i]["Soluong"].ToString()) + 1;
                        break;
                    }
                }



            }
            if (e.CommandName == "decrease")
            {

                for (int i = 0; i < cart.Rows.Count; i++)
                {
                    if (cart.Rows[i]["Masp"].ToString() == Masp)
                    {
                        if (int.Parse(cart.Rows[i]["Soluong"].ToString()) == 1)
                            return;

                        cart.Rows[i]["Soluong"] = int.Parse(cart.Rows[i]["Soluong"].ToString()) - 1;
                        break;
                    }
                }


            }

            if (e.CommandName == "removeFromCart")
            {
                for (int i = 0; i < cart.Rows.Count; i++)
                {
                    if (cart.Rows[i]["Masp"].ToString() == Masp)
                    {
                        cart.Rows.RemoveAt(i);
                    }
                }
            }
            cart.AcceptChanges();
            Session["order"] = cart;
            Response.Redirect(Request.RawUrl);

        }

    }
}