using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class SiteMember_profilepic1 : System.Web.UI.Page
{
   
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\data.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd = new SqlCommand();
    SqlDataReader reader;
   
    protected void Page_Load(object sender, EventArgs e)
    {
        FileUpload1.Focus();
    }
     protected void upload_btn_Click(object sender, EventArgs e)
    {
        string filepath = "";
        if (FileUpload1.HasFile)
        {
            filepath = "~/ProfilePic/" + Session["username"].ToString() + FileUpload1.FileName;
            FileUpload1.SaveAs(Server.MapPath(filepath));
            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "select count(*) from profile_picture where username=@username";
            cmd.Parameters.AddWithValue("@username", Session["username"].ToString());

            int count = Convert.ToInt32(cmd.ExecuteScalar());
            cmd.Parameters.Clear();
            if (count == 0)
            {

                cmd.CommandText = "insert into profile_picture values(@photo,@username)";
            }
            else
            {
                cmd.CommandText = "update profile_picture set photo=@photo where username=@username";

            }
            cmd.Parameters.AddWithValue("@photo", filepath);
            cmd.Parameters.AddWithValue("@username", Session["username"].ToString());

            cmd.ExecuteNonQuery();
            cn.Close();
            cmd.Parameters.Clear();

            Image1.ImageUrl = filepath;

        }
        
    }
   
    protected void savechanges_btn_Click(object sender, EventArgs e)
    {
        Response.Redirect("information.aspx");
    }
}

