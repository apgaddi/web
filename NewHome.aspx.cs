using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using WebApp.App_Code;
using System.IO;


namespace WebApp
{
    public partial class NewHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                lblUser.Text = Session["username"].ToString();
                lblUser.Visible = false;
                lblPass.Text = Session["password"].ToString();
                lblPass.Visible = false;
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnInv_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewInv.aspx");
        }

        protected void btnCuInv_Click(object sender, EventArgs e)
        {
            Response.Redirect("CurrentInv.aspx");
        }

        protected void btnSales_Click(object sender, EventArgs e)
        {
            Response.Redirect("MonthlySales.aspx");
        }

        protected void btnLog_Click(object sender, EventArgs e)
        {
            Response.Redirect("LogIn.aspx");
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("Order.aspx");
        }
    }
}