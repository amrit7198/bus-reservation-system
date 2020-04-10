using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
namespace AspBusProject
{
    public class Feedback
    {
        public static Boolean AddFeedback(string serviceid,
            string jdate, string seatno, string feedback)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString); //Creates a connection with dataabse using a connection string.
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("addfeedback", con); // creates an SQL command which makes use of stored procedure "addfeedback".
                cmd.CommandType = CommandType.StoredProcedure; //specifies type of command.
                cmd.Parameters.AddWithValue("@serviceid", serviceid); //assigns value for various parameters required to execute the commands written in "bookseat" procedure.
                cmd.Parameters.AddWithValue("@jdate", jdate);
                cmd.Parameters.AddWithValue("@seatno", seatno);
                cmd.Parameters.AddWithValue("@feedback", feedback);
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                HttpContext.Current.Trace.Write(
                    "Error in AddFeedback -->" + ex.Message);
                return false;
            }
            finally
            {
                con.Close();
            }
        }
    }
    public partial class feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Boolean done = Feedback.AddFeedback(txtServiceId.Text,
                txtJdate.Text, txtSeatno.Text, txtFeedback.Text);
            if (done)
                lblMsg.Text = "Thank you for your feedback.";
            else
                lblMsg.Text = "Sorry! Could not process your feedback!";

        }
    }
}
