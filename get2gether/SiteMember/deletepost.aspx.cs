using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.IO.MemoryMappedFiles;


public partial class SiteMember_deletepost : System.Web.UI.Page
{

    dataservices ds = new dataservices();
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\data.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd = new SqlCommand();
    SqlDataReader reader;

    protected void Page_Load(object sender, EventArgs e)
    {
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

            DataTable dt = ds.GetData("Select * from viewpost  where username='" + Session["username"] + "' order by date desc");
            DataList1.DataSource = dt;
            DataList1.DataBind();
        }
    }
    protected void Button1_command(object sender, CommandEventArgs e)
    {
        DataTable dt = ds.GetData("select img from post where id='" + Convert.ToInt32(e.CommandName) + "' ");
        string imgpath = dt.Rows[0][0].ToString();
        File.Delete(Server.MapPath(imgpath));
 
        ds.UpdateData("delete from post where username = '" + Session["username"].ToString() + "' and id = '" + Convert.ToInt32(e.CommandName) + "'");
        DataList1.DataBind();
        Response.Redirect("deletepost.aspx");
    }
    

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

    }
}