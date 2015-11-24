using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class SiteMember_basicinfo1 : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\data.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd = new SqlCommand();
    SqlDataReader reader;

    protected void Page_Load(object sender, EventArgs e)
    {
        currcity.Focus();
    }

    protected void savechanges_btn_Click(object sender, EventArgs e)
    {
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "select count(*) from basic_info where username=@username";
        cmd.Parameters.AddWithValue("@username", Session["username"].ToString());

        int count = Convert.ToInt32(cmd.ExecuteScalar());
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
      //  if (dropdown.SelectedIndex >= 0)
        //    cmd.Parameters.AddWithValue("@i_am", dropdown.Text);
       // else
        //    cmd.Parameters.AddWithValue("@i_am", "Male");

       // cmd.Parameters.AddWithValue("@dob", dob.Text);
        cmd.Parameters.AddWithValue("@interested_in", interest.Text);
        cmd.Parameters.AddWithValue("@languages", lang.Text);
        cmd.Parameters.AddWithValue("@about_us", about.Text);
        cmd.ExecuteNonQuery();

        cn.Close();
        cmd.Parameters.Clear();
        
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "select count(*) from act_interest where username=@username";
        cmd.Parameters.AddWithValue("@username", Session["username"].ToString());

        int count1 = Convert.ToInt32(cmd.ExecuteScalar());
        if (count1 == 0)
        {

            cmd.CommandText = "insert into act_interest values(@activities,@interests,@username)";
        }
        else
        {
            cmd.CommandText = "update act_interest set activities=@activities,interests=@interests where username=@username";

        }
        cmd.Parameters.AddWithValue("@activities", act_txt.Text);
        cmd.Parameters.AddWithValue("@interests", int_txt.Text);
        cmd.ExecuteNonQuery();
        cn.Close();
        cmd.Parameters.Clear();
       

        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "select count(*) from friends_family where username=@username";
        cmd.Parameters.AddWithValue("@username", Session["username"].ToString());

        int count2 = Convert.ToInt32(cmd.ExecuteScalar());
        if (count2 == 0)
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
        cmd.Parameters.Clear();

        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "select count(*) from education_works where username=@username";
        cmd.Parameters.AddWithValue("@username", Session["username"].ToString());

        int count3 = Convert.ToInt32(cmd.ExecuteScalar());
        if (count3 == 0)
        {

            cmd.CommandText = "insert into education_works values(@employer,@college_university,@high_school,@username)";
        }
        else
        {
            cmd.CommandText = "update education_works set employer=@employer,college_university=@college_university,high_school=@high_school where username=@username";

        }
        cmd.Parameters.AddWithValue("@employer", emp_txt.Text);
        cmd.Parameters.AddWithValue("@college_university", clg_txt.Text);
        cmd.Parameters.AddWithValue("@high_school", sch_txt.Text);
        cmd.ExecuteNonQuery();
        cn.Close();
        Response.Redirect("art1.aspx");

    }
}