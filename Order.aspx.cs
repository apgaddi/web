using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace WebApp
{
    public partial class Order : System.Web.UI.Page
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

        protected void bntInvRecon_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewInv.aspx");
        }

        protected void bntLogOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

       
        protected void gvOrder_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            ////try to insert value
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TableCell daynew = e.Row.Cells[2];
                double nodays = Convert.ToDouble(daynew.Text);

                TableCell date2 = e.Row.Cells[1];
                DateTime dateUpdate = Convert.ToDateTime(date2.Text);
                DateTime delivery = dateUpdate.AddDays(nodays);

                string del = delivery.ToString("f");

                Label lblDoA = (Label)e.Row.FindControl("DoA");

                lblDoA.Text = del;
            }

            ///alignment
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[1].HorizontalAlign = HorizontalAlign.Right;
                e.Row.Cells[2].HorizontalAlign = HorizontalAlign.Center;
                e.Row.Cells[3].HorizontalAlign = HorizontalAlign.Right;
                e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Right;
                e.Row.Cells[5].HorizontalAlign = HorizontalAlign.Right;
                e.Row.Cells[6].HorizontalAlign = HorizontalAlign.Right;
                e.Row.Cells[7].HorizontalAlign = HorizontalAlign.Right;
                e.Row.Cells[8].HorizontalAlign = HorizontalAlign.Right;
                e.Row.Cells[9].HorizontalAlign = HorizontalAlign.Right;
                e.Row.Cells[10].HorizontalAlign = HorizontalAlign.Right;
                e.Row.Cells[11].HorizontalAlign = HorizontalAlign.Right;
                e.Row.Cells[12].HorizontalAlign = HorizontalAlign.Right;

            }

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //// change color of DateUpdated 
                DateTime thisday = DateTime.Now;
                TimeSpan time = new TimeSpan(0, 15, 0, 0);
                DateTime combined = thisday.Add(time);
                string thisdaytxt = combined.ToString("d");

                TableCell date1 = e.Row.Cells[1];
                DateTime dateUpdate = Convert.ToDateTime(date1.Text);
                string dateUpdated1 = dateUpdate.ToString("d");
                if (thisdaytxt != dateUpdated1)
                {
                    date1.BackColor = Color.Red;
                    date1.ForeColor = Color.White;
                }
            }

            ///Proposed order Diesel 1
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TableCell d1PO = e.Row.Cells[13];
                double d1PO1=Convert.ToDouble(d1PO.Text);

                TableCell d1Cap = e.Row.Cells[14];
                double d1C = Convert.ToDouble(d1Cap.Text);


                if (d1PO1>d1C)
                {
                    if(d1C<=24000 && d1C>22000)
                    {
                   
                        Label lblDoA = (Label)e.Row.FindControl("POD1");

                        lblDoA.Text = "22,000";
                    }

                    if (d1C <= 22000 && d1C > 20000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POD1");

                        lblDoA.Text = "20,000";
                    }

                    if (d1C <= 20000 && d1C > 18000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POD1");

                        lblDoA.Text = "18,000";
                    }

                    if (d1C <= 18000 && d1C > 16000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POD1");

                        lblDoA.Text = "16,000";
                    }

                    if (d1C <= 16000 && d1C > 14000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POD1");

                        lblDoA.Text = "14,000";
                    }

                    if (d1C <= 12000 && d1C > 10000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POD1");

                        lblDoA.Text = "12,000";
                    }

                    if (d1C <= 10000 && d1C > 8000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POD1");

                        lblDoA.Text = "10,000";
                    }

                    if (d1C <= 8000 && d1C > 6000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POD1");

                        lblDoA.Text = "6,000";
                    }

                }

                if (d1PO1 <= d1C)
                {
                    if (d1PO1 < 24000 && d1PO1 >= 22000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POD1");

                        lblDoA.Text = "22,000";
                    }

                    if (d1PO1 < 22000 && d1PO1 >= 20000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POD1");

                        lblDoA.Text = "20,000";
                    }

                    if (d1PO1 < 20000 && d1PO1 >= 18000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POD1");

                        lblDoA.Text = "18,000";
                    }

                    if (d1PO1 < 18000 && d1PO1 >= 16000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POD1");

                        lblDoA.Text = "16,000";
                    }

                    if (d1PO1 < 16000 && d1PO1 >= 14000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POD1");

                        lblDoA.Text = "14,000";
                    }

                    if (d1PO1 < 14000 && d1PO1 >= 12000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POD1");

                        lblDoA.Text = "12,000";
                    }

                    if (d1PO1 < 12000 && d1PO1 >= 10000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POD1");

                        lblDoA.Text = "10,000";
                    }

                    if (d1PO1 < 10000 && d1PO1 >= 8000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POD1");

                        lblDoA.Text = "8,000";
                    }

                    if (d1PO1 < 8000 && d1PO1 >= 6000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POD1");

                        lblDoA.Text = "6,000";
                    }

                    if (d1PO1 < 6000 && d1PO1 >= 4000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POD1");

                        lblDoA.Text = "4,000";
                    }

                    if (d1PO1 < 4000 && d1PO1 >= 2000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POD1");

                        lblDoA.Text = "2,000";
                    }

                    if (d1PO1 < 2000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POD1");

                        lblDoA.Text = "0";
                    }
                }
            }

            ///Proposed order Unleaded 1
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TableCell d1PO = e.Row.Cells[15];
                double d1PO1 = Convert.ToDouble(d1PO.Text);

                TableCell d1Cap = e.Row.Cells[16];
                double d1C = Convert.ToDouble(d1Cap.Text);


                if (d1PO1 > d1C)
                {
                    if (d1C <= 24000 && d1C > 22000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POR1");

                        lblDoA.Text = "22,000";
                    }

                    if (d1C <= 22000 && d1C > 20000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POR1");

                        lblDoA.Text = "20,000";
                    }

                    if (d1C <= 20000 && d1C > 18000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POR1");

                        lblDoA.Text = "18,000";
                    }

                    if (d1C <= 18000 && d1C > 16000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POR1");

                        lblDoA.Text = "16,000";
                    }

                    if (d1C <= 16000 && d1C > 14000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POR1");

                        lblDoA.Text = "14,000";
                    }

                    if (d1C <= 12000 && d1C > 10000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POR1");

                        lblDoA.Text = "12,000";
                    }

                    if (d1C <= 10000 && d1C > 8000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POR1");

                        lblDoA.Text = "10,000";
                    }

                    if (d1C <= 8000 && d1C > 6000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POR1");

                        lblDoA.Text = "6,000";
                    }

                }

                if (d1PO1 <= d1C)
                {
                    if (d1PO1 < 24000 && d1PO1 >= 22000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POR1");

                        lblDoA.Text = "22,000";
                    }

                    if (d1PO1 < 22000 && d1PO1 >= 20000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POR1");

                        lblDoA.Text = "20,000";
                    }

                    if (d1PO1 < 20000 && d1PO1 >= 18000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POR1");

                        lblDoA.Text = "18,000";
                    }

                    if (d1PO1 < 18000 && d1PO1 >= 16000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POR1");

                        lblDoA.Text = "16,000";
                    }

                    if (d1PO1 < 16000 && d1PO1 >= 14000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POR1");

                        lblDoA.Text = "14,000";
                    }

                    if (d1PO1 < 14000 && d1PO1 >= 12000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POR1");

                        lblDoA.Text = "12,000";
                    }

                    if (d1PO1 < 12000 && d1PO1 >= 10000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POR1");

                        lblDoA.Text = "10,000";
                    }

                    if (d1PO1 < 10000 && d1PO1 >= 8000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POR1");

                        lblDoA.Text = "8,000";
                    }

                    if (d1PO1 < 8000 && d1PO1 >= 6000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POR1");

                        lblDoA.Text = "6,000";
                    }

                    if (d1PO1 < 6000 && d1PO1 >= 4000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POR1");

                        lblDoA.Text = "4,000";
                    }

                    if (d1PO1 < 4000 && d1PO1 >= 2000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POR1");

                        lblDoA.Text = "2,000";
                    }

                    if (d1PO1 < 2000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POR1");

                        lblDoA.Text = "0";
                    }
                }
            }

            ///Proposed order Premium 1
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TableCell d1PO = e.Row.Cells[17];
                double d1PO1 = Convert.ToDouble(d1PO.Text);

                TableCell d1Cap = e.Row.Cells[18];
                double d1C = Convert.ToDouble(d1Cap.Text);


                if (d1PO1 > d1C)
                {
                    if (d1C <= 24000 && d1C > 22000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POP1");

                        lblDoA.Text = "22,000";
                    }

                    if (d1C <= 22000 && d1C > 20000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POP1");

                        lblDoA.Text = "20,000";
                    }

                    if (d1C <= 20000 && d1C > 18000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POP1");

                        lblDoA.Text = "18,000";
                    }

                    if (d1C <= 18000 && d1C > 16000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POP1");

                        lblDoA.Text = "16,000";
                    }

                    if (d1C <= 16000 && d1C > 14000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POP1");

                        lblDoA.Text = "14,000";
                    }

                    if (d1C <= 12000 && d1C > 10000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POP1");

                        lblDoA.Text = "12,000";
                    }

                    if (d1C <= 10000 && d1C > 8000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POP1");

                        lblDoA.Text = "10,000";
                    }

                    if (d1C <= 8000 && d1C > 6000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POP1");

                        lblDoA.Text = "6,000";
                    }

                }

                if (d1PO1 <= d1C)
                {
                    if (d1PO1 < 24000 && d1PO1 >= 22000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POP1");

                        lblDoA.Text = "22,000";
                    }

                    if (d1PO1 < 22000 && d1PO1 >= 20000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POP1");

                        lblDoA.Text = "20,000";
                    }

                    if (d1PO1 < 20000 && d1PO1 >= 18000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POP1");

                        lblDoA.Text = "18,000";
                    }

                    if (d1PO1 < 18000 && d1PO1 >= 16000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POP1");

                        lblDoA.Text = "16,000";
                    }

                    if (d1PO1 < 16000 && d1PO1 >= 14000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POP1");

                        lblDoA.Text = "14,000";
                    }

                    if (d1PO1 < 14000 && d1PO1 >= 12000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POP1");

                        lblDoA.Text = "12,000";
                    }

                    if (d1PO1 < 12000 && d1PO1 >= 10000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POP1");

                        lblDoA.Text = "10,000";
                    }

                    if (d1PO1 < 10000 && d1PO1 >= 8000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POP1");

                        lblDoA.Text = "8,000";
                    }

                    if (d1PO1 < 8000 && d1PO1 >= 6000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POP1");

                        lblDoA.Text = "6,000";
                    }

                    if (d1PO1 < 6000 && d1PO1 >= 4000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POP1");

                        lblDoA.Text = "4,000";
                    }

                    if (d1PO1 < 4000 && d1PO1 >= 2000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POP1");

                        lblDoA.Text = "2,000";
                    }

                    if (d1PO1 < 2000)
                    {

                        Label lblDoA = (Label)e.Row.FindControl("POP1");

                        lblDoA.Text = "0";
                    }
                }
            }
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