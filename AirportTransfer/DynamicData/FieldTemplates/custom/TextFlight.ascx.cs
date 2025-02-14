using System;
using System.Collections.Specialized;
using System.ComponentModel.DataAnnotations;
using System.Web.DynamicData;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;
using AirportTransfer.db;

namespace AirportTransfer.DynamicData.FieldTemplates.custom
{
    public partial class TextFlightField : System.Web.DynamicData.FieldTemplateUserControl
    {
        protected override void OnDataBinding(EventArgs e)
        {
            imgShowAirLineLogo.ImageUrl = "../../../UI/UserControls/DynamicImage.aspx?Flight=" + FieldValueString;
            string url = GetNavigateUrl();

            HyperLink2.NavigateUrl = url;
            HyperLink1.NavigateUrl = url;

        }

        private bool _allowNavigation = true;

        public string NavigateUrl
        {
            get;
            set;
        }

        public bool AllowNavigation
        {
            get
            {
                return _allowNavigation;
            }
            set
            {
                _allowNavigation = value;
            }
        }

        protected string GetNavigateUrl()
        {
            if (!AllowNavigation)
            {
                return null;
            }

            if (String.IsNullOrEmpty(NavigateUrl))
            {
                return ForeignKeyPath;
            }
            else
            {
                return BuildForeignKeyPath(NavigateUrl);
            }
        }

        public override string FieldValueString
        {
            get
            {
                Flight foundFlight = (Flight)base.FieldValue;
                string value = "";

                if (foundFlight != null)
                {
                    value = Utils.ReplaceCharCodesToChars(foundFlight.FlightNumber.ToString());
                }

                return value;
            }
        }

        public override Control DataControl
        {
            get
            {
                return HyperLink1;
            }
        }

    }
}
