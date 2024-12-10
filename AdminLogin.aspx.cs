using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace EcommerceApplication
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdminLogin_Click(object sender, EventArgs e)
        {
            string user = txtAdminUserName.Text;
            string pass= txtAdminPass.Text;

           
            if (ValidateCredentials(user, pass))
            {
                // Credentials are correct, redirect to admin page (or dashboard)
                Response.Redirect("~/Admin.aspx");
            }
            else
            {
                
                lblMessage.Text = "Invalid username or password!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        private bool ValidateCredentials(string username, string password)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            bool isValid = false;

           
            string query = "SELECT COUNT(1) FROM Abdul_AdminsLog WHERE Username = @Username AND Password = @Password";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password);

                try
                {
                    con.Open();
                    int userCount = Convert.ToInt32(cmd.ExecuteScalar());

                    if (userCount == 1)
                    {
                        isValid = true; 
                    }
                }
                catch (Exception ex)
                {
                    
                    lblMessage.Text = "Error occurred: " + ex.Message;
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }

            return isValid;
        }
    }
}