using System;
using System.Configuration;
using System.Collections.Specialized;
using System.ComponentModel.DataAnnotations;
using System.Web.DynamicData;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AirportTransfer.DynamicData.FieldTemplates.custom
{
    public partial class TextRating_EditField : System.Web.DynamicData.FieldTemplateUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected override void OnDataBinding(EventArgs e)
        {
            base.OnDataBinding(e);

            if (Mode == DataBoundControlMode.Edit && FieldValue != null)
            {
                string selectedValueString = FieldValueEditString;
                TextBox1.Text = selectedValueString;
                
            }
        }

        protected override void ExtractValues(IOrderedDictionary dictionary)
        {
            // dictionary[Column.Name] = ConvertEditedValue(ratingList.SelectedValue);
            dictionary[Column.Name] =  ConvertEditedValue(TextBox1.Text);
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
                    return valueToDisplay.ToString();
                }

                return ""; // format dates
            }
        }

        protected void lnkClearRating_Click(object sender, EventArgs e)
        {
            TextBox1.Text = null;
        }

    }
}
