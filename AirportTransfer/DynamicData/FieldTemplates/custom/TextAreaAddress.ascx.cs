using System;
using System.Collections.Specialized;
using System.ComponentModel.DataAnnotations;
using System.Web.DynamicData;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AirportTransfer.DynamicData.FieldTemplates.custom
{
    public partial class TextAreaAddressField : System.Web.DynamicData.FieldTemplateUserControl
    {
        protected override void OnDataBinding(EventArgs e)
        {
            string url = FieldValueString;
            string googleMapsLink = "http://maps.google.com?q=";

            if (!url.StartsWith(googleMapsLink, StringComparison.OrdinalIgnoreCase))
            {
                url = googleMapsLink + url;
            }

            HyperLink2.NavigateUrl = url;
            HyperLink1.NavigateUrl = url;
        }

        public override string FieldValueString
        {
            get
            {
                string value = Utils.ReplaceCharCodesToChars(base.FieldValueString);

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
