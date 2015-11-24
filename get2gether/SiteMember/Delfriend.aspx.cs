using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class SiteMember_Delfriend : System.Web.UI.Page
{
    dataservices ds = new dataservices();
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\data.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd = new SqlCommand();
    SqlDataReader reader;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //DataList2.DataBind();
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

            DataTable dt = ds.GetData("Select user_name,first_name,last_name,photo from login l join login_detail ld on l.user_name=ld.username join profile_picture p on  l.user_name=p.username join friends f on l.user_name=f.username where f.f_username='" + Session["username"] + "'");
            DataList2.DataSource = dt;
            DataList2.DataBind();
        }

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void Button1_command(object sender, CommandEventArgs e)
    {

        ds.UpdateData("delete from friends where username = '" + e.CommandName + "' and f_username = '" + Session["username"] + "'");
        ds.UpdateData("delete from friends where f_username = '" + e.CommandName + "' and username = '" + Session["username"] + "'");
        DataList2.DataBind();
        Response.Redirect("delfriend.aspx");
    }
   
}