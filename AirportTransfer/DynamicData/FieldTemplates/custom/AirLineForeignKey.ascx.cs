using System;
using System.Collections.Specialized;
using System.ComponentModel.DataAnnotations;
using System.Web.DynamicData;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AirportTransfer
{
    public partial class AirLineForeignKeyField : System.Web.DynamicData.FieldTemplateUserControl
    {

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

        protected string GetDisplayString()
        {
            object value = FieldValue;

            if (value == null)
            {
                return Utils.ReplaceCharCodesToChars(FormatFieldValue(ForeignKeyColumn.GetForeignKeyString(Row)));
            }
            else
            {
                return Utils.ReplaceCharCodesToChars(FormatFieldValue(ForeignKeyColumn.ParentTable.GetDisplayString(value)));
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

        public override Control DataControl
        {
            get
            {
                return HyperLink1;
            }
        }

    }
}
