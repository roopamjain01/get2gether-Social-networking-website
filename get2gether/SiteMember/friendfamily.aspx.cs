using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class friendfamily : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\data.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd = new SqlCommand();
    SqlDataReader reader;

    protected void Page_Load(object sender, EventArgs e)
    {
        relation_drop.Focus();
        if(!IsPostBack)
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
            cmd.CommandText = "select * from friends_family where username=@username";
            cmd.Parameters.AddWithValue("@username", Session["username"].ToString());
            reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                relation_drop.Text= reader["relationship_status"].ToString();
                //fri_txt.Text  = reader["friends"].ToString();
               

            }
            cn.Close();

            cmd.Parameters.Clear();
        }

    }
    protected void savechanges_btn_Click(object sender, EventArgs e)
    {
        

        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "select count(*) from friends_family where username=@username";
        cmd.Parameters.AddWithValue("@username", Session["username"].ToString());

        int count = Convert.ToInt32(cmd.ExecuteScalar());
        if (count == 0)
                cmd.CommandText = "insert into friends_family values(@relationship_status,@username)";
        else
            cmd.CommandText = "update friends_family set relationship_status=@relationship_status where username=@username";
            if (relation_drop.SelectedIndex >= 0)
            {
                cmd.Parameters.AddWithValue("@relationship_status", relation_drop.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@relationship_status", "");
            }
        //cmd.Parameters.AddWithValue("@friends", fri_txt.Text);
        cmd.ExecuteNonQuery();
        cn.Close();
        Response.Redirect("activity.aspx");
    

    }
}