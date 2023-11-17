using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KarateSchoolApplication
{
    public partial class Administrator : System.Web.UI.Page
    {
        //Declare data context and connection string
        KarateSchoolDataContext dbcon;
        string conn = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\KarateSchool.mdf;Integrated Security=True;Connect Timeout=30";

        /// <summary>
        /// Load data into controls when the page is loaded
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            //Declare data context using connection string
            dbcon = new KarateSchoolDataContext(conn);

            //Select all members from the database
            var memberQuery = from member in dbcon.Members
                              select new
                              {
                                  member.Member_UserID,
                                  memberFirstName = member.MemberFirstName,
                                  memberLastName = member.MemberLastName,
                                  memberPhoneNumber = member.MemberPhoneNumber,
                                  memberDateJoined = member.MemberDateJoined
                              };

            //Load selected members into MemberGridView
            MemberGridView.DataSource = memberQuery;
            MemberGridView.DataBind();

            //Load selected members into SectionMemberGridView
            SectionMemberGridView.DataSource = memberQuery;
            SectionMemberGridView.DataBind();

            //Select all instructors from the database
            var instructorQuery = from instructor in dbcon.Instructors
                                  select new
                                  {
                                      instructorID = instructor.InstructorID,
                                      instructorFirstName = instructor.InstructorFirstName,
                                      instructorLastName = instructor.InstructorLastName
                                  };

            //Load selected instructors into InstructorGridView
            InstructorGridView.DataSource = instructorQuery;
            InstructorGridView.DataBind();

            //Select distinct sections from the database
            var sectionQuery = from section in dbcon.Sections
                               select new
                               {
                                   section.SectionID,
                                   sectionName = section.SectionName,
                                   sectionStartDate = section.SectionStartDate,
                                   sectionInstructor = section.Instructor_ID,
                                   sectionFee = section.SectionFee
                               };

            //Select only unique sections
            sectionQuery.GroupBy(x => new { x.sectionInstructor, x.sectionStartDate, x.sectionFee, x.sectionName }).Select(x => x.First());

            //Load selected sections into SectionGridView
            SectionGridView.DataSource = sectionQuery;
            SectionGridView.DataBind();
        }

        /// <summary>
        /// Add new member to database
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void MemberAddButton_Click(object sender, EventArgs e)
        {
            try
            {
                //Set dbcon to a new datacontext
                dbcon = new KarateSchoolDataContext(conn);

                //Create new user using user input
                NetUser user = new NetUser();
                user.UserName = MUserNameTxt.Text;
                user.UserPassword = MPasswordTxt.Text;
                user.UserType = "Member";

                //Add the new user to the database
                dbcon.NetUsers.InsertOnSubmit(user);
                dbcon.SubmitChanges();

                //Create new member using user input
                Member member = new Member();
                member.Member_UserID = user.UserID;
                member.MemberFirstName = MFirstNameTxt.Text;
                member.MemberLastName = MLastNameTxt.Text;
                member.MemberDateJoined = DateTime.Parse(MDateJoinedTxt.Text);
                member.MemberPhoneNumber = MPhoneNumberTxt.Text;
                member.MemberEmail = MEmailTxt.Text;

                //Add the new member to the database
                dbcon.Members.InsertOnSubmit(member);
                dbcon.SubmitChanges();

                //Reload MemberGridView with updated database
                var memberQuery = from member1 in dbcon.Members
                                  select new
                                  {
                                      member1.Member_UserID,
                                      memberFirstName = member1.MemberFirstName,
                                      memberLastName = member1.MemberLastName,
                                      memberPhoneNumber = member1.MemberPhoneNumber,
                                      memberDateJoined = member1.MemberDateJoined
                                  };
                MemberGridView.DataSource = memberQuery;
                MemberGridView.DataBind();
            }
            catch (Exception ex)
            {

            }
        }

        /// <summary>
        /// Delete member from database
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void MemberDeleteBtn_Click(object sender, EventArgs e)
        {
            try
            {
                //Select the member to remove using the selected row in MemberGridView
                int memberID = Convert.ToInt32(MemberGridView.SelectedValue);
                Member memberToRemove = (from member in dbcon.Members where member.Member_UserID == memberID select member).Single();

                //Delete all sections with member in them
                var sectionQuery = from section in dbcon.Sections where section.Member_ID == memberID select section;
                dbcon.Sections.DeleteAllOnSubmit(sectionQuery);
                dbcon.SubmitChanges();

                //Remove selected member from the database
                dbcon.Members.DeleteOnSubmit(memberToRemove);
                dbcon.SubmitChanges();

                //Delete user tied to member
                var userQuery = (from user in dbcon.NetUsers where user.UserID == memberID select user).Single();
                dbcon.NetUsers.DeleteOnSubmit(userQuery);
                dbcon.SubmitChanges();

                //Reload MemberGridView with updated database
                var memberQuery = from member in dbcon.Members
                                  select new
                                  {
                                      member.Member_UserID,
                                      memberFirstName = member.MemberFirstName,
                                      memberLastName = member.MemberLastName,
                                      memberPhoneNumber = member.MemberPhoneNumber,
                                      memberDateJoined = member.MemberDateJoined
                                  };
                MemberGridView.DataSource = memberQuery;
                MemberGridView.DataBind();
            }
            catch (Exception ex)
            {

            }
        }

        /// <summary>
        /// Add new instructor to database
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void InstructorAddButton_Click(object sender, EventArgs e)
        {
            //Set dbcon to a new datacontext
            dbcon = new KarateSchoolDataContext(conn);

            //Create new user using user input
            NetUser user = new NetUser();
            user.UserName = IUserNameTxt.Text;
            user.UserPassword = IPasswordTxt.Text;
            user.UserType = "Instructor";

            //Add the new user to the database
            dbcon.NetUsers.InsertOnSubmit(user);
            dbcon.SubmitChanges();

            //Create new instructor using user input
            Instructor instructor = new Instructor();
            instructor.InstructorID = user.UserID;
            instructor.InstructorFirstName = IFirstNameTxt.Text;
            instructor.InstructorLastName = ILastNameTxt.Text;
            instructor.InstructorPhoneNumber = IPhoneNumberTxt.Text;

            //Add the new instructor to the database
            dbcon.Instructors.InsertOnSubmit(instructor);
            dbcon.SubmitChanges();

            //Reload InstructorGridView with updated database
            var instructorQuery = from instructors in dbcon.Instructors
                                  select new
                                  {
                                      instructors.InstructorID,
                                      instructorFirstName = instructors.InstructorFirstName,
                                      instructorLastName = instructors.InstructorLastName
                                  };
            InstructorGridView.DataSource = instructorQuery;
            InstructorGridView.DataBind();
        }

        /// <summary>
        /// Delete instructor from database
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void InstructorDeleteBtn_Click(object sender, EventArgs e)
        {
            try
            {
                //Select the instructor to remove using the selected row in InstructorGridView
                int instructorID = Convert.ToInt32(InstructorGridView.SelectedValue);
                Instructor instructorToRemove = (from instructor in dbcon.Instructors where instructor.InstructorID == instructorID select instructor).Single();

                //Delete all sections that the instructor is a part of
                var sectionQuery = from section in dbcon.Sections where section.Instructor_ID == instructorID select section;
                dbcon.Sections.DeleteAllOnSubmit(sectionQuery);
                dbcon.SubmitChanges();

                //Remove selected instructor from the database
                dbcon.Instructors.DeleteOnSubmit(instructorToRemove);
                dbcon.SubmitChanges();

                //Delete user tied to member
                var userQuery = (from user in dbcon.NetUsers where user.UserID == instructorID select user).Single();
                dbcon.NetUsers.DeleteOnSubmit(userQuery);
                dbcon.SubmitChanges();

                //Reload InstructorGridView with updated database
                var instructorQuery = from instructor in dbcon.Instructors
                                      select new
                                      {
                                          instructor.InstructorID,
                                          instructorFirstName = instructor.InstructorFirstName,
                                          instructorLastName = instructor.InstructorLastName
                                      };

                InstructorGridView.DataSource = instructorQuery;
                InstructorGridView.DataBind();
            }
            catch (Exception ex)
            {

            }
        }

        /// <summary>
        /// Add member to section
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void MAddSectionBtn_Click(object sender, EventArgs e)
        {
            //Select the member to add to section using the selected row in SectionMemberGridView
            int memberID = Convert.ToInt32(SectionMemberGridView.SelectedValue);
            Member memberToAdd = (from member in dbcon.Members where member.Member_UserID == memberID select member).Single();

            //Select the section to add the member to using the selected row in SectionGridView
            int sectionID = Convert.ToInt32(SectionGridView.SelectedValue);
            Section section = (from s in dbcon.Sections where s.SectionID == sectionID select s).Single();

            //Create new section to add
            Section sectionToAdd = new Section();
            sectionToAdd.SectionName = section.SectionName;
            sectionToAdd.SectionStartDate = section.SectionStartDate;
            sectionToAdd.Instructor_ID = section.Instructor_ID;
            sectionToAdd.SectionFee = section.SectionFee;
            sectionToAdd.Member_ID = memberID;

            //Select duplicate sections
            var sectionCheck = from sec in dbcon.Sections
                               where sec.Member_ID == memberID
                               && sec.SectionName == sectionToAdd.SectionName
                               && sec.SectionStartDate == sectionToAdd.SectionStartDate
                               && sec.Instructor_ID == sectionToAdd.Instructor_ID
                               && sec.SectionFee == sectionToAdd.SectionFee
                               select sec;

            //If there are no duplicate selections
            if (sectionCheck.Count() == 0)
            {
                //Add the new section to the database
                dbcon.Sections.InsertOnSubmit(sectionToAdd);
                dbcon.SubmitChanges();
            }
        }

        protected void PageSelectRBTN_SelectedIndexChanged(object sender, EventArgs e)
        {
            UserMULTI.ActiveViewIndex = PageSelectRBTN.SelectedIndex;
        }
    }
}