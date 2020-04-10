using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
namespace AspBusProject
{
    public class CancelB
    {
        

        public static bool CancelBooking(string bookingid)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("cancelbooking", con); //creates command for executing "cancelbooking" procedure.
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@bookingid", bookingid);
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                HttpContext.Current.Trace.Write("Error in CacelBooking -->" + ex.Message);
                return false;
            }
            finally
            {
                con.Close();
            }
        }
    }
    public partial class cancelbooking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Panel1.Enabled = false;
        }
        protected void btnCancelBooking_Click(object sender, EventArgs e)
        {
            bool done = CancelB.CancelBooking(txtBookingid.Text);
            if (done)
                lblMsg.Text = "Booking with booking id [" + txtBookingid.Text + "] has been cancelled successfully!";
            else
                lblMsg.Text = "Sorry! Could NOT cancel booking with booking id [" + txtBookingid.Text + "]!";
            Panel1.Enabled = true;
        }
    }
}