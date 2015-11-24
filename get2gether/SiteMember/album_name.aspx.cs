using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;



public partial class SiteMember_album_name : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\data.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd = new SqlCommand();
    SqlDataReader reader;

    protected void Page_Load(object sender, EventArgs e)
    {
        name_txt.Focus();
        Label3.Visible=false;
        if (!IsPostBack)
        {

            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "select first_name, last_name  from login_detail where username=@username";
            cmd.Parameters.AddWithValue("@username", Session["username"].ToString());
            Session["firstName"] = "";
            //    string firstName= cmd.ExecuteScalar().ToString();
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
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void cancel_btn_Click1(object sender, EventArgs e)
    {
       Response.Redirect("album.aspx");
    }
    
    protected void  Button1_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            string photopath = "~/siteMember/albumPhotos/" + Session["username"].ToString() + FileUpload1.FileName;
            FileUpload1.SaveAs(Server.MapPath(photopath));

            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "select max(albumid) from albumphoto ";
            //cmd.Parameters.AddWithValue("@username", Session["username"].ToString());
            string id = cmd.ExecuteScalar().ToString();
            if (id == "")
                id = "1";
            else
                id = (Convert.ToInt32(id) + 1).ToString();
            cmd.CommandText = "insert into albumphoto(albumid,albumname,albumphoto,location,username) values(@albumid,@albumname,@albumphoto,@location,@username)";
            cmd.Connection = cn;
            cmd.Parameters.AddWithValue("@albumid", id);
            cmd.Parameters.AddWithValue("@albumname", name_txt.Text);
            cmd.Parameters.AddWithValue("@albumphoto", photopath);
            cmd.Parameters.AddWithValue("@location", loc_txt.Text);
            cmd.Parameters.AddWithValue("@username", Session["username"].ToString());

            cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            cn.Close();
            Session["albumid"] = id;



            string albumid = Session["albumid"].ToString();

            cn.Open();
            cmd.Connection = cn;
            
                //if (!(Session["status"] == "No change"))
                //{
                //    cmd.CommandText = "update albumphoto set albumphoto=@albumphoto where albumid='" + albumid + "' ";
                //    cmd.Parameters.AddWithValue("@albumphoto", photopath);
                //    cmd.ExecuteNonQuery();
                //    cmd.Parameters.Clear();
                //}

                cmd.CommandText = "select max(photoid) from photo ";
                string id1 = cmd.ExecuteScalar().ToString();
                if (id1 == "")
                   id1 = "1";
                else
                   id1 = (Convert.ToInt32(id) + 1).ToString();


                cmd.CommandText = "insert into photo values(@photoid,@photo,@albumid)";
                cmd.Parameters.AddWithValue("@photoid", id1);
                cmd.Parameters.AddWithValue("@photo", photopath);
              //  cmd.Parameters.AddWithValue("@dis", dis1_txt.Text);
                cmd.Parameters.AddWithValue("@albumid", albumid);
                cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                cn.Close();
                Response.Redirect("album.aspx");

       //     }
        }
       
        {

            Label3.Visible = true;
            Label3.Text = "Please select photo...";
        }
    }
}