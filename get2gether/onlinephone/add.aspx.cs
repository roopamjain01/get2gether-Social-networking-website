using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

public partial class add : System.Web.UI.Page
{
    //static string constr = @"provider = microsoft.ace.oledb.12.0; data source = C:\Users\USER\Documents\PHONEDIRDATA.accdb";
    static string constr = @"Provider= microsoft.ace.oledb.12.0; Data Source=|DataDirectory|\onlinephone.accdb";
    protected void Page_Load(object sender, EventArgs e)
    {
        Label4.Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        OleDbConnection con = new OleDbConnection(constr);
        int x=1;
        try
        {
            string cmdstr = "insert into PHONE values(@a,@b)";
            OleDbCommand com = new OleDbCommand(cmdstr, con);

            con.Open();
            com.Parameters.AddWithValue("@a", name.Text);
            com.Parameters.AddWithValue("@b", number.Text);
            com.ExecuteNonQuery();
            con.Close();
        }
        catch (OleDbException ew)
        {
            Label4.Visible = true;
            Label4.Text = "Already Exist....!";
            x=0;
            
        }

        if (x==1)
        {
            Label4.Visible = true;
            Label4.Text = "Contact Added Successfully...!";
        }
        name.Text = String.Empty;
        number.Text = String.Empty;
        name.Focus();
    }
    
}