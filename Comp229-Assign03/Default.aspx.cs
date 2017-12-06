using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Comp229_Assign03.Models;

namespace Comp229_Assign03
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "SH College";
                DisplayData();
        }

         
        private void DisplayData()
        {

            String strSql = "SELECT * FROM Comp229Assign03.[dbo].Students ORDER BY StudentID     DESC";
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings[
                "ConnectionString"].ConnectionString;

            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = strSql;
            cmd.CommandType = CommandType.Text;

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet dataset = new DataSet();
            da.Fill(dataset, "Comp229Assign03.[dbo].Students");

            this.GridView1.DataSource = dataset;
            this.GridView1.DataBind();
            con.Close();
        }

        protected void btnWrite_Click(object sender, EventArgs e)
        {
            btnWrite.Enabled = false;

            string FirstName = this.txtFname.Text;
            string LastName = this.txtLname.Text;

            string strSql = "INSERT into Comp229Assign03.[dbo].Students (LastName, FirstMidName, EnrollmentDate) Values('" + FirstName + "','" + LastName + "','" + DateTime.Now + "')";

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            con.Open();

            SqlCommand insert = new SqlCommand();
            //SqlCommand cmd = new SqlCommand("WriteStudentInput", con);
            insert.Connection = con;
            /*
            insert.CommandText = @"
            SET IDENTITY_INSERT Students ON
            insert into Students Values(@StudentID, @FirstMidName, @LastName, GetDate()) 
            SET IDENTITY_INSERT Students OFF       
            ";
            insert.Parameters.AddWithValue("@StudentID", FirstInput.StudentID);
            insert.Parameters.AddWithValue("@FirstMidName", FirstInput.FirstMidName);
            insert.Parameters.AddWithValue("@LastName", FirstInput.LastName);
            */
            //insert.Parameters.AddWithValue("@EnrollmentDate", FirstInput.EnrollmentDate);
            insert.CommandText = strSql;
            insert.CommandType = CommandType.Text;

            insert.ExecuteNonQuery();

            con.Close();
            Response.Redirect("./Default.aspx");
        }
       

    }
}