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
    public partial class NewInv : System.Web.UI.Page
    {
        private decimal UGTDisp = (decimal)0.0;
        private decimal POSVolume = (decimal)0.0;
        private decimal VolVar = (decimal)0.0;
        private decimal AlVar = (decimal)0.0;

        protected void Page_Load(object sender, EventArgs e)
        {
            Label2.Visible = false;
            Label3.Visible = false;
            Label5.Visible = false;

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
                    SqlCommand cmd2 = new SqlCommand("Select ID,ItemName from Item", con2);
                    con2.Open();
                    ddlInv.DataSource = cmd2.ExecuteReader();
                    ddlInv.DataTextField = "ItemName";
                    ddlInv.DataValueField = "ID";
                    ddlInv.DataBind();
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
                    SqlCommand cmd4 = new SqlCommand("Select ID,Region from Region", con4);
                    con4.Open();
                    ddlRegion.DataSource = cmd4.ExecuteReader();
                    ddlRegion.DataTextField = "Region";
                    ddlRegion.DataValueField = "ID";
                    ddlRegion.DataBind();
                }
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the run time error "  
            //Control 'GridView1' of type 'Grid View' must be placed inside a form tag with runat=server."  
        }

        private void ExportGridToExcel()
        {
            string Product = ddlInv.SelectedItem.Text;

            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "Laguidingan "+ Product + " Inventory Reconciliation.xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            gvInvRecon.GridLines = GridLines.Both;
            gvInvRecon.HeaderStyle.Font.Bold = true;
            gvInvRecon.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();

        }

        protected void ontextchanged(object sender, EventArgs e)
        {
            Label2.Text = ddlInv.Text;
        }

        protected void bntGenerate_Click(object sender, EventArgs e)
        {
            string fe = "";
            string Region = ddlRegion.SelectedItem.Text;
            string Station = ddlStation.SelectedItem.Text;
            string Item = Label2.Text.ToString();
            string SDate = txtSDateFuelInv.Text.ToString();
            string MDate = txtEDateFuelInv.Text.ToString();

            DateTime MDateDt = Convert.ToDateTime(MDate);
            DateTime EdateDt = MDateDt.AddDays(1);
            string EDate = Convert.ToString(EdateDt);

            if (Region == "--Select--" && Station == "--Select--")
            {
                fe = "[ItemID]='" + Item + "' and [Date]>= '" + SDate + "' and [Date]<'" + EDate + "' ";
            }

            if (Region != "--Select--" && Station == "--Select--")
            {
                fe = "Region= '" + Region + "' and [ItemID]='" + Item + "' and [Date]>= '" + SDate + "' and [Date]<'" + EDate + "' ";
            }

            if (Region == "--Select--" && Station != "--Select--")
            {
                fe = "StationName= '" + Station + "' and [ItemID]='" + Item + "' and [Date]>= '" + SDate + "' and [Date]<'" + EDate + "' ";
            }


            SqlDataSource1.FilterExpression = fe;
            gvInvRecon.DataBind();
        }

        protected void gvInvRecon_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            ///alignment
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[3].HorizontalAlign = HorizontalAlign.Center;
                e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Right;
                e.Row.Cells[5].HorizontalAlign = HorizontalAlign.Right;
                e.Row.Cells[6].HorizontalAlign = HorizontalAlign.Right;
                e.Row.Cells[7].HorizontalAlign = HorizontalAlign.Right;
                e.Row.Cells[8].HorizontalAlign = HorizontalAlign.Right;
                e.Row.Cells[9].HorizontalAlign = HorizontalAlign.Right;
                e.Row.Cells[10].HorizontalAlign = HorizontalAlign.Right;
               
            }
            //// check row type
            if (e.Row.RowType == DataControlRowType.DataRow)
                // if row type is DataRow, add TotalSales value to TotalSales
                UGTDisp += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "UGTDisp"));
            else if (e.Row.RowType == DataControlRowType.Footer)
                // If row type is footer, show calculated total value
                e.Row.Cells[7].Text = String.Format("{0:N}", UGTDisp);
                e.Row.Cells[7].HorizontalAlign = HorizontalAlign.Right;

            //// check row type
            if (e.Row.RowType == DataControlRowType.DataRow)
                // if row type is DataRow, add TotalSales value to TotalSales
                POSVolume += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "POSVolume"));
            else if (e.Row.RowType == DataControlRowType.Footer)
                // If row type is footer, show calculated total value
                e.Row.Cells[8].Text = String.Format("{0:N}", POSVolume);
                e.Row.Cells[8].HorizontalAlign = HorizontalAlign.Right;

            //// check row type
            if (e.Row.RowType == DataControlRowType.DataRow)
                // if row type is DataRow, add TotalSales value to TotalSales
                VolVar += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "VolVar"));
            else if (e.Row.RowType == DataControlRowType.Footer)
                // If row type is footer, show calculated total value
                e.Row.Cells[9].Text = String.Format("{0:N}", VolVar);
                e.Row.Cells[9].HorizontalAlign = HorizontalAlign.Right;

            //// check row type
            if (e.Row.RowType == DataControlRowType.DataRow)
                // if row type is DataRow, add TotalSales value to TotalSales
                AlVar += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "AllVolVar"));
            else if (e.Row.RowType == DataControlRowType.Footer)
                // If row type is footer, show calculated total value
                e.Row.Cells[10].Text = String.Format("-{0:N}", AlVar);
                e.Row.Cells[10].HorizontalAlign = HorizontalAlign.Right;
        }

        protected void btnInvRecon_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewInv.aspx");
        }

        protected void bntLogOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void btnExcel_Click(object sender, EventArgs e)
        {
            ExportGridToExcel();
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("Order.aspx");
        }

        protected void btnSales_Click(object sender, EventArgs e)
        {
            Response.Redirect("MonthlySales.aspx");
        }

        protected void btnCuInv_Click(object sender, EventArgs e)
        {
            Response.Redirect("CurrentInv.aspx");
        }

        protected void btnATG_Click(object sender, EventArgs e)
        {
            Response.Redirect("ATG.aspx");
        }
    }
}