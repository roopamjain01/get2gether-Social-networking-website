using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


public partial class Admin_adchpass : System.Web.UI.Page
{
    dataservices ds = new dataservices();
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\data.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd = new SqlCommand();
    SqlDataReader reader;

    protected void Page_Load(object sender, EventArgs e)
    {
        old_txt.Focus();
    }
    protected void submit_btn_Click(object sender, EventArgs e)
    {
        Label1.Visible = false;
        DataTable dt = ds.GetData("select password from adlogin where user_name='" + Session["username"].ToString() + "'");
        string password = dt.Rows[0][0].ToString();
        if (password == old_txt.Text)
        {
            ds.UpdateData("update adlogin set password='" + new_txt.Text + "' where user_name= '" + Session["username"].ToString() + "'");
            Label1.Text = "password change successfully";
            Label1.Visible = true;
        }
        else
        {
            Label1.Text = "invalid current password";
            Label1.Visible = true;
        }

    }
}