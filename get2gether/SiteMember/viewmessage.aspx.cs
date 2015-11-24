using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class SiteMember_viewmessage : System.Web.UI.Page
{
    dataservices ds = new dataservices();
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\data.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd = new SqlCommand();
    SqlDataReader reader;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Label3.Visible = false;
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

            DataTable dt = ds.GetData("Select id, user_name, first_name, last_name, message, photo, senddate from message_details md where r_username='" + Session["username"] + "' order by senddate desc");
            DataList1.DataSource = dt;
            DataList1.DataBind();

            {
                cn.Open();
                cmd.Connection = cn;
                cmd.CommandText = "select count(*) from message_details where r_username=@r_username";
                cmd.Parameters.AddWithValue("@r_username", Session["username"].ToString());
                int count = Convert.ToInt32(cmd.ExecuteScalar());
                if (count != 0)
                {
                    Label3.Visible = false;
                }
                else
                {
                    Label3.Visible = true;
                }
                cn.Close();
                cmd.Parameters.Clear();


            }

        }

    }
    protected void Button1_command(object sender, CommandEventArgs e)
    {

        Session["f_username"] = e.CommandName;
        Response.Redirect("messagewrite.aspx");
    }
    protected void Button2_command(object sender, CommandEventArgs e)
    {
        ds.UpdateData("delete from message where r_username='" + Session["username"] + "' and id='" + e.CommandName + "'");
        DataList1.DataBind();
        Response.Redirect("viewmessage.aspx");
    }
        
    


    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

    }
   

}