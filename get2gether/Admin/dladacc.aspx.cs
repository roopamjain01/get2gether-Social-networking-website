using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class Admin_dladacc : System.Web.UI.Page
{
    dataservices ds = new dataservices();
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = ds.GetData("Select l.user_name,ld.first_name,ld.last_name from adlogin l join adlogin_detail ld on l.user_name=ld.username");
        ListView1.DataSource = dt;
        ListView1.DataBind();
    }

   protected void Button1_command(object sender, CommandEventArgs e)
    {
        Session["auser"] = e.CommandName;    
        ds.UpdateData("delete from adlogin where user_name='" + Session["auser"].ToString() + "' ");
        ListView1.DataBind();
        Response.Redirect("adsetting.aspx");
    }

   protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
   {
       DataTable dt = ds.GetData("Select user_name,first_name,last_name from adlogin l join adlogin_detail ld on l.user_name=ld.username where ld.first_name='" + TextBox1.Text + "' or ld.last_name='" + TextBox1.Text + "'");
       ListView1.DataSource = dt;
       ListView1.DataBind();    
   }
}