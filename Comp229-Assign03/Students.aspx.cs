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
    
    public partial class Students : System.Web.UI.Page    
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
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
            cmd.Parameters.Add("StudentID", SqlDbType.Int);
            cmd.Parameters["StudentID"].Value = Convert.ToInt32(Request["StudentID"]);
            String strSql = 
                string.Format("SELECT * FROM Comp229Assign03.[dbo].Students where StudentID='{0}' ORDER BY StudentID     DESC"
                    , Request["StudentID"]);
            String strSql1 =
                string.Format("SELECT * FROM Comp229Assign03.[dbo].Courses WHERE CourseID IN (SELECT E.CourseID FROM Comp229Assign03.[dbo].Students S LEFT JOIN Comp229Assign03.[dbo].Enrollments E ON S.StudentID = E.StudentID where S.StudentID = '{0}')"
                    , Request["StudentID"]);

            cmd.CommandText = strSql;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet dataset = new DataSet();
            da.Fill(dataset, "Comp229Assign03.[dbo].Students");

            this.GridView2.DataSource = dataset;
            this.GridView2.DataBind();

            cmd.CommandText = strSql1;
            SqlDataAdapter da1 = new SqlDataAdapter(cmd);
            DataSet dataset1 = new DataSet();
            da1.Fill(dataset1, "Comp229Assign03.[dbo].Students");

            this.GridView3.DataSource = dataset1;
            this.GridView3.DataBind();

            con.Close();
        }
        
    }
}//"SELECT * FROM Comp229Assign03.[dbo].Students S LEFT JOIN Comp229Assign03.[dbo].Enrollments E ON S.StudentID=E.StudentID where S.StudentID='{0}' ORDER BY S.StudentID DESC"