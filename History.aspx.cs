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
        public partial class History : System.Web.UI.Page
        {
            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                HttpCookie cookie = Request.Cookies["UserDetails"];
                // Retrieve logged-in user's username from session
                if (cookie!=null)
                    {
                    string username = cookie["Username"] as string;
                    BindHistoryData(username);
                    }
                else
                {
                    Response.Redirect("~/Login.Aspx");
                }
                    
                }
            }

            private void BindHistoryData(string username)
            {
                // Replace with your database connection string
                string connectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = @"
                    SELECT Brand1, Model1, Brand2, Model2
                    FROM Cars_History_Log
                    WHERE Username = @Username";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Username", username);

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    HistoryGV.DataSource = dt;
                    HistoryGV.DataBind();
                    HistoryGV.Visible = dt.Rows.Count > 0;
            }
            }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Login.Aspx");
        }
    }
    }

