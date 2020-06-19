using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace KetThucMon.TheHien
{
    public partial class Product : System.Web.UI.UserControl
    {
        protected Label lblSizeList;

        protected void HienThi(string productId)
        {
            string productQuery = @"SELECT * FROM SAN_PHAM WHERE Masp='" + productId + "'";
            DataTable productData = XL_DuLieu.Doc_bang(productQuery);


            if (productData.Rows.Count > 0)
            {
                dataListProduct.DataSource = productData;
                dataListProduct.DataBind();

                string[] listImage = productData.Rows[0]["Danhsachanh"].ToString().Split(',');
                for (int i = 0; i <= 3; i++)
                {
                    ImageButton imageProduct = (ImageButton)dataListProduct.Items[0].FindControl(@"productImage" + i + "");
                    imageProduct.ImageUrl = @"../images/" + listImage[i] + "";
                }
            }



        }
        protected void Page_Load(object sender, EventArgs e)
        {
            string productId = Request.QueryString["Ma-san-pham"] != null ? Request.QueryString["Ma-san-pham"] : "";
            if (productId == "")
                Response.Redirect("Default.aspx");
            else
                if (!IsPostBack)
                    HienThi(productId);
        }

        protected void dataListProduct_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "buy")
            {
                string Masp = e.CommandArgument.ToString();
                DataTable order = (DataTable)Session["order"];

                bool productExisted = false;

                for (int i = 0; i < order.Rows.Count; i++)
                {
                    if (order.Rows[i]["Masp"].ToString() == Masp)
                    {
                        order.Rows[i]["Soluong"] = int.Parse(order.Rows[i]["Soluong"].ToString()) + 1;
                        productExisted = true;
                        break;
                    }
                }

                if (!productExisted)
                {
                    DataTable product = XL_DuLieu.Doc_bang(@"SELECT Masp, Tensp, Giatien,Size, Anhhienthi FROM SAN_PHAM where Masp='" + Masp + "'");
                    DataRow row = order.NewRow();

                    row["Masp"] = product.Rows[0]["Masp"];
                    row["Tensp"] = product.Rows[0]["Tensp"];
                    row["Giatien"] = product.Rows[0]["Giatien"];
                    row["Anhhienthi"] = product.Rows[0]["Anhhienthi"];
                    row["Soluong"] = 1;
                    row["Ngaytao"] = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff");
                    row["Size"] = product.Rows[0]["Size"];
                    order.Rows.Add(row);
                }

                order.AcceptChanges();
                Session["order"] = order;
                Response.Redirect(Request.RawUrl);
            }

        }




    }
}