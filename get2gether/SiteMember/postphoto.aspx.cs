using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


public partial class SiteMember_postphoto : System.Web.UI.Page
{
    dataservices ds = new dataservices();
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\data.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd = new SqlCommand();
    SqlDataReader reader;

    protected void Page_Load(object sender, EventArgs e)
    {
        TextBox1.Focus();
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
                ImageButton1.ImageUrl = filepath;
            }
            catch (Exception ex)
            {

                ImageButton1.ImageUrl = "~/profilepic/avatar.jpg";

            }
            cn.Close();
            cmd.Parameters.Clear();

            DataTable dt = ds.GetData("Select * from viewpost order by date desc");
            DataList1.DataSource = dt;
            DataList1.DataBind();


        }

    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            string photopath = "~/siteMember/postphoto/" + Session["username"].ToString() + FileUpload1.FileName;
            FileUpload1.SaveAs(Server.MapPath(photopath));


            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "insert into post values(@img,@post,@date,@username)";
            cmd.Parameters.AddWithValue("@post", TextBox1.Text);
            cmd.Parameters.AddWithValue("@img", photopath);
            cmd.Parameters.AddWithValue("@date", DateTime.Now);
            cmd.Parameters.AddWithValue("@username", @Session["username"].ToString());
            cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            cn.Close();
            Response.Redirect("postphoto.aspx");
            


        }
        
        
        /*
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "insert into homepost values(@post, @date, @username)";

        cmd.Parameters.AddWithValue("@post", TextBox1.Text);
        cmd.Parameters.AddWithValue("@date", DateTime.Now);
        cmd.Parameters.AddWithValue("@username", @Session["username"].ToString());
        ds.UpdateData(cmd);
        Response.Redirect("home.aspx");
       */
    }
}