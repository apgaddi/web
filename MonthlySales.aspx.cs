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
    public partial class MonthlySales : System.Web.UI.Page
    {
        private decimal Diesel = (decimal)0.0;
        private decimal Unleaded = (decimal)0.0;
        private decimal Premium = (decimal)0.0;
        private decimal Total = (decimal)0.0;
        protected void Page_Load(object sender, EventArgs e)
        {
            Label2.Visible = false;
            Label3.Visible = false;
            Label6.Visible = false;
            Label8.Visible = false;


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
            if (!IsPostBack)
            {
                string CS2 = ConfigurationManager.ConnectionStrings["connect"].ToString();
                using (SqlConnection con2 = new SqlConnection(CS2))
                {
                    SqlCommand cmd2 = new SqlCommand("Select ID,Region from Region", con2);
                    con2.Open();
                    ddlRegion.DataSource = cmd2.ExecuteReader();
                    ddlRegion.DataTextField = "Region";
                    ddlRegion.DataValueField = "ID";
                    ddlRegion.DataBind();

                }

                string CS3 = ConfigurationManager.ConnectionStrings["connect"].ToString();
                using (SqlConnection con3 = new SqlConnection(CS3))
                {
                    SqlCommand cmd3 = new SqlCommand("Select StationCode,StationName from Station", con3);
                    con3.Open();
                    ddlStation.DataSource = cmd3.ExecuteReader();
                    ddlStation.DataTextField = "StationName";
                    ddlStation.DataValueField = "StationCode";
                    ddlStation.DataBind();

                }

                string CS4 = ConfigurationManager.ConnectionStrings["connect"].ToString();
                using (SqlConnection con4 = new SqlConnection(CS4))
                {
                    SqlCommand cmd4 = new SqlCommand("Select ID,MonthName from MonthName", con4);
                    con4.Open();
                    ddlBegMth.DataSource = cmd4.ExecuteReader();
                    ddlBegMth.DataTextField = "MonthName";
                    ddlBegMth.DataValueField = "ID";
                    ddlBegMth.DataBind();

                }

                string CS5 = ConfigurationManager.ConnectionStrings["connect"].ToString();
                using (SqlConnection con5 = new SqlConnection(CS5))
                {
                    SqlCommand cmd5 = new SqlCommand("Select ID,MonthName from MonthName", con5);
                    con5.Open();
                    ddlEndMth.DataSource = cmd5.ExecuteReader();
                    ddlEndMth.DataTextField = "MonthName";
                    ddlEndMth.DataValueField = "ID";
                    ddlEndMth.DataBind();

                }
            }
        }

        protected void bntGenerate_Click(object sender, EventArgs e)
        {
            string fe = "";
            string Region = ddlRegion.SelectedItem.Text;
            string Station = ddlStation.SelectedItem.Text;
            string BegMth = Label6.Text.ToString();
            string EndMth = Label8.Text.ToString();

            if (Region != "--Select--" && Station!= "--Select--")
            {
                if (BegMth != "0" && EndMth != "0")
                {
                    fe = "Region= '" + Region + "' and StationName= '" + Station + "' and MonthNumber>='" + BegMth + "' and MonthNumber<='" + EndMth + "'";
                }

                else if (BegMth == "0" && EndMth != "0")
                {
                    fe = "Region= '" + Region + "' and StationName= '" + Station + "' and MonthNumber>=1 and MonthNumber<='" + EndMth + "'";
                }

                else if (BegMth != "0" && EndMth == "0")
                {
                    fe = "Region= '" + Region + "' and StationName= '" + Station + "' and MonthNumber>='" + BegMth + "' and MonthNumber<=12";
                }

                else if (BegMth == "0" && EndMth == "0")
                {
                    fe = "Region= '" + Region + "' and StationName= '" + Station + "'";
                }
            }

            else if (Region == "--Select--" && Station != "--Select--")
            {
                if (BegMth != "0" && EndMth != "0")
                {
                    fe = "StationName= '" + Station + "' and MonthNumber>='" + BegMth + "' and MonthNumber<='" + EndMth + "'";
                }

                else if (BegMth == "0" && EndMth != "0")
                {
                    fe = "StationName= '" + Station + "' and MonthNumber>=1 and MonthNumber<='" + EndMth + "'";
                }

                else if (BegMth != "0" && EndMth == "0")
                {
                    fe = "StationName= '" + Station + "' and MonthNumber>='" + BegMth + "' and MonthNumber<=12";
                }

                else if (BegMth == "0" && EndMth == "0")
                {
                    fe = "StationName= '" + Station + "'";
                }

            }

            else if (Region != "--Select--" && Station == "--Select--")
            {
                if (BegMth != "0" && EndMth != "0")
                {
                    fe = "Region= '" + Region + "' and MonthNumber>='" + BegMth + "' and MonthNumber<='" + EndMth + "'";
                }

                else if (BegMth == "0" && EndMth != "0")
                {
                    fe = "Region= '" + Region + "' and MonthNumber>=1 and MonthNumber<='" + EndMth + "'";
                }

                else if (BegMth != "0" && EndMth == "0")
                {
                    fe = "Region= '" + Region + "' and MonthNumber>='" + BegMth + "' and MonthNumber<=12";
                }

                else if (BegMth == "0" && EndMth == "0")
                {
                    fe = "Region= '" + Region + "' ";
                }
                
            }

            else if (Region == "--Select--" && Station == "--Select--")
            {
                if (BegMth != "0" && EndMth != "0")
                {
                    fe = "MonthNumber>='" + BegMth + "' and MonthNumber<='" + EndMth + "'";
                }

                else if (BegMth == "0" && EndMth != "0")
                {
                    fe = "MonthNumber>=1 and MonthNumber<='" + EndMth + "'";
                }

                else if (BegMth != "0" && EndMth == "0")
                {
                    fe = "MonthNumber>='" + BegMth + "' and MonthNumber<=12";
                }

                else if (BegMth == "0" && EndMth == "0")
                {
                    fe = "";
                }

            }
            

            SqlDataSource1.FilterExpression = fe;
            gvSales.DataBind();
        }

        protected void ontextchanged(object sender, EventArgs e)
        {
            Label2.Text = ddlRegion.Text;
            Label3.Text = ddlStation.Text;
            Label6.Text = ddlBegMth.Text;
            Label8.Text = ddlEndMth.Text;
        }

        

        protected void bntLogOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void gvSales_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
                e.Row.Cells[1].HorizontalAlign = HorizontalAlign.Center;

            //// check row type
            if (e.Row.RowType == DataControlRowType.DataRow)
                // if row type is DataRow, add TotalSales value to TotalSales
                Diesel += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Diesel"));
            else if (e.Row.RowType == DataControlRowType.Footer)
                // If row type is footer, show calculated total value
                e.Row.Cells[4].Text = String.Format("{0:N}", Diesel);

            if (e.Row.RowType == DataControlRowType.DataRow)
                e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Right;

            if (e.Row.RowType == DataControlRowType.Footer)
                e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Right;

            //// check row type
            if (e.Row.RowType == DataControlRowType.DataRow)
                // if row type is DataRow, add TotalSales value to TotalSales
                Unleaded += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Unleaded"));
            else if (e.Row.RowType == DataControlRowType.Footer)
                // If row type is footer, show calculated total value
                e.Row.Cells[5].Text = String.Format("{0:N}", Unleaded);

            if (e.Row.RowType == DataControlRowType.DataRow)
                e.Row.Cells[5].HorizontalAlign = HorizontalAlign.Right;

            if (e.Row.RowType == DataControlRowType.Footer)
                e.Row.Cells[5].HorizontalAlign = HorizontalAlign.Right;

            //// check row type
            if (e.Row.RowType == DataControlRowType.DataRow)
                // if row type is DataRow, add TotalSales value to TotalSales
                Premium += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Premium"));
            else if (e.Row.RowType == DataControlRowType.Footer)
                // If row type is footer, show calculated total value
                e.Row.Cells[6].Text = String.Format("{0:N}", Premium);

            if (e.Row.RowType == DataControlRowType.DataRow)
                e.Row.Cells[6].HorizontalAlign = HorizontalAlign.Right;

            if (e.Row.RowType == DataControlRowType.Footer)
                e.Row.Cells[6].HorizontalAlign = HorizontalAlign.Right;

            //// check row type
            if (e.Row.RowType == DataControlRowType.DataRow)
                // if row type is DataRow, add TotalSales value to TotalSales
                Total += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Total"));
            else if (e.Row.RowType == DataControlRowType.Footer)
                // If row type is footer, show calculated total value
                e.Row.Cells[7].Text = String.Format("{0:N}", Total);

            if (e.Row.RowType == DataControlRowType.DataRow)
                e.Row.Cells[7].HorizontalAlign = HorizontalAlign.Right;

            if (e.Row.RowType == DataControlRowType.Footer)
                e.Row.Cells[7].HorizontalAlign = HorizontalAlign.Right;
        }

        protected void btnCuInv_Click(object sender, EventArgs e)
        {
            Response.Redirect("CurrentInv.aspx");
        }

        protected void bntInvRecon_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewInv.aspx");
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("Order.aspx");
        }

        protected void btnATG_Click(object sender, EventArgs e)
        {
            Response.Redirect("ATG.aspx");
        }
    }
}