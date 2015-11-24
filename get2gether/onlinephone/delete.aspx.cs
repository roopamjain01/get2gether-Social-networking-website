using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

public partial class delete : System.Web.UI.Page
{
    static string constr = @"Provider= microsoft.ace.oledb.12.0; Data Source= |DataDirectory|\onlinephone.accdb";
    protected void Page_Load(object sender, EventArgs e)
    {
        Label7.Visible = false;
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        OleDbConnection con = new OleDbConnection(constr);
        con.Open();
        string cmdstr = "select number from PHONE where name = @a";
        OleDbCommand com = new OleDbCommand(cmdstr, con);
        com.Parameters.AddWithValue("@a", TextBox4.Text.Trim());
        OleDbDataReader r;
        r = com.ExecuteReader();
        if (r.Read())
        {
            Label7.Visible = true;
            //OleDbConnection con = new OleDbConnection(constr);
            string cmdstr1 = "delete from PHONE where NAME=@a";
            OleDbCommand com1 = new OleDbCommand(cmdstr1, con);
            //con.Open();
            com1.Parameters.AddWithValue("@a", TextBox4.Text);
            com1.ExecuteNonQuery();
            con.Close();
            Label7.Visible = true;
            Label7.Text = "Contact Deleted Successfully...!";
            TextBox4.Text = String.Empty;
            TextBox4.Focus();
        
        }
        else
        {
            Label7.Visible = true;
            Label7.Text = "Contact Not Found...!";
        }
        
    }
}