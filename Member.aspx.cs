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
        protected void ToLogin_Click(object sender, EventArgs e)
        {
            // Redirect the user to Login.aspx
            Response.Redirect("Login.aspx");
        }
    }
}