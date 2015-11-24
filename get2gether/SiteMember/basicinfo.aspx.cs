using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class basicinfo : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\data.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd = new SqlCommand();
    SqlDataReader reader;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        currcity.Focus();
        if(!IsPostBack)
       
        {

            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "select first_name, last_name  from login_detail where username=@username";
            cmd.Parameters.AddWithValue("@username", Session["username"].ToString());
            Session["firstName"]="";
            reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                Session["firstName"] = reader["first_name"].ToString();
            }
            Label1.Text = Session["firstName"].ToString();
            Label2.Text = reader["last_name"].ToString();
            reader.Close();
            cmd.Parameters.Clear();
            cmd.CommandText = "select photo from profile_picture where username=@username";
            cmd.Parameters.AddWithValue("@username", Session["username"].ToString());

            try
            {
                string filepath = cmd.ExecuteScalar().ToString();
                Image1.ImageUrl = filepath;
            }
            catch (Exception ex)
            {

                Image1.ImageUrl = "~/profilepic/avatar.jpg";

            }



            cn.Close();

            cmd.Parameters.Clear();

            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "select * from basic_info where username=@username";
            cmd.Parameters.AddWithValue("@username", Session["username"].ToString());
            reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                currcity.Text = reader["current_city"].ToString();
                htown.Text = reader["hometown"].ToString();
               // dropdown.Text= reader["i_am"].ToString();
              //  dob.Text =  reader["dob"].ToString();
                interest.Text =reader["interested_in"].ToString();
                lang.Text = reader["languages"].ToString();
                about.Text = reader["about_us"].ToString();
            }
            cn.Close();

            cmd.Parameters.Clear();
        }


    }
    protected void savechanges_btn_Click(object sender, EventArgs e)
    {
        

        
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "select count(*) from basic_info where username=@username";
        cmd.Parameters.AddWithValue("@username", Session["username"].ToString());
         
        int count =Convert.ToInt32(  cmd.ExecuteScalar());
        if (count == 0)
        {

             cmd.CommandText = "insert into basic_info values(@current_city,@home_town,@interested_in,@languages,@about_us,@username)";
        }
        else
        {
            cmd.CommandText = "update basic_info set current_city=@current_city,hometown=@home_town,interested_in=@interested_in,languages=@languages,about_us=@about_us where username=@username";
      
        }
        cmd.Parameters.AddWithValue("@current_city", currcity.Text);
        cmd.Parameters.AddWithValue("@home_town", htown.Text);
       // if (dropdown.SelectedIndex >= 0)
         //   cmd.Parameters.AddWithValue("@i_am", dropdown.Text);
       // else
       //     cmd.Parameters.AddWithValue("@i_am", "Male");

      //  cmd.Parameters.AddWithValue("@dob", dob.Text);
        cmd.Parameters.AddWithValue("@interested_in", interest.Text);
        cmd.Parameters.AddWithValue("@languages", lang.Text);
        cmd.Parameters.AddWithValue("@about_us", about.Text);
        cmd.ExecuteNonQuery();
 
        cn.Close();
        Response.Redirect("profilepic.aspx");
    }


   }