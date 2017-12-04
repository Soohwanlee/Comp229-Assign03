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
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "SH College";

            
            if(!Page.IsPostBack)
            {
                DisplayData();
            }
           
        }

        /*
        protected void btnSqlConnection_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();

            //con.ConnectionString = "server=(LocalDb)\\MSSQLLocalDB;" + "database=Comp229Assign03;";
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con.Open();

            lblDisplay.Text = "데이터베이스 연결성공";
            con.Close();
        }
        */

        
        private void DisplayData()
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings[
                "ConnectionString"].ConnectionString;

            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = @"Select FirstMidName, LastName From Students";
            cmd.CommandType = CommandType.Text;

            SqlDataReader dr = cmd.ExecuteReader();

            string strOutput = "<table border=\"1\">"+"<tr><td>Name</tr>" ;

            while (dr.Read())
            {
                strOutput += $"<tr><td>{dr["FirstMidName"]}</td>" +
                    $"<td>{dr["LastName"]}</td></tr>";
            }

            strOutput += "</table>";

            dr.Close();

            tblOutput.Text = strOutput;

            con.Close();

        }
       

    }
}