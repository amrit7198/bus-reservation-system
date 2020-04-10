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
    public class Services
    {
        public static DataTable SearchBuses(string fromcity, string tocity, string jdate, string bustype)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString); //Creates a connection with dataabse using a connection string.
            try
            {
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter("searchbuses", con); //creates an object to execute "searchbuses" stored procedure. 
                sda.SelectCommand.Parameters.AddWithValue("@fromcity", fromcity); //assigns value for various parameters required to execute the commands written in "bookseat" procedure.
                sda.SelectCommand.Parameters.AddWithValue("@tocity", tocity);
                sda.SelectCommand.Parameters.AddWithValue("@jdate", jdate);
                sda.SelectCommand.Parameters.AddWithValue("@bustype", bustype);
                sda.SelectCommand.CommandType = CommandType.StoredProcedure; //specifies type of command.
                DataSet ds = new DataSet(); //this object will store the data provided by sda.
                sda.Fill(ds, "buses"); //adding data of "buses" table inot ds.
                return ds.Tables[0]; //returning table data.
            }
            catch (Exception ex)
            {
                HttpContext.Current.Trace.Write(
                    "Error in SearchBuses -->" + ex.Message);
                return null;
            }
            finally
            {
                con.Close();
            }
        }
    }
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                txtJdate.Text = DateTime.Today.ToShortDateString(); //getting today's date.
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            GridView1.DataSource = Services.SearchBuses //adding data of requested buses to gridview1.
                (ddlFrom.SelectedValue,
                ddlTo.SelectedValue,
                txtJdate.Text,
                ddlBusType.SelectedValue);
            GridView1.DataBind();

        }
        protected void btnBooking_Click(object sender, EventArgs e)
        {
            string serviceid = Request.Form["selectservice"];
            Response.Redirect("bookseat.aspx?serviceid=" + serviceid + "&jdate=" + txtJdate.Text); //opening webpage for booking seat. 

        }

    }
}