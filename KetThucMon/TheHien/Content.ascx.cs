using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace KetThucMon.TheHien
{
    public partial class Content : System.Web.UI.UserControl
    {
        static PagedDataSource page = new PagedDataSource();
        static int currentPage = 0;
        protected void HienThi(String filterString)
        {
            string cau_lenh = "SELECT * FROM SAN_PHAM SP INNER JOIN DANH_MUC DM ON SP.Madm = DM.Madm";
            if (filterString != "")
                cau_lenh += " WHERE DM.Danhmuccha = '" + filterString + "'";

            DataTable doc_bang = XL_DuLieu.Doc_bang(cau_lenh);
            page.DataSource = doc_bang.DefaultView;
            page.AllowPaging = true;
            if (currentPage > page.PageCount - 1)
                currentPage = 0;
            page.CurrentPageIndex = currentPage;
            page.PageSize = 8;
            lbtnFirstPage.Enabled = lbtnPrevPage.Enabled = lbtnNextPage.Enabled = lbtnLastPage.Enabled = true;
            lblCurrentPage.Text = currentPage + 1 + " / " + page.PageCount;
            if (page.IsFirstPage)
                lbtnFirstPage.Enabled = lbtnPrevPage.Enabled = false;
            if (page.IsLastPage)
                lbtnLastPage.Enabled = lbtnNextPage.Enabled = false;
            productList.DataSource = page;
            productList.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            string categoryQuery = Request.QueryString["DanhMuc"] != null ? Request.QueryString["DanhMuc"] : "";

            if (!IsPostBack)
                HienThi(categoryQuery);

        }



        protected void lbtnFirstPage_Click(object sender, EventArgs e)
        {
            currentPage = 0;
            string categoryQuery = Request.QueryString["DanhMuc"] != null ? Request.QueryString["DanhMuc"] : "";
            HienThi(categoryQuery);
        }

        protected void lbtnPrevPage_Click(object sender, EventArgs e)
        {
            currentPage--;
            string categoryQuery = Request.QueryString["DanhMuc"] != null ? Request.QueryString["DanhMuc"] : "";
            HienThi(categoryQuery);
        }

        protected void lbtnNextPage_Click(object sender, EventArgs e)
        {
            string categoryQuery = Request.QueryString["DanhMuc"] != null ? Request.QueryString["DanhMuc"] : "";
            currentPage++;
            HienThi(categoryQuery);
        }

        protected void lbtnLastPage_Click(object sender, EventArgs e)
        {
            currentPage = page.PageCount - 1;
            string categoryQuery = Request.QueryString["DanhMuc"] != null ? Request.QueryString["DanhMuc"] : "";
            HienThi(categoryQuery);
        }


        protected void productList_ItemCommand(object source, DataListCommandEventArgs e)
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
                    DataTable product = XL_DuLieu.Doc_bang(@"SELECT Masp, Tensp, Giatien, Anhhienthi FROM SAN_PHAM where Masp='" + Masp + "'");
                    DataRow row = order.NewRow();

                    row["Masp"] = product.Rows[0]["Masp"];
                    row["Tensp"] = product.Rows[0]["Tensp"];
                    row["Giatien"] = product.Rows[0]["Giatien"];
                    row["Anhhienthi"] = product.Rows[0]["Anhhienthi"];
                    row["Soluong"] = 1;
                    row["Ngaytao"] = DateTime.Now.ToString("YYYY-mm-dd");
                    order.Rows.Add(row);
                }

                order.AcceptChanges();
                Session["order"] = order;
                Response.Redirect(Request.RawUrl);
            }
        }
    }
}