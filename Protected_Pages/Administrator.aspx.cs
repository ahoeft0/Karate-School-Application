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
        protected void PageSelectRBTN_SelectedIndexChanged(object sender, EventArgs e)
        {
            UserMULTI.ActiveViewIndex = PageSelectRBTN.SelectedIndex;
        }
    }
}