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
    public partial class Sales : System.Web.UI.Page
    {
        private decimal Cash = (decimal)0.0;
        private decimal PO = (decimal)0.0;
        private decimal NonCash = (decimal)0.0;
        private decimal Total = (decimal)0.0;
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

        protected void bntGenerate_Click(object sender, EventArgs e)
        {
            string fe = "";
           
            string SDate = txtSDateFuelInv.Text.ToString();
            string MDate = txtEDateFuelInv.Text.ToString();

            DateTime MDateDt = Convert.ToDateTime(MDate);
            DateTime EdateDt = MDateDt.AddDays(1);
            string EDate = Convert.ToString(EdateDt);

            fe = "[Date]>= '" + SDate + "' and [Date]<'" + EDate + "' ";

            SqlDataSource1.FilterExpression = fe;
            gvSales.DataBind();
        }

        protected void bntMain_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewHome.aspx");
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
                Cash += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Cash"));
            else if (e.Row.RowType == DataControlRowType.Footer)
                // If row type is footer, show calculated total value
                e.Row.Cells[2].Text = String.Format("{0:N}", Cash);

            if (e.Row.RowType == DataControlRowType.DataRow)
                e.Row.Cells[2].HorizontalAlign = HorizontalAlign.Right;

            if (e.Row.RowType == DataControlRowType.Footer)
                e.Row.Cells[2].HorizontalAlign = HorizontalAlign.Right;

            //// check row type
            if (e.Row.RowType == DataControlRowType.DataRow)
                // if row type is DataRow, add TotalSales value to TotalSales
                PO += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "PO"));
            else if (e.Row.RowType == DataControlRowType.Footer)
                // If row type is footer, show calculated total value
                e.Row.Cells[3].Text = String.Format("{0:N}", PO);

            if (e.Row.RowType == DataControlRowType.DataRow)
                e.Row.Cells[3].HorizontalAlign = HorizontalAlign.Right;

            if (e.Row.RowType == DataControlRowType.Footer)
                e.Row.Cells[3].HorizontalAlign = HorizontalAlign.Right;

            //// check row type
            if (e.Row.RowType == DataControlRowType.DataRow)
                // if row type is DataRow, add TotalSales value to TotalSales
                NonCash += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "NonCash"));
            else if (e.Row.RowType == DataControlRowType.Footer)
                // If row type is footer, show calculated total value
                e.Row.Cells[4].Text = String.Format("{0:N}", NonCash);

            if (e.Row.RowType == DataControlRowType.DataRow)
                e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Right;

            if (e.Row.RowType == DataControlRowType.Footer)
                e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Right;

            //// check row type
            if (e.Row.RowType == DataControlRowType.DataRow)
                // if row type is DataRow, add TotalSales value to TotalSales
                Total += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Total"));
            else if (e.Row.RowType == DataControlRowType.Footer)
                // If row type is footer, show calculated total value
                e.Row.Cells[5].Text = String.Format("{0:N}", Total);

            if (e.Row.RowType == DataControlRowType.DataRow)
                e.Row.Cells[5].HorizontalAlign = HorizontalAlign.Right;

            if (e.Row.RowType == DataControlRowType.Footer)
                e.Row.Cells[5].HorizontalAlign = HorizontalAlign.Right;
        }

    }
}