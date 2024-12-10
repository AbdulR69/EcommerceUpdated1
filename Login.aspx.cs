using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
namespace EcommerceApplication
{
    public partial class Login1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnUserLogin_Click(object sender, EventArgs e)
        {
            string user = txtUserUserName.Text;
            string pass = txtUserPass.Text;


            if (ValidateCredentials(user, pass))
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                string queryString = "SELECT Name FROM Abdul_UsersLog WHERE Username = @Username"; // Replace "YourTable" and "Id" with your actual table and column names
                
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand(queryString, connection);
                    command.Parameters.AddWithValue("@Username",user); // Replace "yourIdValue" with the actual ID you want to fetch

                    connection.Open();

                    string name = (string)command.ExecuteScalar(); // Execute the query and get the first result as a string

                    Console.WriteLine("Name: " + name);
                    HttpCookie cookie = new HttpCookie("UserDetails");
                    cookie["UserName"] = txtUserUserName.Text;
                    cookie["Password"] = txtUserPass.Text;
                    cookie["Name"] = name;
                    cookie.Expires = DateTime.Now.AddDays(30);
                    Response.Cookies.Add(cookie);

                    connection.Close();
                }



                //HttpCookie cookie = new HttpCookie("UserDetails");
                //cookie["UserName"] = txtUserUserName.Text;
                //cookie["Password"] = txtUserPass.Text;
                //cookie["Name"] = string(name);
                //cookie.Expires = DateTime.Now.AddDays(30);
                //Response.Cookies.Add(cookie);
                Response.Redirect("~/Home.aspx");
            }
            else
            {
                txtUserUserName.Text = "";
                txtUserPass.Text = "";
                lblMessage.Text = "Invalid username or password!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        private bool ValidateCredentials(string username, string password)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            bool isValid = false;


            string query = "SELECT COUNT(1) FROM Abdul_UsersLog WHERE Username = @Username AND Password = @Password";

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

        protected void lblNewUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Register.aspx");
        }

        protected void lblAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Register.aspx");
        }
    }
}