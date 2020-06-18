using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Text.RegularExpressions;
using System.Net.Mail;
/// <summary>
/// Summary description for XL_DuLieu
/// </summary>
public class XL_NhapLieu
{

    public static bool isNull(string value)
    {
        return value == "";
    }

    public static bool outOfRange(string value, int index)
    {
        return value.Length > index;
    }

    public static bool isInRange(string value, int start, int end)
    {
        return value.Length >= start && value.Length <= end;
    }

    public static bool isEqual(string valueA, string valueB)
    {
        return valueA == valueB;
    }

    public static bool isEmailValid(string email)
    {
        try
        {
            MailAddress mail = new MailAddress(email);
            return true;
        }
        catch
        {
            return false;
        }
    }

    public static bool isNumber(string value)
    {
        var regex = new Regex("[0-9]");

        return regex.IsMatch(value);
    }

    public XL_NhapLieu()
    {

    }
}