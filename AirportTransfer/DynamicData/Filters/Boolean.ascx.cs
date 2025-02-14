using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Linq.Expressions;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AirportTransfer
{
    public partial class BooleanFilter : System.Web.DynamicData.QueryableFilterUserControl
    {
        private const string NullValueString = "[null]";
        public override Control FilterControl
        {
            get
            {
                return pnlRadioValues;
            }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            if (!Column.ColumnType.Equals(typeof(bool)))
            {
                throw new InvalidOperationException(String.Format("A boolean filter was loaded for column '{0}' but the column has an incompatible type '{1}'.", Column.Name, Column.ColumnType));
            }
        }

        public override IQueryable GetQueryable(IQueryable source)
        {
            string selectedValue = "";
            
            if (radioBooleanValueAll.Checked)
                selectedValue = String.Empty;

            else if (radioBooleanValueNotSet.Checked)
                selectedValue = NullValueString;

            else if (radioBooleanValueYes.Checked)
                selectedValue = Boolean.TrueString;

            else if (radioBooleanValueNo.Checked)
                selectedValue = Boolean.FalseString;

            if (String.IsNullOrEmpty(selectedValue))
            {
                return source;
            }

            object value = selectedValue;
            if (selectedValue == NullValueString)
            {
                value = null;
            }
            if (DefaultValues != null)
            {
                DefaultValues[Column.Name] = value;
            }
            return ApplyEqualityFilter(source, Column.Name, value);
        }

        protected void radioBooleanValueAll_CheckedChanged(object sender, EventArgs e)
        {
            OnFilterChanged();
        }

        protected void radioBooleanValueYes_CheckedChanged(object sender, EventArgs e)
        {
            OnFilterChanged();
        }

        protected void radioBooleanValueNo_CheckedChanged(object sender, EventArgs e)
        {
            OnFilterChanged();
        }

        protected void radioBooleanValueNotSet_CheckedChanged(object sender, EventArgs e)
        {
            OnFilterChanged();
        }

    }
}
