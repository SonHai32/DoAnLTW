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
public class XL_DuLieu
{
    public static String chuoi_ket_noi = @"Server=localhost\SQLEXPRESS;Database=QL_BAN_HANG;Trusted_Connection=True;";

    //Thực hiện các câu truy vấn Select
    public static DataTable Doc_bang(String cau_lenh)
    {
        try
        {
            SqlConnection ket_noi = new SqlConnection(chuoi_ket_noi);
            SqlDataAdapter bo_doc_ghi = new SqlDataAdapter(cau_lenh, chuoi_ket_noi);
            DataTable bang = new DataTable();
            bo_doc_ghi.Fill(bang);
            return bang;
        }
        catch
        {
            return null;
        }
    }
    //Thực hiện các câu truy vấn cập nhật dữ liệu: update, insert, delete 
    public static bool Thuc_hien_lenh(string cau_lenh)
    {
        try
        {
            SqlConnection ket_noi = new SqlConnection(chuoi_ket_noi);
            SqlCommand bo_lenh = new SqlCommand(cau_lenh, ket_noi);
            ket_noi.Open();
            bo_lenh.ExecuteNonQuery();
            ket_noi.Close();
            return true;
        }
        catch
        {
            return false;

        }
    }


    //Thực hiện các câu truy vấn thống kê dữ liệu: sum, count, max, min, avg 
    public static object Thuc_hien_lenh_tinh_toan(string cau_lenh)
    {
        try
        {
            SqlConnection ket_noi = new SqlConnection(chuoi_ket_noi);
            SqlCommand bo_lenh = new SqlCommand(cau_lenh, ket_noi);
            ket_noi.Open();
            object ket_qua = bo_lenh.ExecuteScalar();
            ket_noi.Close();
            return ket_qua;
        }
        catch
        {
            return null;
        }
    }

    public XL_DuLieu()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}