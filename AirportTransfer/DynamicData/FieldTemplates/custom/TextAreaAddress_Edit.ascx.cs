using System;
using System.Collections.Specialized;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AirportTransfer.DynamicData.FieldTemplates.custom
{
    public partial class TextAreaAddress_Edit : System.Web.DynamicData.FieldTemplateUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Column.MaxLength < 20)
            {
                TextBoxAddress.Columns = Column.MaxLength;
            }
            TextBoxAddress.ToolTip = Column.Description;
            
            SetUpValidator(RequiredFieldValidator1);
            SetUpValidator(RegularExpressionValidator1);
            SetUpValidator(DynamicValidator1);
        }

        protected override void OnDataBinding(EventArgs e)
        {
            base.OnDataBinding(e);
            if (Column.MaxLength > 0)
            {
                TextBoxAddress.MaxLength = Math.Max(FieldValueEditString.Length, Column.MaxLength);
            }
        }

        protected override void ExtractValues(IOrderedDictionary dictionary)
        {
            dictionary[Column.Name] = Utils.ReplaceCharsToCharCodes(ConvertEditedValue(TextBoxAddress.Text).ToString());
        }

        public override Control DataControl
        {
            get
            {
                return TextBoxAddress;
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
        ///////
    }
}