using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace EcommerceApplication
{
    public partial class PreHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {   
            if(!IsPostBack)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    // Prepare SQL query to select products by category
                    SqlDataAdapter da = new SqlDataAdapter("SELECT CONCAT(brand,'-',model) AS Car_details,price,image_url FROM Abdul_CarFeatures", conn);
                  

                    // Fill the dataset with the query result
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Items");

                    // Bind the result to the repeater control
                    rptItems.DataSource = ds.Tables["Items"];
                    rptItems.DataBind();
                }
            }
        }
    }
}