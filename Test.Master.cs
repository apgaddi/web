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
    public partial class Test : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {


                lblUser.Text = Session["username"].ToString();
                lblUser.Visible = true;
                lblPass.Text = Session["password"].ToString();
                lblPass.Visible = false;
                //lblAccess1.Text = Session["AllowManager"].ToString();
                //lblAccess2.Text = Session["AllowPOS"].ToString();
                //lblAccess1.Visible = lblAccess2.Visible = false;
                //lblNoAcc.Visible = false;

               
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            
                Response.Redirect("Home.aspx");
           

        }

        protected void Menu2_MenuItemClick(object sender, MenuEventArgs e)
        {
            Session.Remove("username");
            Response.Redirect("Login.aspx");
        }

        //protected void Menu3_MenuItemClick(object sender, MenuEventArgs e)
        //{
        //    if (lblAccess2.Text == "1")
        //    {
        //        Response.Redirect("Daily.aspx");
        //    }
        //    else
        //    {
        //        lblNoAcc.Visible = true;

        //    }

        //}

        //protected void Menu4_MenuItemClick(object sender, MenuEventArgs e)
        //{
        //    if (lblAccess2.Text == "1")
        //    {
        //        Response.Redirect("DailySales.aspx");
        //    }
        //    else
        //    {
        //        lblNoAcc.Visible = true;

        //    }
        //}

        //protected void Menu5_MenuItemClick(object sender, MenuEventArgs e)
        //{
        //    if (lblAccess2.Text == "1")
        //    {
        //        Response.Redirect("ShiftSales.aspx");
        //    }
        //    else
        //    {
        //        lblNoAcc.Visible = true;

        //    }
        //}

        //protected void Menu6_MenuItemClick(object sender, MenuEventArgs e)
        //{
        //    if (lblAccess2.Text == "1")
        //    {
        //        Response.Redirect("Gross.aspx");
        //    }
        //    else
        //    {
        //        lblNoAcc.Visible = true;

        //    }
        //}

        //protected void Menu8_MenuItemClick(object sender, MenuEventArgs e)
        //{
        //    if (lblAccess2.Text == "1")
        //    {
        //        Response.Redirect("Diesel.aspx");
        //    }
        //    else
        //    {
        //        lblNoAcc.Visible = true;

        //    }
        //}

        //protected void Menu9_MenuItemClick(object sender, MenuEventArgs e)
        //{
        //    if (lblAccess2.Text == "1")
        //    {
        //        Response.Redirect("Premium.aspx");
        //    }
        //    else
        //    {
        //        lblNoAcc.Visible = true;

        //    }
        //}

        //protected void Menu10_MenuItemClick(object sender, MenuEventArgs e)
        //{
        //    if (lblAccess2.Text == "1")
        //    {
        //        Response.Redirect("Unleaded.aspx");
        //    }
        //    else
        //    {
        //        lblNoAcc.Visible = true;

        //    }
        //}
        
    }
}