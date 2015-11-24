using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Data.SqlClient;


public partial class SiteMember_friendlist : System.Web.UI.Page
{
    dataservices ds=new dataservices();
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\data.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd = new SqlCommand();
    SqlDataReader reader;

    protected void Page_Load(object sender, EventArgs e)
    {
        TextBox1.Focus();
        if (!IsPostBack)
        {
            DataList2.DataBind();
            Label1.Visible = false;
            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "select first_name, last_name  from login_detail where username=@username";
            cmd.Parameters.AddWithValue("@username", Session["username"].ToString());
            Session["firstName"]="";
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
                ImageButton2.ImageUrl = filepath;
            }
            catch (Exception ex)
            {

                ImageButton2.ImageUrl = "~/profilepic/avatar.jpg";

            }



            cn.Close();

            cmd.Parameters.Clear();
            


        }

    }
   protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        DataTable dt = ds.GetData("Select l.user_name, ld.first_name, ld.last_name, p.photo from login l join login_detail ld on l.user_name=ld.username join profile_picture p on  l.user_name=p.username where (first_name='" + TextBox1.Text + "' or last_name='" + TextBox1.Text + "') and (not(user_name='" + Session["username"]+"')) and (ld.username not in(Select f_username from friends where friends.username='"+ Session ["username"].ToString () + "'))");
        DataList2.DataSource = dt;
        DataList2.DataBind();
        Label1.Visible = false;


        DataTable dx = ds.GetData("Select count(*) from login l join login_detail ld on l.user_name=ld.username join profile_picture p on  l.user_name=p.username where (first_name='" + TextBox1.Text + "' or last_name='" + TextBox1.Text + "') and (not(user_name='" + Session["username"] + "')) and (ld.username not in(Select f_username from friends where friends.username='" + Session["username"].ToString() + "'))");
        if (Convert.ToInt32(dx.Rows[0][0]) == 0)
        {
            Label1.Visible = true;
            Label1.Text = "    Not Found !!";
        }

    }

    
    protected void Button1_command(object sender, CommandEventArgs e)
    {  
       
        DataTable dt = ds.GetData("select count(*) from  request  where username='" + Session["username"].ToString() + "' and r_username='" + e.CommandName + "' ");
        if (Convert.ToInt32(dt.Rows[0][0]) == 0)
        {
            ds.UpdateData("insert into request values ('" + Session["username"].ToString() + "','" + e.CommandName + "' )");
        }
        else
        {
            Label1.Visible = true;
            Label1.Text = "Request Allready Send.";
        }
        DataList2.DataBind();
    }
    protected void DataList2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
    {


    }
}