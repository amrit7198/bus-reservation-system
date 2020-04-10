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
    public class LoginC
    {
        public static bool Check(out string username, out string passw)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString); //Creates a connection with dataabse using a connection string.
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("logincheck", con); // creates an SQL command which makes use of stored procedure "logincheck".
                cmd.CommandType = CommandType.StoredProcedure; //specifies type of command
                SqlParameter p_user=new SqlParameter("@username",SqlDbType.VarChar); //creates SqlParameter object which will be passed as output variable to the procedure "logincheck".
                p_user.Direction=ParameterDirection.Output;
                p_user.Size = 50;//size of data stored in this object
                SqlParameter p_pass=new SqlParameter("@password",SqlDbType.VarChar);
                p_pass.Direction=ParameterDirection.Output;
                p_pass.Size = 50;
                cmd.Parameters.Add(p_user);//passing p_user to the procedure.
                cmd.Parameters.Add(p_pass);
                cmd.ExecuteNonQuery();
                username=p_user.Value.ToString();
                passw=p_pass.Value.ToString();
                return true;
            }
            catch (Exception ex)
            {
                HttpContext.Current.Trace.Write("Error in Login -->" + ex.Message);
                username=passw="0"; // indicates error 
                return false;
            }
            finally
            {
                con.Close();
            }
        }
    }
    public partial class loginCheck : System.Web.UI.Page
    {

        protected void loginbtn_Click(object sender, EventArgs e)
        {
            string username, passw;
            bool done = LoginC.Check(out username, out passw);
            if (done)
            {
                if (txtUser.Text == username && txtPass.Text == passw)
                {
                    Response.Redirect("generatebus.aspx");
                }
            }
            else
            {
                lblmsg.Text = "Enter correct Username and Password.";
                Panel1.Visible = true;
            }
                
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Panel1.Visible = false;
        }

        
    }
}