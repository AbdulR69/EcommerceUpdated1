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
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)

        {

            HttpCookie cookie = Request.Cookies["UserDetails"];
            if (cookie != null)
            {   
                CookiePanel.Visible = (Request.Cookies["Name"] != null);
                Response.Write("Hello, Welcome" + cookie["Name"]);
            }
            if (!IsPostBack)
            {



                if (cookie != null)
                {
                    string connectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;


                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        // Prepare SQL query to select products by category
                        SqlDataAdapter da = new SqlDataAdapter("SELECT TOP 5 CONCAT(brand,'-',model) AS Car_details,price,image_url FROM Abdul_CarFeatures", conn);


                        // Fill the dataset with the query result
                        DataSet ds = new DataSet();
                        da.Fill(ds, "Items");

                        // Bind the result to the repeater control
                        rptItems.DataSource = ds.Tables["Items"];
                        rptItems.DataBind();
                    }
                    SqlConnection connection = new SqlConnection(connectionString);

                    connection.Open();

                    SqlCommand command = new SqlCommand("SELECT CONCAT(brand,'-',model) As Car_Details,model As Model FROM Abdul_CarFeatures", connection);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {

                        ddlCar1.DataSource = reader;
                        ddlCar1.DataTextField = "Car_Details";
                        ddlCar1.DataValueField = "Model";
                        ddlCar1.DataBind();

                    }
                    ddlCar2.Items.Insert(0, new ListItem("SELECT CAR", "0"));


                }
            }
        }
        protected void ddlCar1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            string sel = ddlCar1.SelectedValue;
            
            SqlCommand command = new SqlCommand("SELECT CONCAT(brand,'-',model) As Car_Details,model As Model FROM Abdul_CarFeatures WHERE model!=@SelectedValue", connection);
            command.Parameters.AddWithValue("@SelectedValue", sel);
            using (SqlDataReader reader = command.ExecuteReader())
            {

                ddlCar2.DataSource = reader;
                ddlCar2.DataTextField = "Car_Details";
                ddlCar2.DataValueField = "Model";
                ddlCar2.DataBind();
            }
        }



        protected void btnCompare_Click(object sender, EventArgs e)
        {
            string car1 = ddlCar1.SelectedValue;
            string car2 = ddlCar2.SelectedValue;

            if (!string.IsNullOrEmpty(car1) && !string.IsNullOrEmpty(car2))
            {
                DataTable comparisonData = GetCarComparison(car1, car2);
                if (comparisonData.Rows.Count > 0)
                {
                    gvComparison.Visible = true;
                    gvComparison.DataSource = comparisonData;
                    gvComparison.DataBind();
                }

                // Fetch User Cookie
                HttpCookie cookie = Request.Cookies["UserDetails"];
                string username = cookie != null ? cookie["Username"] : "Unknown";

                // Fetch brand names for selected models
                string brand1 = ddlCar1.SelectedItem.Text.Split('-')[0]; // Assuming text is "Brand-Model"
                string brand2 = ddlCar2.SelectedItem.Text.Split('-')[0];

                // Insert into History Log
                string connectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    SqlCommand updateHistory = new SqlCommand(
                        "INSERT INTO Cars_History_Log (Username, brand1, model1, brand2, model2) " +
                        "VALUES (@Username, @brand1, @model1, @brand2, @model2)", connection);

                    updateHistory.Parameters.AddWithValue("@Username", username);
                    updateHistory.Parameters.AddWithValue("@brand1", brand1);
                    updateHistory.Parameters.AddWithValue("@model1", car1);
                    updateHistory.Parameters.AddWithValue("@brand2", brand2);
                    updateHistory.Parameters.AddWithValue("@model2", car2);

                    updateHistory.ExecuteNonQuery();
                }
            }
        }




        private DataTable GetCarComparison(string car1, string car2)
{
    // Create the DataTable with required columns
    DataTable comparisonTable = new DataTable();
    comparisonTable.Columns.Add("Feature");
    comparisonTable.Columns.Add("Car1");
    comparisonTable.Columns.Add("Car2");
 
    // Connection string
    string connectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
 
    // SQL query
    string query = "SELECT model, price, fuel_type, mileage FROM Abdul_CarFeatures WHERE model = @Car1 OR model = @Car2";
 
    // Use a dictionary to store car data for both cars
    var carData = new Dictionary<string, string[]>
    {
        { car1, null },
        { car2, null }
    };
 
    // Execute the query
    using (SqlConnection connection = new SqlConnection(connectionString))
    {
        connection.Open();
        using (SqlCommand command = new SqlCommand(query, connection))
        {
            command.Parameters.AddWithValue("@Car1", car1);
            command.Parameters.AddWithValue("@Car2", car2);
 
            using (SqlDataReader reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    string model = reader["model"].ToString();
                    if (carData.ContainsKey(model))
                    {
                        carData[model] = new string[]
                        {
                            reader["model"].ToString(),
                            reader["price"].ToString(),
                            reader["fuel_type"].ToString(),
                            reader["mileage"].ToString()
                        };
                    }
                }
            }
        }
    }
 
    // Define the features to compare
    string[] features = { "Model", "Price", "Fuel Type", "Mileage" };
 
    // Populate the DataTable
    for (int i = 0; i < features.Length; i++)
    {
        DataRow row = comparisonTable.NewRow();
        row["Feature"] = features[i];
        row["Car1"] = carData[car1]?[i];
        row["Car2"] = carData[car2]?[i];
        comparisonTable.Rows.Add(row);
    }
 
    return comparisonTable;
}

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            
            if(Request.Cookies["UserDetails"]!=null)
            {
                HttpCookie cookie = new HttpCookie("UserDetails");
                cookie.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(cookie);
            }
            Response.Redirect("~/Login.aspx");
        }
    }
}