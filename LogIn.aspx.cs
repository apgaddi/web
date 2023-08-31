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

namespace WebApp
{
    public partial class LogIn : System.Web.UI.Page
    {
      

        protected void Page_Load(object sender, EventArgs e)
        {
            lblError.Visible=false;
            lblAccess1.Visible = false;
            lblAccess2.Visible = false;
        }

        protected void btnLog_Click(object sender, EventArgs e)
        {
            SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());

            sqlcon.Open();
            string query = "select count(*) from [users] where username=@username and password=@password";
            SqlCommand cmd = new SqlCommand(query, sqlcon);
            cmd.Parameters.AddWithValue("@username", txtName.Text.Trim());
            cmd.Parameters.AddWithValue("@password", txtPass.Text.Trim());
            String count = cmd.ExecuteScalar().ToString();

            if (count == "1")
            {
                Session["username"] = txtName.Text.Trim();
                Session["password"] = txtPass.Text.Trim();

                //        //DBMaster dbm = new DBMaster();

                //        //string username = txtName.Text.Trim();
                //        //string password = txtPass.Text.Trim();
                //        //SqlDataReader rdr = dbm.getReader("select AllowManager,AllowPOS from [hquser] where username='" + username + "' and password='" + password + "'");


                //        //string a1 = "";
                //        //string a2 = "";

                //        //while (rdr.Read())
                //        //{
                //        //    a1 += rdr["AllowManager"].ToString();
                //        //    a2 += rdr["AllowPOS"].ToString();
                //        //}
                //        //dbm.closeConnection();

                //        //lblAccess1.Text = a1;
                //        //lblAccess2.Text = a2;

                //        //Session["AllowManager"] = lblAccess1.Text.Trim();
                //        //Session["AllowPOS"] = lblAccess2.Text.Trim();

                Response.Redirect("CurrentInv.aspx");
            }
            else
            {

                lblError.Visible = true;
            }


        }
            
        }

    }
