using System;

using System.Configuration;

using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AirportTransfer
{
    public partial class DynamicImage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string airLineName = Request.QueryString["AirLine"];

            string flightNumber = Request.QueryString["Flight"];

                // imgShowAirLineLogo.ImageUrl = String.Format(ConfigurationManager.AppSettings["HandlerImageFormatAirLine"], "Wiz Air");

            System.Drawing.Image imgFromDB;
                
            if (!String.IsNullOrEmpty(airLineName))
            {
                imgFromDB = Utils.GetPreviewImageFromDB(HttpContext.Current, null, null, airLineName);
            }

            else if (!String.IsNullOrEmpty(flightNumber))
            {
                imgFromDB = Utils.GetPreviewImageFromDBFlight(HttpContext.Current, flightNumber);
            }

            // imgShowAirLineLogo.AlternateText = (String.Format(ConfigurationManager.AppSettings["NoImageAvailableLine1"], "airline"));
        }
    }
}