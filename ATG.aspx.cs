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
    public partial class ATG : System.Web.UI.Page
    {
        private decimal BegATG = (decimal)0.0;
        private decimal EndATG = (decimal)0.0;
        private decimal PumpSales = (decimal)0.0;
        private decimal DeliveryReceived = (decimal)0.0;
        private decimal EncodedDelivery = (decimal)0.0;
        private decimal Var = (decimal)0.0;

        protected void Page_Load(object sender, EventArgs e)
        {
           
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
            string Station = ddlStation.SelectedItem.Text;

            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = ""+ Station + " ATG Delivery.xls";
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
            //Label2.Text = ddlInv.Text;
        }

        protected void bntGenerate_Click(object sender, EventArgs e)
        {
            string fe = "";
            string Region = ddlRegion.SelectedItem.Text;
            string Station = ddlStation.SelectedItem.Text;
          
            string SDate = txtSDateFuelInv.Text.ToString();
            string MDate = txtEDateFuelInv.Text.ToString();

            DateTime MDateDt = Convert.ToDateTime(MDate);
            DateTime EdateDt = MDateDt.AddDays(1);
            string EDate = Convert.ToString(EdateDt);

            if (Region == "--Select--" && Station == "--Select--")
            {
                fe = "[Date]>= '" + SDate + "' and [Date]<'" + EDate + "' and [EncodedDelivery]<>0 ";
            }

            if (Region != "--Select--" && Station == "--Select--")
            {
                fe = "Region= '" + Region + "' and [Date]>= '" + SDate + "' and [Date]<'" + EDate + "' and [EncodedDelivery]<>0";
            }

            if (Region == "--Select--" && Station != "--Select--")
            {
                fe = "StationName= '" + Station + "' and [Date]>= '" + SDate + "' and [Date]<'" + EDate + "' and [EncodedDelivery]<>0";
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
                e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Center;
               
            }
            //// check row type
            if (e.Row.RowType == DataControlRowType.DataRow)
                // if row type is DataRow, add TotalSales value to TotalSales
                BegATG += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "BegATG"));
            else if (e.Row.RowType == DataControlRowType.Footer)
                // If row type is footer, show calculated total value
                e.Row.Cells[5].Text = String.Format("{0:N}", BegATG);
                e.Row.Cells[5].HorizontalAlign = HorizontalAlign.Right;

            //// check row type
            if (e.Row.RowType == DataControlRowType.DataRow)
                // if row type is DataRow, add TotalSales value to TotalSales
                EndATG += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "EndATG"));
            else if (e.Row.RowType == DataControlRowType.Footer)
                // If row type is footer, show calculated total value
                e.Row.Cells[6].Text = String.Format("{0:N}", EndATG);
                e.Row.Cells[6].HorizontalAlign = HorizontalAlign.Right;

            //// check row type
            if (e.Row.RowType == DataControlRowType.DataRow)
                // if row type is DataRow, add TotalSales value to TotalSales
                PumpSales += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "PumpSales"));
            else if (e.Row.RowType == DataControlRowType.Footer)
                // If row type is footer, show calculated total value
                e.Row.Cells[7].Text = String.Format("{0:N}", PumpSales);
                e.Row.Cells[7].HorizontalAlign = HorizontalAlign.Right;

            //// check row type
            if (e.Row.RowType == DataControlRowType.DataRow)
                // if row type is DataRow, add TotalSales value to TotalSales
                DeliveryReceived += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "DeliveryReceived"));
            else if (e.Row.RowType == DataControlRowType.Footer)
                // If row type is footer, show calculated total value
                e.Row.Cells[8].Text = String.Format("{0:N}", DeliveryReceived);
                e.Row.Cells[8].HorizontalAlign = HorizontalAlign.Right;

            //// check row type
            if (e.Row.RowType == DataControlRowType.DataRow)
                // if row type is DataRow, add TotalSales value to TotalSales
                EncodedDelivery += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "EncodedDelivery"));
            else if (e.Row.RowType == DataControlRowType.Footer)
                // If row type is footer, show calculated total value
                e.Row.Cells[9].Text = String.Format("{0:N}", EncodedDelivery);
                e.Row.Cells[9].HorizontalAlign = HorizontalAlign.Right;

            //// check row type
            if (e.Row.RowType == DataControlRowType.DataRow)
                // if row type is DataRow, add TotalSales value to TotalSales
                Var += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Var"));
            else if (e.Row.RowType == DataControlRowType.Footer)
                // If row type is footer, show calculated total value
                e.Row.Cells[10].Text = String.Format("{0:N}", Var);
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

        protected void bntInvRecon_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewInv.aspx");
        }
    }
}