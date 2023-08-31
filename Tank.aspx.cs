using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using WebApp.App_Code;
using System.Drawing;


namespace WebApp
{
    public partial class Tank : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["username"] != null)
            {
                lblUser.Text = Session["username"].ToString();
                lblUser.Visible = false;
                lblPass.Text = Session["password"].ToString();
                lblPass.Visible = false;
                lblStn.Text = Session["station"].ToString();
                lblStn.Visible = true;
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

            DBMaster dbm = new DBMaster();

            SqlDataReader rdr = dbm.getReader("select D1,U1,P1,D1AS,U1AS,P1AS,D1C,U1C,P1C,D1DS,U1DS,P1DS,D1T,U1T,P1T,Multiplier from Inventory INNER JOIN Station ON Inventory.StationID=Station.StationCode where Station.StationName='" +lblStn.Text+"'");

            string a1 = "";
            string a2 = "";
            string a3 = "";
            string a4 = "";
            string a5 = "";
            string a6 = "";
            string a7 = "";
            string a8 = "";
            string a9 = "";
            string a10 = "";
            string a11 = "";
            string a12 = "";
            string a13 = "";
            string a14 = "";
            string a15 = "";
            string a16 = "";


            while (rdr.Read())
            {
                a1 += rdr["D1"].ToString();
                a2 += rdr["U1"].ToString();
                a3 += rdr["P1"].ToString();
                a4 += rdr["D1AS"].ToString();
                a5 += rdr["U1AS"].ToString();
                a6 += rdr["P1AS"].ToString();
                a7 += rdr["D1C"].ToString();
                a8 += rdr["U1C"].ToString();
                a9 += rdr["P1C"].ToString();
                a10 += rdr["D1DS"].ToString();
                a11 += rdr["U1DS"].ToString();
                a12 += rdr["P1DS"].ToString();
                a13 += rdr["D1T"].ToString();
                a14 += rdr["U1T"].ToString();
                a15 += rdr["P1T"].ToString();
                a16 += rdr["Multiplier"].ToString();

            }
            dbm.closeConnection();

            float a1a = float.Parse(a1);
            string a1aa = String.Format("{0:0,0.00}", a1a);
            lblD1.Text = a1aa;

            float a2a = float.Parse(a2);
            string a2aa = String.Format("{0:0,0.00}", a2a);
            lblU1.Text = a2aa;

            float a3a = float.Parse(a3);
            string a3aa = String.Format("{0:0,0.00}", a3a);
            lblP1.Text = a3aa;

            float a4a = float.Parse(a4);
            string a4aa = String.Format("{0:0,0.00}", a4a);
            lblD1AS.Text = a4aa;

            float a5a = float.Parse(a5);
            string a5aa = String.Format("{0:0,0.00}", a5a);
            lblU1AS.Text = a5aa;

            float a6a = float.Parse(a6);
            string a6aa = String.Format("{0:0,0.00}", a6a);
            lblP1AS.Text = a6aa;

            float a7a = float.Parse(a7);
            string a7aa = String.Format("{0:0,0.00}", a7a);
            lblD1C.Text = a7aa;

            float a8a = float.Parse(a8);
            string a8aa = String.Format("{0:0,0.00}", a8a);
            lblU1C.Text = a8aa;

            float a9a = float.Parse(a9);
            string a9aa = String.Format("{0:0,0.00}", a9a);
            lblP1C.Text = a9aa;

            float a10a = float.Parse(a10);
            string a10aa = String.Format("{0:0,0.00}", a10a);
            lblD1DS.Text = a10aa;

            float a11a = float.Parse(a11);
            string a11aa = String.Format("{0:0,0.00}", a11a);
            lblU1DS.Text = a11aa;

            float a12a = float.Parse(a12);
            string a12aa = String.Format("{0:0,0.00}", a12a);
            lblP1DS.Text = a12aa;

            float a16a = float.Parse(a16);

            float b1 = a7a - a1a;
            string b1a = String.Format("{0:0,0.00}", b1);
            lblD1U.Text = b1a;

            float b2 = a8a - a2a;
            string b2a = String.Format("{0:0,0.00}", b2);
            lblU1U.Text = b2a;

            float b3 = a9a - a3a;
            string b3a = String.Format("{0:0,0.00}", b3);
            lblP1U.Text = b3a;

            float c1 = a1a - a10a;
            string c1a = String.Format("{0:0,0.00}", c1);
            lblD1LA.Text = c1a;

            float c2 = a2a - a11a;
            string c2a = String.Format("{0:0,0.00}", c2);
            lblU1LA.Text = c2a;

            float c3 = a3a - a12a;
            string c3a = String.Format("{0:0,0.00}", c3);
            lblP1LA.Text = c3a;

            float d1 = c1 / a4a;
            string d1a = d1.ToString("n");
            string d1aa = d1a + " days";
            lblD1DTS.Text = d1aa;

            float d2 = c2 / a5a;
            string d2a = d2.ToString("n");
            string d2aa = d2a + " days";
            lblU1DTS.Text = d2aa;

            float d3 = c3 / a6a;
            string d3a = d3.ToString("n");
            string d3aa = d3a + " days";
            lblP1DTS.Text = d3aa;

            Image1.ImageUrl = "~/images/dtank/" + a13 + ".jpg";
            Image2.ImageUrl = "~/images/utank/" + a14 + ".jpg";
            Image3.ImageUrl = "~/images/ptank/" + a15 + ".jpg";
        }

        
        protected void bntLogOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void btnCuInv_Click(object sender, EventArgs e)
        {
            Response.Redirect("CurrentInv.aspx");
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("Order.aspx");
        }

        protected void bntInvRecon_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewInv.aspx");
        }

        protected void btnSales_Click(object sender, EventArgs e)
        {
            Response.Redirect("MonthlySales.aspx");
        }

        protected void btnATG_Click(object sender, EventArgs e)
        {
            Response.Redirect("ATG.aspx");
        }
    }
}