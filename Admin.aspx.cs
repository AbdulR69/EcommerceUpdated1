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
    public partial class Admin : System.Web.UI.Page
    {   
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        

        protected void CheckModelExists_Click(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            try
            {
                using (SqlConnection con = new SqlConnection(CS))
                {
                    con.Open();

                    //if (con.State == ConnectionState.Open)
                    //{
                    //    Response.Write("Database connected successfully!");
                    //}
                    SqlCommand checkItem = new SqlCommand("Abdul_CheckBrandModelExist", con)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    checkItem.Parameters.AddWithValue("@brand", txtBrand.Text);
                    checkItem.Parameters.AddWithValue("@model", txtModel.Text);

                    SqlDataReader reader = checkItem.ExecuteReader();

                    if (reader.HasRows)
                    {
                        LblExists.Text = "Item Already Exists";
                        LblExists.ForeColor = System.Drawing.Color.Red;
                        txtBrand.Text = "";
                        txtModel.Text = "";
                        reader.Close();
                        return;
                    }
                    else
                    {
                        Session["Brand"] = txtBrand.Text;
                        Session["Model"] = txtModel.Text;
                        Response.Redirect("~/Admin02.aspx");
                    }

                    
                }
            }
            catch (Exception ex)
            {
                lblMessage1.Text = "Error: " + ex.Message;
                lblMessage1.ForeColor = System.Drawing.Color.Red;
            }
           
            
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {

        }
    }
}