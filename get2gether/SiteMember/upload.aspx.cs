using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class SiteMember_upload : System.Web.UI.Page
{

    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\data.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd = new SqlCommand();
    SqlDataReader reader;
   
    
    protected void Page_Load(object sender, EventArgs e)
    {
        FileUpload1.Focus();
        Label8.Visible = false;
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
        }


    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string albumid = Session["albumid"].ToString();


        if (FileUpload1.HasFile)
        {
            string photopath = "~/siteMember/Photos/" + Session["username"].ToString() + FileUpload1.FileName;
            FileUpload1.SaveAs(Server.MapPath(photopath));


            cn.Open();

            cmd.Connection = cn;
            /*{
                cmd.CommandText = "update albumphoto set albumphoto=@albumphoto where albumid='" + albumid + "' ";
                cmd.Parameters.AddWithValue("@albumphoto", photopath);
                cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
            }*/

            cmd.CommandText = "select max(photoid) from photo ";
            string id = cmd.ExecuteScalar().ToString();
            if (id == "")
                id = "1";
            else
                id = (Convert.ToInt32(id) + 1).ToString();


            cmd.CommandText = "insert into photo values(@photoid,@photo,@albumid)";
            cmd.Parameters.AddWithValue("@photoid", id);
            cmd.Parameters.AddWithValue("@photo", photopath);
            cmd.Parameters.AddWithValue("@albumid", albumid);
            cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            cn.Close();


            Response.Redirect("album.aspx");


        }
        else
        {
            Label8.Visible = true;
            Label8.Text = "Please Select Photo...";
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

    }
}