using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for dataservices
/// </summary>
public class dataservices
{

    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\data.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd = new SqlCommand();
    SqlDataAdapter da = new SqlDataAdapter();



    public dataservices()
    {
        //
        // TODO: Add constructor logic here
        //
        cmd.Connection = cn;
        da.SelectCommand = cmd;
    }
    public int GetID(string ColumnName, string TableName)
    {
        cn.Open();
        cmd.CommandText = "Select max(" + ColumnName + ") from " + TableName;
        string id = cmd.ExecuteScalar().ToString();
        cn.Close();
        if (id == "")
            return 1;
        else
            return Convert.ToInt32(id) + 1;
    }
    //public DataTable GetData(string SQLQuery)
    //{
    //    DataTable dtResult = new DataTable();
    //    cn.Open();
    //    cmd.CommandText = SQLQuery;
    //    da.Fill(dtResult);
    //    cn.Close();
    //    return dtResult;
    //}
    public DataTable GetData(string SQLQuery)
    {
         cn.Open();
        DataTable restultDT = new DataTable();
        cmd.CommandText = SQLQuery;
        da.Fill(restultDT);
        cn.Close();
        return restultDT;

    }
    
    public int UpdateData(string SQLQuery)
    {
        cn.Open();
        cmd.CommandText = SQLQuery;
        int affected = cmd.ExecuteNonQuery();
        cn.Close();
        return affected;
    }
    public int UpdateData(SqlCommand command)
    {
        cn.Open();
        command.Connection = cn;
        int affected=command.ExecuteNonQuery();
        cn.Close();
        return affected;
    }
}