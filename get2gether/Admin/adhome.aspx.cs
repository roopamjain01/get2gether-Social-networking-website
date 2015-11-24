using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.IO.MemoryMappedFiles;

public partial class Admin_adhome : System.Web.UI.Page
{
    dataservices ds = new dataservices();
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = ds.GetData("Select l.user_name,ld.first_name,ld.last_name, p.photo from login l join login_detail ld on l.user_name=ld.username join profile_picture p on  l.user_name=p.username");
        ListView1.DataSource = dt;
        ListView1.DataBind();        
        
    }

    protected void Button1_command(object sender, CommandEventArgs e)
    {
        Session["aduser"] = e.CommandName;
        Response.Redirect("adviewprofile.aspx");       
    }
    protected void Button2_command(object sender, CommandEventArgs e)
    {
        Session["aduser"] = e.CommandName;
        Response.Redirect("adviewmessage.aspx");
    }
    protected void Button3_command(object sender, CommandEventArgs e)
    {
        Session["aduser"] = e.CommandName;
        Response.Redirect("adviewpost.aspx");
  
    }
    protected void Button4_command(object sender, CommandEventArgs e)
    {
        Session["aduser"] = e.CommandName;
        //DataTable dt1 = ds.GetData("select img from post ");
        //foreach (DataRow dr in dt1.Rows)
        //{
        //    string imgpath = dr["img"].ToString();
        //    File.Delete(Server.MapPath(imgpath));
        //}
        //DataTable dt2 = ds.GetData("select photo from photo where albumid='" + Convert.ToInt32(e.CommandName) + "' ");

        //foreach (DataRow dr in dt1.Rows)
        //{
        //    string photopath = dr["photo"].ToString();
        //    File.Delete(Server.MapPath(photopath));
        //}
      
       
       // ds.UpdateData(" delete from  friends_family where username='" + Session["aduser"].ToString() + "'");
        ds.UpdateData(" delete from  friends where f_username='" + Session["aduser"].ToString() + "'");
        ds.UpdateData(" delete from  friends where username='" + Session["aduser"].ToString() + "'");
        ds.UpdateData(" delete from login where user_name='" + Session["aduser"].ToString() + "' ");
        ListView1.DataBind();
        Response.Redirect("adhome.aspx");
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        DataTable dt = ds.GetData("Select user_name,first_name,last_name,photo from login l join login_detail ld on l.user_name=ld.username join profile_picture p on  l.user_name=p.username where ld.first_name='" + TextBox1.Text + "' or ld.last_name='" + TextBox1.Text + "'");
        ListView1.DataSource = dt;
        ListView1.DataBind();    
    }
}