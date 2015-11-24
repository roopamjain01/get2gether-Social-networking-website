using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class welcome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void acc_btn_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("basicinfo1.aspx");
    }
}