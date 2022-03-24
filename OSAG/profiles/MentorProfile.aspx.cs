﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
// SQL imports
using System.Data;
using System.Data.SqlClient;

namespace OSAG.profiles
{
    public partial class MentorProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                sqlsrcMentorQuery.SelectCommand = "SELECT Username, FirstName, LastName, Email, StAddress, City, M_State, ZipCode " +
                    "FROM Mentor WHERE Username = '" + (String)Session["Username"] + "';";
            }
            catch (SqlException)
            {
                Session["MustLogIn"] = "You must log in to access that page.";
                Response.Redirect("/login/LogIn.aspx");
                throw;
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect("/profiles/EditMentorProfile.aspx");
        }
    }
}