using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KarateSchoolApplication
{
    public partial class Login : System.Web.UI.Page
    {
        // Connection string 
        static string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\KarateSchool.mdf;Integrated Security=True;Connect Timeout=30";
        
        // Helper method to determine whether or not a given User exists in the Database (KarateSchool NetUser Table)
        // Also returns userID
        public Boolean CheckUserExists(string userName, string password, out int userID)
        {
            // KarateSchoolDataContext instance
            KarateSchoolDataContext dataConnection = new KarateSchoolDataContext(connectionString);

            // LINQ Query to verify User exists in Database
            var matchingUser = (from item in dataConnection.NetUsers
                                where item.UserName == userName && item.UserPassword == password
                                select item).FirstOrDefault();

            // Check to see if a valid userID was pulled
            if(matchingUser != null)
            {
                // Valid User, so set userID & return true
                userID = matchingUser.UserID;
                return true;
            }

            // Invalid User, so return false
            else
            {
                // Set userID to -1 for invalid User
                userID = -1;
                return false;
            }
        }

        protected void UserLogin_Authenticate(object sender, AuthenticateEventArgs e)
        {
            // userName & password variables from UserLogin
            string userName = UserLogin.UserName;
            string password = UserLogin.Password;

            // KarateSchoolDataContext instance
            KarateSchoolDataContext dataConnection = new KarateSchoolDataContext(connectionString);

            // Use CheckUserExists to ensure User is valid
            if(CheckUserExists(userName, password, out int userID))
            {
                // LINQ Query to pull userType from database based on UserID
                string userType = (from item in dataConnection.NetUsers
                                   where item.UserID == userID
                                   select item.UserType).First();

                // Authenticate User and redirect them to the applicable page
                FormsAuthentication.SetAuthCookie(userID.ToString(), true);

                // Switch based on userType
                switch(userType)
                {
                    // Redirect User to Member Page (Member User Type) 
                    case "Member":
                        Response.Redirect("~/Protected_Pages/Member.aspx");
                        break;

                    // Redirect User to Instructor Page (Instructor User Type) 
                    case "Instructor":
                        Response.Redirect("~/Protected_Pages/Instructor.aspx");
                        break;

                    // Redirect User to Administrator Page (Administrator User Type) 
                    case "Administrator":
                        Response.Redirect("~/Protected_Pages/Administrator.aspx");
                        break;
                }
            }
        }
    }
}