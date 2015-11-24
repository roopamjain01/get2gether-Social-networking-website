using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class SiteMember_art1 : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\data.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd = new SqlCommand();
    SqlDataReader reader;

    protected void Page_Load(object sender, EventArgs e)
    {
        music_txt.Focus();
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
        cmd.Parameters.Clear();

        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "select count(*)from contact_information where username=@username";
        cmd.Parameters.AddWithValue("@username", Session["username"].ToString());

        int count1 = Convert.ToInt32(cmd.ExecuteScalar());
        if (count1 == 0)
        {

            cmd.CommandText = "insert into contact_information values(@emails,@phones,@address,@city_town,@username)";
        }
        else
        {
            cmd.CommandText = "update contact_information set emails=@emails,phones=@phones,address=@address,city_town=@city_town where username=@username";

        }
        cmd.Parameters.AddWithValue("@emails", email_txt.Text);
        cmd.Parameters.AddWithValue("@phones", ph_txt.Text);
        cmd.Parameters.AddWithValue("@address", add_txt.Text);
        cmd.Parameters.AddWithValue("@city_town", city_txt.Text);
        cmd.ExecuteNonQuery();
        cn.Close();
    

        cmd.Parameters.Clear();
        Response.Redirect("profilepic1.aspx");
    
   



       
  
    }

}