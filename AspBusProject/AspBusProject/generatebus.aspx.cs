using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace AspBusProject
{
    public partial class generatebus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Panel1.Enabled = false;
        }
        protected void btnGenerate_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString); //Creates a connection with dataabse using a connection string.
            DateTime sd = DateTime.Parse(txtStdate.Text); //converting user enterd Date into object.
            DateTime ed = DateTime.Parse(txtEnddate.Text);
            SqlTransaction trans = null;
            try
            {
                SqlDataAdapter sda = new SqlDataAdapter("select * from services order by serviceid", con); //creates an object to execute the command passed as argument. 
                DataSet ds = new DataSet();
                sda.Fill(ds, "services");

                con.Open();
                trans = con.BeginTransaction();

                SqlCommand buscmd = new SqlCommand("insert into buses values(@serviceid,@jdate,null,@availableseats)", con);
                buscmd.Transaction = trans;
                buscmd.Parameters.Add("@serviceid", SqlDbType.Int);
                buscmd.Parameters.Add("@jdate", SqlDbType.DateTime);
                buscmd.Parameters.Add("@availableseats", SqlDbType.Int);

                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    // insert rows into buses for the given dates and current service
                    DateTime jd = sd;
                    while (jd.CompareTo(ed) <= 0)
                    {
                        buscmd.Parameters[0].Value = row["serviceid"];
                        buscmd.Parameters[1].Value = jd;
                        buscmd.Parameters[2].Value = row["noseats"];
                        jd = jd.AddDays(1);
                        buscmd.ExecuteNonQuery();
                        //Response.Write(row["serviceid"] + ":" + jd + ":" + row["noseats"]);
                    } // end of while 
                } // end of foreach

                trans.Commit();
                lblMsg.Text = "Generated Buses Information Successfully!";
            }
            catch (Exception ex)
            {
                trans.Rollback();
                lblMsg.Text = "Error --> " + ex.Message;
            }
            finally
            {
                Panel1.Enabled = true;
                con.Close();
            }
        }
    }
}