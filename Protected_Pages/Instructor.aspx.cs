using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KarateSchoolApplication
{
    public partial class Instructor1 : System.Web.UI.Page
    {
        // Connection string 
        static string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\KarateSchool.mdf;Integrated Security=True;Connect Timeout=30";

        protected void Page_Load(object sender, EventArgs e)
        {
            // KarateSchoolDataContext instance
            KarateSchoolDataContext dataConnection = new KarateSchoolDataContext(connectionString);

            // Get UserID (UserID is passed in from Login.aspx)
            int userID = Convert.ToInt32(User.Identity.Name);

            // LINQ query to pull FirstName and LastName from Instructors Table based on UserID
            var name = (from item in dataConnection.Instructors
                        where item.InstructorID == userID
                        select new
                        {
                            item.InstructorFirstName,
                            item.InstructorLastName
                        }).First();

            // Update GreetUserLBL to show logged user's first & last name
            GreetUserLBL.Text = "Hello " + name.InstructorFirstName + " " + name.InstructorLastName + ", Your Members:";

            // LINQ query to pull all records from Sections Table with matching UserID
            var sections = from section in dataConnection.Sections
                            join member in dataConnection.Members
                            on section.Member_ID equals member.Member_UserID
                            where section.Instructor_ID == userID
                            select new
                            {
                                section = section.SectionName,
                                firstName = member.MemberFirstName,
                                lastName = member.MemberLastName
                            };

            // Set MembersGRID's DataSource propery to result of query and bind
            MembersGRID.DataSource = sections;
            MembersGRID.DataBind();
        }
    }
}