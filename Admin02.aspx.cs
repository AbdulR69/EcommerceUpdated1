using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace EcommerceApplication
{
    public partial class Admin02 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if(Session["Brand"]!=null && Session["Model"]!=null)
                {
                    //txtBrand.Text = Session["Brand"].ToString();
                    //txtModel.Text = Session["Model"].ToString();

                    string brandT = Session["Brand"].ToString();
                    string modelT=Session["Model"].ToString();
                }
            }
        }

        protected void btnImageUpload_Click(object sender, EventArgs e)
        {
            if (fileUpload1.HasFile)
            {
                // Get the file extension
                string fileExtension = System.IO.Path.GetExtension(fileUpload1.FileName);

                if (fileExtension.ToLower() != ".jpg" && fileExtension.ToUpper() != ".png")
                {
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "Only files with .jpg and .png extension are allowed";
                }
                else
                {

                    fileUpload1.SaveAs(Server.MapPath("~/Uploads" + fileUpload1.FileName));
                    Label1.ForeColor = System.Drawing.Color.Green;
                    Label1.Text = "File uploaded successfully";

                }
            }
            else
            {
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "Please select a file";
            }
        }

        protected void btnDataUpload_Click(object sender, EventArgs e)
        {
            
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand insertItem = new SqlCommand(
                            "INSERT INTO Abdul_CarFeatures (brand, model, price, fuel_type, mileage, image_url) VALUES (@brand, @model, @price, @fuel_type ,@mileage, @image_url)", con);

                if (Session["Brand"] != null && Session["Model"] != null)
                {
                    //txtBrand.Text = Session["Brand"].ToString();
                    //txtModel.Text = Session["Model"].ToString();

                    string brandT = Session["Brand"].ToString();
                    string modelT = Session["Model"].ToString();





                    insertItem.Parameters.AddWithValue("@brand", brandT);
                    insertItem.Parameters.AddWithValue("@model", modelT);
                    insertItem.Parameters.AddWithValue("@price", txtPrice.Text);
                    insertItem.Parameters.AddWithValue("@fuel_type", ddlFuel.Text);
                    insertItem.Parameters.AddWithValue("@mileage", txtMileage.Text);
                    insertItem.Parameters.AddWithValue("@image_url", "~/Uploads" + fileUpload1.FileName);

                    int rowsInserted = insertItem.ExecuteNonQuery();

                    if (rowsInserted > 0)
                    {
                        lblMessage.Text = "Item registration Successful";
                        lblMessage.ForeColor = System.Drawing.Color.Green;

                    }
                }
            }
        }

        protected void ddlFuel_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {

        }
    }
}