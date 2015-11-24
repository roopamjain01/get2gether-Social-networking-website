using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_adviewpost : System.Web.UI.Page
{
    dataservices ds = new dataservices();
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = ds.GetData("Select * from viewhomepost  where username='" + Session["aduser"] + "' order by date desc");// "
        DataList1.DataSource = dt;
        DataList1.DataBind();

    }
    protected void Button1_command(object sender, CommandEventArgs e)
    {
        ds.UpdateData("delete from homepost where username = '" + Session["aduser"].ToString() + "' and id = '" + Convert.ToInt32(e.CommandName) + "'");
        DataList1.DataBind();
        Response.Redirect("adviewpost.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        ds.UpdateData("delete from homepost where username = '" + Session["aduser"].ToString() + "'");
        DataList1.DataBind();
        Response.Redirect("adviewpost.aspx");
    }
}