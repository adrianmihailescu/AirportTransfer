using System;
using System.Collections.Specialized;
using System.ComponentModel.DataAnnotations;
using System.Web.DynamicData;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AirportTransfer
{
    public partial class Url_EditField : System.Web.DynamicData.FieldTemplateUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Column.MaxLength < 20)
            {
                TextBox1.Columns = Column.MaxLength;
            }
            TextBox1.ToolTip = Column.Description;

            SetUpValidator(RequiredFieldValidator1);
            SetUpValidator(RegularExpressionValidator1);
            SetUpValidator(DynamicValidator1);
        }

        protected override void OnDataBinding(EventArgs e)
        {
            base.OnDataBinding(e);
            if (Column.MaxLength > 0)
            {
                TextBox1.MaxLength = Math.Max(FieldValueEditString.Length, Column.MaxLength);
            }
        }

        //protected override void ExtractValues(IOrderedDictionary dictionary)
        //{
        //    dictionary[Column.Name] = ConvertEditedValue(TextBox1.Text);
        //}

        protected override void ExtractValues(IOrderedDictionary dictionary)
        {
            string strEditedValue = TextBox1.Text ?? "";

            dictionary[Column.Name] = Utils.ReplaceCharsToCharCodes(Convert.ToString(ConvertEditedValue(strEditedValue)));
        }

        public override Control DataControl
        {
            get
            {
                return TextBox1;
            }
        }

        public override string FieldValueEditString
        {
            get
            {
                object valueToDisplay = base.FieldValue;
                // object valueToDisplay = null;

                if (valueToDisplay != null)
                {
                    return Utils.ReplaceCharCodesToChars(valueToDisplay.ToString());
                }

                return ""; // format dates
            }
        }

    }
}
