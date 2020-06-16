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



        protected void dataListProduct_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            lblSizeList = (Label)e.Item.FindControl("lblSizeList");
            string[] size_list = lblSizeList.Text.Split(',');
            lblSizeList.Text = "";
            foreach (string size in size_list)
            {
                Button size_btn = new Button();
                size_btn.ID = @"btnSize" + size + "";
                size_btn.Text = size;
                lblSizeList.Controls.Add(size_btn);
            }
        }


        protected void productImage0_Click(object sender, ImageClickEventArgs e)
        {

            ImageButton mainImage = (ImageButton)dataListProduct.Items[0].FindControl("productImage");
            ImageButton currentImage = sender as ImageButton;
            mainImage.ImageUrl = currentImage.ImageUrl;
        }

        protected void productImage2_Click(object sender, ImageClickEventArgs e)
        {

            ImageButton mainImage = (ImageButton)dataListProduct.Items[0].FindControl("productImage");
            ImageButton currentImage = sender as ImageButton;
            mainImage.ImageUrl = currentImage.ImageUrl;
        }

        protected void productImage1_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton mainImage = (ImageButton)dataListProduct.Items[0].FindControl("productImage");
            ImageButton currentImage = sender as ImageButton;
            mainImage.ImageUrl = currentImage.ImageUrl;

        }

        protected void productImage3_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton mainImage = (ImageButton)dataListProduct.Items[0].FindControl("productImage");
            ImageButton currentImage = sender as ImageButton;
            mainImage.ImageUrl = currentImage.ImageUrl;

        }
    }
}