using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
namespace AspBusProject
{
    public class Booking
    {
        public static bool BookTicket(string serviceid, string jdate, string passenger, string gender,
             string age, string phone, out string bookingid, out string seatno)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString); //Creates a connection with dataabse using a connection string.
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("bookseat", con); // creates an SQL command which makes use of stored procedure "bookseat".
                cmd.CommandType = CommandType.StoredProcedure; //specifies type of command
                cmd.Parameters.AddWithValue("@serviceid", serviceid); //assigns value for various parameters required to execute the commands written in "bookseat" procedure.
                cmd.Parameters.AddWithValue("@jdate", jdate);
                cmd.Parameters.AddWithValue("@passenger", passenger);
                cmd.Parameters.AddWithValue("@gender", gender);
                cmd.Parameters.AddWithValue("@age", age);
                cmd.Parameters.AddWithValue("@phoneno", phone);

                SqlParameter p_bookingid = new SqlParameter //creates SQL parameter with datatype Int and classname bookingid.
                    ("@bookingid", SqlDbType.Int);
                p_bookingid.Direction = ParameterDirection.Output;//defines that it is used as Output variable.

                SqlParameter p_seatno = new SqlParameter
                    ("@seatno", SqlDbType.Int);
                p_seatno.Direction = ParameterDirection.Output;

                cmd.Parameters.Add(p_bookingid); //adds empty varables to the command which will store output from the command.
                cmd.Parameters.Add(p_seatno);

                cmd.ExecuteNonQuery(); //executes the command.

                seatno = p_seatno.Value.ToString();
                bookingid = p_bookingid.Value.ToString();

                return true;
            }
            catch (Exception ex)
            {
                HttpContext.Current.Trace.Write("Error in BookSeat -->" + ex.Message);
                seatno = bookingid = "0"; // indicates error 
                return false;
            }
            finally
            {
                con.Close();
            }
        }
    }

    public partial class bookseat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnBook_Click(object sender, EventArgs e)
        {
            // get required information and pass it to BLL
            string bookingid, seatno;

            bool done = Booking.BookTicket(Request.QueryString["serviceid"],
                                    Request.QueryString["jdate"],
                                    txtPassengerName.Text,
                                    rbMale.Checked ? "m" : "f",
                                    txtAge.Text,
                                    txtPhone.Text,
                                    out bookingid,
                                    out seatno);

            if (done)
            {
                lblBookingId.Text = bookingid;
                lblSeatno.Text = seatno;
                panelInfo.Visible = true;
            }
            else
            {
                panelInfo.Visible = false;
                lblMsg.Text = "Sorry! Could not process your booking. Please try again!";
            }


        }

        protected void txtPhone_TextChanged(object sender, EventArgs e)
        {

        }
    }
}