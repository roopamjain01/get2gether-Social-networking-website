using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.IO.MemoryMappedFiles;

public partial class Admin_viewphotopost : System.Web.UI.Page
{
    dataservices ds = new dataservices();
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = ds.GetData("Select * from viewpost where username='" + Session["aduser"] + "' order by date desc");
        DataList1.DataSource = dt;
        DataList1.DataBind();

    }
    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_command(object sender, CommandEventArgs e)
    {
        DataTable dt = ds.GetData("select img from post where id='" + Convert.ToInt32(e.CommandName) + "' ");
        string imgpath = dt.Rows[0][0].ToString();
        File.Delete(Server.MapPath(imgpath));
       
        ds.UpdateData("delete from post where username = '" + Session["aduser"].ToString() + "' and id = '" + Convert.ToInt32(e.CommandName) + "'");
        DataList1.DataBind();
        Response.Redirect("viewphotopost.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {

        //DataTable dt1 = ds.GetData("select img from post ");

        //foreach (DataRow dr in dt1.Rows)
        //{
        //    string imgpath = dr["img"].ToString();
        //    File.Delete(Server.MapPath(imgpath));
        //}
      
        //ds.UpdateData("delete from post where username = '" + Session["aduser"].ToString() + "'");
        DataList1.DataBind();
        Response.Redirect("viewphotopost.aspx");

    }
}