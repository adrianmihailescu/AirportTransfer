﻿using System;

using System.Configuration;

using System.Collections.Specialized;
using System.ComponentModel.DataAnnotations;
using System.Web.DynamicData;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AirportTransfer
{
    public partial class ChildrenField : System.Web.DynamicData.FieldTemplateUserControl
    {
        private bool _allowNavigation = true;
        private string _navigateUrl;

        public string NavigateUrl
        {
            get
            {
                return _navigateUrl;
            }
            set
            {
                _navigateUrl = value;
            }
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

        protected void Page_Load(object sender, EventArgs e)
        {
            HyperLink1.Text = GetDisplayString();
        }

        protected string GetDisplayString()
        {
            string displayMessage = String.Format(ConfigurationManager.AppSettings["ForeignKeyView"], ChildrenColumn.ChildTable.DisplayName);

            return displayMessage;
        }

        protected string GetChildrenPath()
        {
            if (!AllowNavigation)
            {
                return null;
            }

            if (String.IsNullOrEmpty(NavigateUrl))
            {
                return ChildrenPath;
            }
            else
            {
                return BuildChildrenPath(NavigateUrl);
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
