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
    public partial class CurrentInv : System.Web.UI.Page
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
            

        protected void bntLogOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void bntInvRecon_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewInv.aspx");
        }

        protected void bntGenerate_Click(object sender, EventArgs e)
        {
            string fe = "";

            SqlDataSource1.FilterExpression = fe;
            gvInv.DataBind();
        }

        protected void gvInv_OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                //Determine the RowIndex of the Row whose Button was clicked.
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                //Reference the GridView Row.
                GridViewRow row = gvInv.Rows[rowIndex];


                //Fetch value of Country
                string Station  = row.Cells[0].Text;
                
                Session["station"] = Station;
                Response.Redirect("Tank.aspx");
            }
        }

        protected void gvInv_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            
            
            ///align number to right
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[1].HorizontalAlign = HorizontalAlign.Right;
                e.Row.Cells[2].HorizontalAlign = HorizontalAlign.Right;
                e.Row.Cells[3].HorizontalAlign = HorizontalAlign.Right;
                e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Right;
                e.Row.Cells[5].HorizontalAlign = HorizontalAlign.Right;
                e.Row.Cells[6].HorizontalAlign = HorizontalAlign.Right;
                e.Row.Cells[8].HorizontalAlign = HorizontalAlign.Right;
                e.Row.Cells[9].HorizontalAlign = HorizontalAlign.Right;
                e.Row.Cells[10].HorizontalAlign = HorizontalAlign.Right;
            }


            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //// change color of DateUpdated 
                DateTime thisday = DateTime.Now;
                TimeSpan time = new TimeSpan(0, 15, 0, 0);
                DateTime combined = thisday.Add(time);
                string thisdaytxt = combined.ToString("d");

                TableCell date1 = e.Row.Cells[7];
                DateTime dateUpdate = Convert.ToDateTime(date1.Text);
                string dateUpdated1 = dateUpdate.ToString("d");
                if (thisdaytxt!= dateUpdated1)
                {
                    date1.BackColor = Color.Red;
                    date1.ForeColor = Color.White;
                }




                ////GET THE VALUE OF AVERAGE SALES OF DIESEL 1
                TableCell cellA = e.Row.Cells[8];
                float D1AS = float.Parse(cellA.Text);

                TableCell cellA1 = e.Row.Cells[11];
                float M = float.Parse(cellA1.Text);

                
                ///change backcolor and forecolor of D1
                TableCell cell1 = e.Row.Cells[1];
                float quantity1 = float.Parse(cell1.Text);
                if (quantity1 > 0 && quantity1 <= D1AS*M)
                {
                    cell1.BackColor = Color.Red;
                    cell1.ForeColor = Color.White;
                }
                if (quantity1 > D1AS * M && quantity1 <= D1AS * M*2)
                {
                    cell1.BackColor = Color.Orange;
                    cell1.ForeColor = Color.White;
                }
                if (quantity1 > D1AS * M*2)
                {
                    cell1.BackColor = Color.Green;
                    cell1.ForeColor = Color.White;
                }

                ////GET THE VALUE OF AVERAGE SALES OF UNLEADED 1
                TableCell cellB = e.Row.Cells[9];
                float U1AS = float.Parse(cellB.Text);

                ///change backcolor and forecolor of U1
                TableCell cell3 = e.Row.Cells[3];
                float quantity3 = float.Parse(cell3.Text);
                if (quantity3 > 0 && quantity3 <= U1AS*M)
                {
                    cell3.BackColor = Color.Red;
                    cell3.ForeColor = Color.White;
                }
                if (quantity3 > U1AS*M && quantity3 <= U1AS*2*M)
                {
                    cell3.BackColor = Color.Orange;
                    cell3.ForeColor = Color.White;
                }
                if (quantity3 > U1AS*2*M)
                {
                    cell3.BackColor = Color.Green;
                    cell3.ForeColor = Color.White;
                }

                ////GET THE VALUE OF AVERAGE SALES OF PREMIUM 1
                TableCell cellC = e.Row.Cells[10];
                float P1AS = float.Parse(cellC.Text);

                ///change backcolor and forecolor of P1
                TableCell cell5 = e.Row.Cells[5];
                float quantity5 = float.Parse(cell5.Text);
                if (quantity5 > 0 && quantity5 <= P1AS*M)
                {
                    cell5.BackColor = Color.Red;
                    cell5.ForeColor = Color.White;
                }
                if (quantity5 > P1AS*M && quantity5 <= P1AS*2*M)
                {
                    cell5.BackColor = Color.Orange;
                    cell5.ForeColor = Color.White;
                }
                if (quantity5 > P1AS*2*M)
                {
                    cell5.BackColor = Color.Green;
                    cell5.ForeColor = Color.White;
                }
            }
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("Order.aspx");
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