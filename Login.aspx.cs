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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void UserLogin_Authenticate(object sender, AuthenticateEventArgs e)
        {
            string userName = UserLogin.UserName;
            string pass = UserLogin.Password;

            if(userName == "A" && pass == "pass")
                Response.Redirect("~/Protected_Pages/Administrator.aspx");

            else if (userName == "I" && pass == "pass")
                Response.Redirect("~/Protected_Pages/Instructor.aspx");

            else if (userName == "M" && pass == "pass")
                Response.Redirect("~/Protected_Pages/Member.aspx");

            else
                Response.Redirect("Login.aspx", true);
        }
    }
}