using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KarateSchoolApplication
{
    public partial class Administrator : System.Web.UI.Page
    {
        KarateSchoolDataContext dbcon;
        string conn = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\KarateSchool.mdf;Integrated Security=True;Connect Timeout=30";
        protected void Page_Load(object sender, EventArgs e)
        {
            //Select all members from the database
            dbcon = new KarateSchoolDataContext(conn);
            var memberQuery = from member in dbcon.Members
                              select new
                              { member.MemberFirstName, member.MemberLastName, member.MemberPhoneNumber, member.MemberDateJoined };

            //Load selected models into the database
            MemberGridView.DataSource = memberQuery;
            MemberGridView.DataBind();

            var instructorQuery = from instructor in dbcon.Instructors
                                  select new
                                  { instructor.InstructorFirstName, instructor.InstructorLastName };

            InstructorGridView.DataSource = instructorQuery;
            InstructorGridView.DataBind();
        }

        protected void MemberAddButton_Click(object sender, EventArgs e)
        {
            try
            {
                //Set dbcon to a new datacontext
                dbcon = new KarateSchoolDataContext(conn);

                //Create new model using user input
                NetUser user = new NetUser();
                user.UserName = MUserNameTxt.Text;
                user.UserPassword = MPasswordTxt.Text;
                user.UserType = "Member";

                //Add the new model to the database
                dbcon.NetUsers.InsertOnSubmit(user);
                dbcon.SubmitChanges();

                Member member = new Member();
                member.Member_UserID = user.UserID;
                member.MemberFirstName = MFirstNameTxt.Text;
                member.MemberLastName = MLastNameTxt.Text;
                member.MemberDateJoined = DateTime.Parse(MDateJoinedTxt.Text);
                member.MemberPhoneNumber = MPhoneNumberTxt.Text;
                member.MemberEmail = MEmailTxt.Text;

                //Add the new model to the database
                dbcon.Members.InsertOnSubmit(member);
                dbcon.SubmitChanges();

                //Reload the grid view with updated database
                var membersQuery = from member1 in dbcon.Members
                                   select new
                                   { member1.MemberFirstName, member1.MemberLastName, member1.MemberPhoneNumber, member1.MemberDateJoined };
                MemberGridView.DataSource = membersQuery;
                MemberGridView.DataBind();
            }
            catch (Exception ex)
            {

            }
        }

        protected void MemberDeleteBtn_Click(object sender, EventArgs e)
        {

        }

        protected void InstructorAddButton_Click(object sender, EventArgs e)
        {
            try
            {
                //Set dbcon to a new datacontext
                dbcon = new KarateSchoolDataContext(conn);

                //Create new model using user input
                NetUser user = new NetUser();
                user.UserName = IUserNameTxt.Text;
                user.UserPassword = IPasswordTxt.Text;
                user.UserType = "Instructor";

                //Add the new model to the database
                dbcon.NetUsers.InsertOnSubmit(user);
                dbcon.SubmitChanges();

                Instructor instructor = new Instructor();
                instructor.InstructorID = user.UserID;
                instructor.InstructorFirstName = IFirstNameTxt.Text;
                instructor.InstructorLastName = ILastNameTxt.Text;
                instructor.InstructorPhoneNumber = IPhoneNumberTxt.Text;

                //Add the new model to the database
                dbcon.Instructors.InsertOnSubmit(instructor);
                dbcon.SubmitChanges();

                //Reload the grid view with updated database
                var instructorQuery = from instructor1 in dbcon.Instructors
                                      select new
                                      { instructor1.InstructorFirstName, instructor1.InstructorLastName };
                InstructorGridView.DataSource = instructorQuery;
                InstructorGridView.DataBind();
            }
            catch (Exception ex)
            {

            }
        }

        protected void InstructorDeleteBtn_Click(object sender, EventArgs e)
        {

        }
    }
}