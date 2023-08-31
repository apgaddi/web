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
    public partial class InvRecon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                string CS2 = ConfigurationManager.ConnectionStrings["connect"].ToString();
                using (SqlConnection con2 = new SqlConnection(CS2))
                {
                    SqlCommand cmd2 = new SqlCommand("Select ID,ItemName from Item", con2);
                    con2.Open();
                    ddlShift.DataSource = cmd2.ExecuteReader();
                    ddlShift.DataTextField = "ItemName";
                    ddlShift.DataValueField = "ID";
                    ddlShift.DataBind();

                }

            }
        }

        protected void ontextchanged(object sender, EventArgs e)
        {
          
            Label2.Text = ddlShift.Text;
        }

        protected void gvCashierReport_RowDataBound(object sender, GridViewRowEventArgs e)
        { 

        }

        protected void bntGenerate_Click(object sender, EventArgs e)
        {
            string fe = "";
            string Item = Label2.Text.ToString();
            string SDate = txtSDateFuelInv.Text.ToString();
            string MDate = txtEDateFuelInv.Text.ToString();

            DateTime MDateDt = Convert.ToDateTime(MDate);
            DateTime EdateDt = MDateDt.AddDays(1);
            string EDate = Convert.ToString(EdateDt);

                    fe = "[ItemID]='" + Item + "' and [Date]>= '" + SDate + "' and [Date]<'" + EDate + "' ";
                
                
                   

                    SqlDataSource1.FilterExpression = fe;
            gvCashierReport.DataBind();
        }
    }
}