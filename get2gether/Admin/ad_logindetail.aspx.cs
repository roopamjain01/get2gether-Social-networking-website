using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;

public partial class Admin_ad_logindetail : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\data.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd = new SqlCommand();
    SqlDataReader reader;
    dataservices db = new dataservices();


    protected void Page_Load(object sender, EventArgs e)
    {
        fname.Focus();
        fillcalender();
    }

    protected void fillcalender()
    {
        DateTime thisdate = (DateTime.Now).AddYears(-1);
        for (int x = 0; x < 12; x++)
        {
            ListItem li = new ListItem(thisdate.ToString("MMMM"), thisdate.Month.ToString());
            mm.Items.Add(li);
            thisdate = thisdate.AddMonths(1);
        }

        for (int y = thisdate.Year; y >= 1965; y--)
        {
            yy.Items.Add(y.ToString());
        }
        for (int z = 1; z <= 31; z++)
        {
            dd.Items.Add(z.ToString());
        }
    }




    protected void submit_Click(object sender, ImageClickEventArgs e)
    {
        cn.Open();
        cmd.CommandText = "select user_name from adlogin where user_name=@username";
        cmd.Parameters.AddWithValue("@username", username.Text);
        cmd.Connection = cn;
        reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            Label1.Text = "User account Already exist";
            Label1.Visible = true;

        }
        else
        {
            reader.Close();
            cmd.Parameters.Clear();
            cmd.CommandText = "insert into adlogin values(@username,@password)";
            cmd.Parameters.AddWithValue("@username", username.Text);
            cmd.Parameters.AddWithValue("@password", password.Text);
            cmd.Connection = cn;
            cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            cmd.CommandText = "insert into adlogin_detail values(@first_name,@last_name,@username,@i_am,@dobdd,@dobmm,@dobyy)";
            cmd.Parameters.AddWithValue("@first_name", fname.Text);
            cmd.Parameters.AddWithValue("@last_name", lname.Text);
            cmd.Parameters.AddWithValue("@username", username.Text);
            cmd.Parameters.AddWithValue("@i_am", gender_drop_list.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@dobdd", dd.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@dobmm", mm.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@dobyy", yy.SelectedItem.Text);

            cmd.ExecuteNonQuery();

            cn.Close();
            cmd.Parameters.Clear();

           // cmd.CommandText = "insert into profile_picture values(@photo,@username)";
          //  cmd.Parameters.AddWithValue("@photo", "~/profilepic/avatar.jpg");
          //  cmd.Parameters.AddWithValue("@username", username.Text);
         //   db.UpdateData(cmd);

          //  FormsAuthentication.RedirectFromLoginPage(username.Text, false);
            Session["username"] = username.Text;
            Response.Redirect("adsettting.aspx");
            
        }

    }
}