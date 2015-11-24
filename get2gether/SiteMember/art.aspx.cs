using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class art : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\data.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd = new SqlCommand();
    SqlDataReader reader;

    protected void Page_Load(object sender, EventArgs e)
    {
        music_txt.Focus();
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
            cmd.CommandText = "select * from art_entertainment where username=@username";
            cmd.Parameters.AddWithValue("@username", Session["username"].ToString());
            reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                music_txt.Text = reader["music"].ToString();
                book_txt.Text  = reader["books"].ToString();
                movie_txt.Text = reader["movies"].ToString(); 
                tele_txt.Text= reader["television"].ToString();
                game_txt.Text = reader["games"].ToString();

            }
            cn.Close();

            cmd.Parameters.Clear();
        }

    }
    protected void savechanges_btn_Click(object sender, EventArgs e)
    {



        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "select count(*) from art_entertainment where username=@username";
        cmd.Parameters.AddWithValue("@username", Session["username"].ToString());

        int count = Convert.ToInt32(cmd.ExecuteScalar());
        if (count == 0)
        {



            cmd.CommandText = "insert into art_entertainment values(@music,@books,@movies,@television,@games,@username)";
        }
        else
        {
            cmd.CommandText = "update art_entertainment set music=@music,books=@books,movies=@movies,television=@television,games=@games where username=@username";

        }
        cmd.Parameters.AddWithValue("@music", music_txt.Text);
        cmd.Parameters.AddWithValue("@books", book_txt.Text);
        cmd.Parameters.AddWithValue("@movies",movie_txt.Text);
        cmd.Parameters.AddWithValue("@television",tele_txt.Text);
        cmd.Parameters.AddWithValue("@games",game_txt.Text);
        cmd.ExecuteNonQuery();

        cn.Close();
        Response.Redirect("contact.aspx");
        //Session["username"] = username.Text;
    }

}