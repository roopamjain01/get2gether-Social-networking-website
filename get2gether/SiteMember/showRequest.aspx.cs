using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class SiteMember_showRequest : System.Web.UI.Page
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
            Label4.Visible = false;
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
            UpdateRequestList();



        }
        {
            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "select count(*) from request where r_username=@r_username";
            cmd.Parameters.AddWithValue("@r_username", Session["username"].ToString());
            int count = Convert.ToInt32(cmd.ExecuteScalar());
            if (count != 0)
            {
                Label3.Visible = false;  
            }
            else
            {
                Label3.Visible = true;
                Label3.Text = "No Friend Request !!";
          
            }
            cn.Close();
            cmd.Parameters.Clear();


        }

    }

   protected void ImageButton1_Click(object sender, ImageClickEventArgs e)

    {

    }

        

    public void UpdateRequestList()
    {
            DataTable dt = ds.GetData("Select r.username, ld.first_name, ld.last_name, p.photo from request r join login_detail ld on r.username=ld.username join profile_picture p on r.username=p.username where r.r_username='" + Session["username"] + "'");
            DataList1.DataSource = dt;
            DataList1.DataBind();
      
    }
    protected void Button1_command(object sender, CommandEventArgs e)
    {
       
           
       ds.UpdateData("insert into friends values ('" + Session["username"].ToString() + "','" + e.CommandName +"')");
       ds.UpdateData("insert into friends values ('" + e.CommandName + "','" + Session["username"].ToString() + "')");
         Label4.Visible=true;
        Label4.Text= "Added Successfully....!";
       ds.UpdateData("delete from request where username='"+e.CommandName+"' and r_username='"+Session["username"]+"'   ");

       UpdateRequestList();
    }
    protected void Button2_command(object sender, CommandEventArgs e)
    {

        ds.UpdateData("delete from request where  username='" + e.CommandName + "' and r_username='" + Session["username"] + "'   ");

        UpdateRequestList();
    }
   
}