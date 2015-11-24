using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class education : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\data.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd = new SqlCommand();
    SqlDataReader reader;
 
    protected void Page_Load(object sender, EventArgs e)
    {
        emp_txt.Focus();
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
            cmd.CommandText = "select * from education_works where username=@username";
            cmd.Parameters.AddWithValue("@username", Session["username"].ToString());
            reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                emp_txt.Text  = reader["employer"].ToString();
                clg_txt.Text = reader["college_university"].ToString();
                sch_txt.Text = reader["high_school"].ToString();

            }
            cn.Close();

            cmd.Parameters.Clear();
        }


    }
    protected void savechanges_btn_Click(object sender, EventArgs e)
    {
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "select count(*) from education_works where username=@username";
        cmd.Parameters.AddWithValue("@username", Session["username"].ToString());

        int count = Convert.ToInt32(cmd.ExecuteScalar());
        if (count == 0)
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
        Response.Redirect("friendfamily.aspx");
    }
  
}
   
