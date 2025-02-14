using System;

using System.Configuration;

using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Text;

namespace AirportTransfer
{
    public partial class Error : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int loggedErrorNumber = 0;

            if (IsPostBack) return;

            if (HttpContext.Current.Cache["LastError"] != null)
            {
                Exception ex = (Exception)HttpContext.Current.Cache["LastError"];
                if (ex.Data["ErrorTime"] != null && ex.Data["ErrorSession"] != null)
                {
                        // Response.Write("error: " + ex.HelpLink.ToString());

                        if (ex.HelpLink != null)
                        {
                            loggedErrorNumber = Convert.ToInt32(ex.HelpLink);
                        }

                        lblLoggedErrorNumber.Text = String.Format(ConfigurationManager.AppSettings["LoggedErrorNumber"], ex.HelpLink);
                }
            }
        }
    }
}