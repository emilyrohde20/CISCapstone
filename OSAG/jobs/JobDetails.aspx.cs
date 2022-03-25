﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//Sql Imports
using System.Data;
using System.Data.SqlClient;
//Connection Strings in web.config
using System.Web.Configuration;

namespace OSAG.jobs
{
    public partial class JobDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) //check if the webpage is loaded for the first time.
            {
                ViewState["PreviousPage"] =
            Request.UrlReferrer;//Saves the Previous page url in ViewState
            }
            //Query
            String sqlQuery = "Select 'Job Name: ' + JobName as Name, 'Company Name: ' + CompanyName as Company, 'Job Description: ' +  JobDescription as Description, 'Application Deadline: ' + CAST(ApplicationDeadline AS varchar) as Deadline" +
                ", 'Start Date: ' + CAST(StartDate as varchar) as Start, 'Weekly Hours: ' + CAST(WeeklyHours AS varchar) as Hours, 'Payment: ' + FORMAT(Payment,'C') as Payment" +
                " from Job LEFT JOIN Company ON Company.CompanyID = Job.CompanyID where JobName+CompanyName = '" + Session["View"].ToString()
                + "'";

            // Define the Connection
            SqlConnection sqlConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["OSAG"].ConnectionString);

            //Create and Format the Command
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnection;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;

            // Execute the Query and get results
            sqlConnection.Open();
            SqlDataReader queryResults = sqlCommand.ExecuteReader();
            while (queryResults.Read())
            {
                lblDetails.Text = queryResults["Name"].ToString();
                lblDetails1.Text = queryResults["Company"].ToString();
                lblDetails2.Text = queryResults["Description"].ToString();
                lblDetails3.Text = queryResults["Deadline"].ToString();
                lblDetails4.Text = queryResults["Start"].ToString();
                lblDetails5.Text = queryResults["Hours"].ToString();
                lblDetails6.Text = queryResults["Payment"].ToString();
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            if (ViewState["PreviousPage"] != null)
            {
                Response.Redirect(ViewState["PreviousPage"].ToString());
            }
        }
    }
}