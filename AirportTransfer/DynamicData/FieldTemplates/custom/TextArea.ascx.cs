﻿using System;
using System.Collections.Specialized;
using System.ComponentModel.DataAnnotations;
using System.Web.DynamicData;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AirportTransfer.DynamicData.FieldTemplates.custom
{
    public partial class TextAreaField : System.Web.DynamicData.FieldTemplateUserControl
    {
        private string value = "";

        private string FormatFieldValueString(string text)
        {
            string[] arrItemsSplit = text.Split(new string[] { "\n" }, StringSplitOptions.None);

            string formattedText = "";

            if (arrItemsSplit.Length == 1)
            {
                formattedText = arrItemsSplit[0];
            }

            else if (arrItemsSplit.Length > 1)
            {
                formattedText += arrItemsSplit[0];

                for (int i = 1; i <= arrItemsSplit.Length - 1; i++)
                {
                    formattedText += "<br />" + arrItemsSplit[i];
                }
            }

            return formattedText;
        }

        public override string FieldValueString
        {
            get
            {
                string value = FormatFieldValueString(Utils.ReplaceCharCodesToChars(base.FieldValueString));

                return value;
            }
        }

        public string FieldValueStringToolTip(string valoare)
        {
            return valoare.Replace("<br />- ", ". ").Replace("\n- ", ". ");
        }

        public override Control DataControl
        {
            get
            {
                return Literal1;
            }
        }

    }
}
