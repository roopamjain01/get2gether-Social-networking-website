using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class logintemp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        char[] chs = { '/' };
        string[] strs = Request["ReturnUrl"].Split(chs);

        if (strs[0] == "Admin" || strs[1] == "Admin" || strs[2] == "Admin" || strs[2] == "admin" || strs[0] == "admin" || strs[1] == "admin")
        {
            Response.Redirect("Admin/ad_login.aspx");
        }
        else
        {
            Response.Redirect("login.aspx");
        }

    }
}