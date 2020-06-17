using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Net;
/// <summary>
/// Summary description for XL_DuLieu
/// </summary>
public class XL_MuaHang
{

    public static DataTable createOrder()
    {
        DataTable order = new DataTable();
        order.Columns.Add("Masp", typeof(String));
        order.Columns.Add("Tensp", typeof(String));
        order.Columns.Add("Anhhienthi", typeof(String));
        order.Columns.Add("Makh", typeof(String));
        order.Columns.Add("Soluong", typeof(int));
        order.Columns.Add("Giatien", typeof(int));
        order.Columns.Add("Ngaytao", typeof(String));
        order.Columns.Add("Thanhtien", typeof(int), "Soluong*GiaTien");
        return order;

    }

    public XL_MuaHang()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}