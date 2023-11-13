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
            int userID = Convert.ToInt32(User.Identity.Name);

            // LINQ query to pull FirstName and LastName from Members Table based on UserID
            var name = (from item in dataConnection.Members
                        where item.Member_UserID == userID
                        select new
                        {
                            item.MemberFirstName,
                            item.MemberLastName
                        }).First();

            // Update GreetUserLBL to show logged user's first & last name
            GreetUserLBL.Text = "Hello " + name.MemberFirstName + " " + name.MemberLastName + ", Your Information:";

            // LINQ query to pull all records from Sections / Instructor Table with matching UserID
            var userInfo = from section in dataConnection.Sections
                           join member in dataConnection.Members
                           on section.Member_ID equals member.Member_UserID
                           join instructor in dataConnection.Instructors
                           on section.Instructor_ID equals instructor.InstructorID
                           where section.Member_ID == userID
                           select new
                           {
                               section = section.SectionName,
                               firstName = instructor.InstructorFirstName,
                               lastName = instructor.InstructorLastName,
                               sectionDate = section.SectionStartDate,
                               sectionAmount = section.SectionFee 
                           };

            // Set UserInfoGRID's DataSource propery to result of query and bind
            UserInfoGRID.DataSource = userInfo;
            UserInfoGRID.DataBind();
        }
    }
}