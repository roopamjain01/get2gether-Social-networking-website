using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


public partial class SiteMember_messagewrite : System.Web.UI.Page
{
    dataservices ds = new dataservices();
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\data.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd = new SqlCommand();
    SqlDataReader reader;

    protected void Page_Load(object sender, EventArgs e)
    {
        message_txt.Focus();
        Label1.Visible = false;
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
            Label3.Text = Session["firstName"].ToString();
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



        
            DataTable dt = ds.GetData("select first_name,last_name from memberDetails where user_name='" + Session       ["f_username"].ToString() + "' ");
            to_txt.Text = dt.Rows[0]["first_name"].ToString() + " " + dt.Rows[0]["last_name"].ToString();            
            to_txt.Text = Session["f_username"].ToString();
        }

    }
    protected void send_btn_Click(object sender, EventArgs e)
    {
        if(message_txt.Text != "")
        {
            Label1.Visible=false;
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "insert into message values(@message,@senddate,@username,@r_username)";
            cmd.Parameters.AddWithValue("@message", message_txt.Text );
            cmd.Parameters.AddWithValue("@senddate",DateTime.Now);
            cmd.Parameters.AddWithValue("@username",@Session["username"].ToString()); 
            cmd.Parameters.AddWithValue("@r_username",Session["f_username"].ToString());
            ds.UpdateData(cmd);
            Label1.Visible = true;
            Label1.Text="Message Sent Successfully...!";
            message_txt.Text = string.Empty;
        }
        else
        {
            Label1.Visible = true;
            Label1.Text="No Text Entered Yet....";
        }
        
        
    }
    protected void cancle_txt_Click(object sender, EventArgs e)
    {
        Response.Redirect("friend.aspx");
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

    }
}