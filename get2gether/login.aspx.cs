using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;

public partial class login: System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\data.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd = new SqlCommand();
    SqlDataReader reader;
    protected void Page_Load(object sender, EventArgs e)
    {
        user_txt.Focus();
    }
    protected void signin_Click(object sender, ImageClickEventArgs e)
    {
        Label1.Visible = false;
      // int b= "ABC" .CompareTo ("ABC");
        if (user_txt.Text != "" && password_txt.Text != "")
        {
            cn.Open();
            cmd.CommandText = "select user_name,password from login where user_name=@username and password=@password";
            cmd.Parameters.AddWithValue("@username", user_txt.Text);
            cmd.Parameters.AddWithValue("@password", password_txt.Text);
            cmd.Connection = cn;
            reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                FormsAuthentication.RedirectFromLoginPage(user_txt.Text, false);
                Session["username"] = user_txt.Text;

                Response.Redirect("SiteMember/home.aspx");
            }
            else
            {
                Label1.Text = "Account Doesn't Exist";
                Label1.Visible = true;

            }

            cn.Close();

        }
        else
        {
            if (user_txt.Text == "")
                rfv1.Visible = true;
            else if (password_txt.Text == "")
                rfv2.Visible = true;
            else
            {
                rfv1.Visible = true;
                rfv2.Visible = true;
            }
        }
        
    }
    protected void create_acc_btn_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("logindetail.aspx");
    }
}