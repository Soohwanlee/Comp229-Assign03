using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Comp229_Assign03
{
    public partial class Course : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "SH College";
            DisplayData();
        }

        private void DisplayData()
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings[
                "ConnectionString"].ConnectionString;

            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add("CourseID", SqlDbType.Int);
            cmd.Parameters["CourseID"].Value = Convert.ToInt32(Request["CourseID"]);
            String strSql =
                string.Format("SELECT * FROM Comp229Assign03.[dbo].Students WHERE StudentID IN (SELECT s.StudentID FROM Comp229Assign03.[dbo].Students S LEFT JOIN Comp229Assign03.[dbo].Enrollments E ON S.StudentID = E.StudentID where e.CourseID = '{0}')"
                    , Request["CourseID"]);

            cmd.CommandText = strSql;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet dataset = new DataSet();
            da.Fill(dataset, "Comp229Assign03.[dbo].Students");

            this.GridView4.DataSource = dataset;
            this.GridView4.DataBind();

            con.Close();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Page.ClientScript.RegisterClientScriptBlock(
                    this.GetType(), "alertMessage", "<script>alert('Success!!');</script>");
            }

            btnAdd.Enabled = false;

            string StdID = this.txtStudnetID.Text;

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings[
                "ConnectionString"].ConnectionString;

            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add("CourseID", SqlDbType.Int);
            cmd.Parameters["CourseID"].Value = Convert.ToInt32(Request["CourseID"]);
            
            String strSql =
                string.Format("INSERT into Comp229Assign03.[dbo].Enrollments (CourseID, StudentID, Grade) Values('{0}','{1}','0')"
                    , Request["CourseID"], StdID);
            
            cmd.CommandText = strSql;
            cmd.CommandType = CommandType.Text;

            cmd.ExecuteNonQuery();

            con.Close();

            Response.Redirect(Request.Url.ToString());
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Page.ClientScript.RegisterClientScriptBlock(
                    this.GetType(), "alertMessage", "<script>alert('Success!!');</script>");
            }

            btnDelete.Enabled = false;
            string StdID = this.txtStudnetID.Text;

            String strSql = string.Format("DELETE from Comp229Assign03.[dbo].Enrollments where StudentID = '{0}' and CourseID = '{1}'"
                    , StdID, Request["CourseID"]);

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            con.Open();

            SqlCommand cmd = new SqlCommand();

            cmd.Connection = con;

            cmd.CommandText = strSql;
            cmd.CommandType = CommandType.Text;

            cmd.ExecuteNonQuery();

            con.Close();
            Response.Redirect(Request.Url.ToString());
        }
    }
}