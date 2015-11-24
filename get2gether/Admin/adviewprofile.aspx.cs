using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


public partial class Admin_adviewprofile : System.Web.UI.Page
{
    dataservices ds = new dataservices();   
    protected void Page_Load(object sender, EventArgs e)
    {

        {
            DataTable dt = ds.GetData("select first_name, last_name, i_am,ld.dobdd, ld.dobmm, ld.dobyy  from login_detail ld where ld.username='" + Session["aduser"].ToString() + "'");
            name_lbl.Text = dt.Rows[0][0].ToString();
            Label2.Text = dt.Rows[0][1].ToString();
            gen_lbl.Text = dt.Rows[0][2].ToString();
            dd_lbl.Text = dt.Rows[0][3].ToString();
            mm_lbl.Text = dt.Rows[0][4].ToString();
            yy_lbl.Text = dt.Rows[0][5].ToString();
        }
        {
            DataTable dt = ds.GetData("select bi.current_city, bi.hometown, interested_in, languages, relationship_status, employer, college_university, high_school, music, books, movies, television, games, activities, interests, emails, phones, address, city_town from basic_info bi join friends_family ff on bi.username=ff.username join education_works ew on ff.username=ew.username join art_entertainment ae on ew.username=ae.username join act_interest ai on ae.username=ai.username join contact_information ci on ai.username=ci.username where bi.username='" + Session["aduser"].ToString() + "'");
            cc_lbl.Text = dt.Rows[0][0].ToString();
            ht_lbl.Text = dt.Rows[0][1].ToString();
            int_lbl.Text = dt.Rows[0][2].ToString();
            lng_lbl.Text = dt.Rows[0][3].ToString();
            rel_lbl.Text = dt.Rows[0][4].ToString();
            emp_lbl.Text = dt.Rows[0][5].ToString();
            clg_lbl.Text = dt.Rows[0][6].ToString();
            hs_lbl.Text = dt.Rows[0][7].ToString();
            music_lbl.Text = dt.Rows[0][8].ToString();
            books_lbl.Text = dt.Rows[0][9].ToString();
            movies_lbl.Text = dt.Rows[0][10].ToString();
            tele_lbl.Text = dt.Rows[0][11].ToString();
            game_lbl.Text = dt.Rows[0][12].ToString();
            activity_lbl.Text = dt.Rows[0][13].ToString();
            interest_lbl.Text = dt.Rows[0][14].ToString();
            email_lbl.Text = dt.Rows[0][15].ToString();
            ph_lbl.Text = dt.Rows[0][16].ToString();
            add_lbl.Text = dt.Rows[0][17].ToString();
            city_lbl.Text = dt.Rows[0][18].ToString();
        }



    }
}