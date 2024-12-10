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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ddlGender_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        

        protected void Button1_Click(object sender, EventArgs e) 
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(CS))
                {
                    con.Open();
                    
                    if (con.State == ConnectionState.Open)
                    {
                        Response.Write("Database connected successfully!");
                    }
                    SqlCommand checkUser = new SqlCommand("Abdul_CheckGetRegisteredUser", con)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    checkUser.Parameters.AddWithValue("@Username", txtUsername.Text);

                    SqlDataReader reader = checkUser.ExecuteReader();

                    if (reader.HasRows)
                    {
                        lblMessage.Text = "User Already Exists";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        return;
                    }

                    reader.Close();

                    SqlCommand insertUser = new SqlCommand(
                        "INSERT INTO Abdul_UsersLog (Username, Name, Email, Phone, Gender, Password) VALUES (@Username, @Name, @Email, @Phone, @Gender, @Password)", con);

                    insertUser.Parameters.AddWithValue("@Username", txtUsername.Text);
                    insertUser.Parameters.AddWithValue("@Name", txtName.Text);
                    insertUser.Parameters.AddWithValue("@Email", txtEmail.Text);
                    insertUser.Parameters.AddWithValue("@Phone", txtPhone.Text);
                    insertUser.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
                    insertUser.Parameters.AddWithValue("@Password", txtPass.Text);

                    int rowsInserted = insertUser.ExecuteNonQuery();

                    if (rowsInserted > 0)
                    {
                        lblMessage.Text = "Registration Successful";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        // Response.Redirect("~/Login.aspx");
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }


        protected void btnSignIn_Click(object sender, EventArgs e)
        {

        }
    }
}