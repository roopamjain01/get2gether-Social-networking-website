using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class SiteMember_cpassword : System.Web.UI.Page
{
    dataservices ds=new dataservices();
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\data.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd = new SqlCommand();
    SqlDataReader reader;

    protected void Page_Load(object sender, EventArgs e)
    {
        old_txt.Focus();
        if (!IsPostBack)
        {

            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "select first_name, last_name  from login_detail where username=@username";
            cmd.Parameters.AddWithValue("@username", Session["username"].ToString());
            Session["firstName"]="";
        //    string firstName= cmd.ExecuteScalar().ToString();
            reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                Session["firstName"] = reader["first_name"].ToString();
            }
            Label3.Text = Session["firstName"].ToString();
            Label2.Text = reader["last_name"].ToString();
            reader.Close();
            cmd.Parameters.Clear();
            cmd.CommandText = "select photo from profile_picture where username=@username";
            cmd.Parameters.AddWithValue("@username", Session["username"].ToString());

            try
            {
                string filepath = cmd.ExecuteScalar().ToString();
                ImageButton1.ImageUrl = filepath;
            }
            catch (Exception ex)
            {

                ImageButton1.ImageUrl = "~/profilepic/avatar.jpg";

            



            cn.Close();

            cmd.Parameters.Clear();


        }

    }
 

    }
    protected void submit_btn_Click(object sender, EventArgs e)
    {
         
        Label1.Visible = false;
        DataTable dt = ds.GetData("select password from login where user_name='"+Session["username"].ToString()+"'");
        string password=dt.Rows[0][0].ToString();
        if (password == old_txt.Text)
        {
            ds.UpdateData("update login set password='" + new_txt.Text  + "' where user_name= '" + Session["username"].ToString() + "'");
            Label1.Text = "password change successfully";
            Label1.Visible = true;
       }
        else
        {
            Label1.Text = "invalid current password";
            Label1.Visible = true;
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

    }
}