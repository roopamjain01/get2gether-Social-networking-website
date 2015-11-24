using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class Admin_adviewmessage : System.Web.UI.Page
{
    dataservices ds = new dataservices();

    protected void Page_Load(object sender, EventArgs e)
    {
         // Label1.Visible = false;
         // DataTable dt1= ds.GetData("select count(*) from message where r_username='"+Session["adusername"].ToString()+"'");

         // Label1.Visible = true;
         // Label1.Text = (dt1.Rows[0][0]).ToString(); 
         //// int count = Convert.ToInt32(dt1.Rows[0][0]);

          //if (count == 0)
          //{
          //    Label1.Visible = true;
          //    Label1.Text = "No Message.....!";
          
          //}
          //else
          //{
            DataTable dt = ds.GetData("Select id, user_name, first_name, last_name, message, photo, senddate from message_details md where r_username='" + Session["aduser"] + "' order by senddate desc");
            DataList1.DataSource = dt;
            DataList1.DataBind();
        }

    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_command(object sender, CommandEventArgs e)
    {
        ds.UpdateData("delete from message where r_username='" + Session["aduser"] + "' and id='" + e.CommandName + "'");
        DataList1.DataBind();
        Response.Redirect("adviewmessage.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        ds.UpdateData("delete from message where r_username='" + Session["aduser"] + "'");
        DataList1.DataBind();
        Response.Redirect("adviewmessage.aspx");

    }
}

