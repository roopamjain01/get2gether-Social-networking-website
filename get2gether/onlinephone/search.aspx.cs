using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

public partial class search : System.Web.UI.Page
{
    string constr = @"provider = microsoft.ace.oledb.12.0; data source = |DataDirectory|\onlinephone.accdb";
    protected void Page_Load(object sender, EventArgs e)
    {
        Label6.Visible = false;
        Label5.Visible = false;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        OleDbConnection con = new OleDbConnection(constr);
        con.Open();
        string cmdstr = "select number, name from phone where name = @a";
        OleDbCommand com = new OleDbCommand(cmdstr, con);
        com.Parameters.AddWithValue("@a", TextBox3.Text.Trim());
        OleDbDataReader r;
        r = com.ExecuteReader();
        if (r.Read())
        {
            Label6.Visible = true;
            Label5.Visible = true;
            Label5.Text = (string)r[1] + ":";
            Label6.Text = (string)r[0];
        }
        else
        {
            Label6.Visible = true;
            Label6.Text = "Contact Not Found...!";
        }
    }
}