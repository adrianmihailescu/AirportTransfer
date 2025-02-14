using System;
using System.Collections.Specialized;
using System.ComponentModel.DataAnnotations;
using System.Web.DynamicData;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AirportTransfer
{
    public partial class TextField : System.Web.DynamicData.FieldTemplateUserControl
    {
        private const int MAX_DISPLAYLENGTH_IN_LIST = 25;

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
                formattedText += "- " + arrItemsSplit[0];

                for (int i = 1; i <= arrItemsSplit.Length - 1; i++)
                {
                    formattedText += "<br />- " + arrItemsSplit[i];
                }
            }

            return formattedText;
        }

        //public override string FieldValueString
        //{
        //    get
        //    {
        //        value = FormatFieldValueString(base.FieldValueString);
        //        return value;
        //    }
        //}

        public override string FieldValueString
        {
            get
            {
                string value = Utils.ReplaceCharCodesToChars(base.FieldValueString);

                return value;
            }
        }

        public string FieldValueStringToolTip()
        {
            return value.Replace("<br />- ", ". ").Replace("- ", ". ");
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
