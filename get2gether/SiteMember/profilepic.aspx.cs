using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class profilepic : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\data.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd = new SqlCommand();
    SqlDataReader reader;
   
    protected void Page_Load(object sender, EventArgs e)
    {
        FileUpload1.Focus();
        if (!IsPostBack)
        {

            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "select first_name, last_name  from login_detail where username=@username";
            cmd.Parameters.AddWithValue("@username", Session["username"].ToString());
            Session["firstName"] = "";
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
                Image2.ImageUrl = filepath;
            }
            catch (Exception ex)
            {

                Image2.ImageUrl = "~/profilepic/avatar.jpg";

            }



            cn.Close();

            cmd.Parameters.Clear();

           

            cn.Open();
            cmd.Connection = cn;
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


        }
    }

    
   
    protected void upload_btn_Click(object sender, EventArgs e)
    {
        string filepath = "";
        if (FileUpload1.HasFile)
        {
            filepath = "~/ProfilePic/" + Session["username"].ToString() + FileUpload1.FileName;
            FileUpload1.SaveAs(Server.MapPath(filepath));



            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "select count(*) from profile_picture where username=@username";
            cmd.Parameters.AddWithValue("@username", Session["username"].ToString());

            int count = Convert.ToInt32(cmd.ExecuteScalar());
            cmd.Parameters.Clear();
            if (count == 0)
            {

                cmd.CommandText = "insert into profile_picture values(@photo,@username)";
            }
            else
            {
                cmd.CommandText = "update profile_picture set photo=@photo where username=@username";

            }
            cmd.Parameters.AddWithValue("@photo", filepath);
            cmd.Parameters.AddWithValue("@username", Session["username"].ToString());

            cmd.ExecuteNonQuery();
            cn.Close();
            cmd.Parameters.Clear();

            Image1.ImageUrl = filepath;

        }
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("education.aspx");
    }
}


















/*



if (!IsPostBack)
        {
            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "select photo from profile_picture where username=@username";
            cmd.Parameters.AddWithValue("@username", Session["username"].ToString());
            string filepath = cmd.ExecuteScalar().ToString();

            if (!(filepath == ""))
            {
                Image1.ImageUrl = filepath;
            }
            cn.Close();

            cmd.Parameters.Clear();
        }*/