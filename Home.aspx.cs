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
    public partial class Design1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        //protected void btnCrew_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("CrewAttendance.aspx");
        //}

        //protected void btnLogOut_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("Login.aspx");
        //}

        //protected void btnFuelInv_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("FuelInv.aspx");
        //}

        //protected void btnLubesInv_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("LubesInv.aspx");
        //}

        //protected void btnVoid_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("Void.aspx");
        //}

        //protected void btnSalesFuel_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("SalesFuel.aspx");
        //}

        //protected void btnSalesLubes_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("SalesLubes.aspx");
        //}

        //protected void btnPumpPrice_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("FuelPriceHistory.aspx");
        //}

        //protected void btnSalesJournal_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("SalesJournal.aspx");
        //}

        //protected void btnPayout_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("Payout.aspx");
        //}

        //protected void btnLubesPromo_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("LubesPromo.aspx");
        //}

        //protected void btnCashOver_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("Cash_Over.aspx");
        //}

        //protected void btnCashOnHand_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("CashOnHand.aspx");
        //}

        //protected void btnPaymentMethod_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("PaymentMethod.aspx");
        //}

        //protected void btnDriveOff_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("DriveOff.aspx");
        //}

        //protected void btnMisload_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("Misload.aspx");
        //}

        //protected void btnGifted_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("Gifted.aspx");
        //}

        //protected void btnGiftCard_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("GiftCard.aspx");
        //}

        //protected void btnUnclaimedGiftCard_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("UnclaimedGiftCard.aspx");
        //}

        //protected void btnUnclaimedGifted_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("UnclaimedGifted.aspx");
        //}

        //protected void btnTotalizer_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("Totalizer.aspx");
        //}

        //protected void btnPurchases_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("Purchases.aspx");
        //}

        //protected void btnPayment_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("Payment.aspx");
        //}

        //protected void btnFuelPromo_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("FuelPromo.aspx");
        //}

        protected void btnShift_Click(object sender, EventArgs e)
        {
            Response.Redirect("InvRecon.aspx");
        }
    }
}