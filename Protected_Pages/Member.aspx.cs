using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KarateSchoolApplication
{
    public partial class Member1 : System.Web.UI.Page
    {
        // Connection string 
        static string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\KarateSchool.mdf;Integrated Security=True;Connect Timeout=30";

        protected void Page_Load(object sender, EventArgs e)
        {
            // KarateSchoolDataContext instance
            KarateSchoolDataContext dataConnection = new KarateSchoolDataContext(connectionString);

            // Get UserID (UserID is passed in from Login.aspx)
            int userID = Convert.ToInt32(Page.User.Identity.Name);

            // LINQ query to pull FirstName and LastName from Members Table based on UserID
            var name = (from item in dataConnection.Members
                        where item.Member_UserID == userID
                        select new
                        {
                            item.MemberFirstName,
                            item.MemberLastName
                        }).FirstOrDefault();

            // Update GreetUserLBL to show logged user's first & last name
            GreetUserLBL.Text = "Hello " + name.MemberFirstName + " " + name.MemberLastName + ", Your Information:";
        }
    }
}