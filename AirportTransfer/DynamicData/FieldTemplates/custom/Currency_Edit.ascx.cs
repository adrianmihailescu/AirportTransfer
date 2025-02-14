using System;

using System.Linq;

using System.Collections;
using System.Collections.Generic;

using System.Globalization;

using System.Collections.Specialized;
using System.ComponentModel.DataAnnotations;
using System.Web.DynamicData;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AirportTransfer.DynamicData.FieldTemplates.custom
{
    public partial class Currency_EditField : System.Web.DynamicData.FieldTemplateUserControl
    {
        private Type _enumType;

        protected void Page_Load(object sender, EventArgs e)
        {
            DropDownList1.ToolTip = Column.Description;

            if (DropDownList1.Items.Count == 0)
            {
                if (Mode == DataBoundControlMode.Insert || !Column.IsRequired)
                {
                    DropDownList1.Items.Add(new ListItem("", String.Empty));
                }
                // PopulateCurrenciesList(DropDownList1);
                PopulateCurrenciesList();

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

        protected void PopulateCurrenciesList()
        {
            foreach (CultureInfo item in CultureInfo.GetCultures(CultureTypes.SpecificCultures))
            {
                if (item.IsNeutralCulture != true)
                {
                    RegionInfo region = new RegionInfo(item.LCID);
                    string CurrencyName = region.CurrencyEnglishName;
                    string CurrencySymbol = region.ISOCurrencySymbol;
                    ListItem li = new ListItem(CurrencySymbol + " - " + CurrencyName, CurrencySymbol);
                    //** To check whether the Currency has already been added to the list or not ***//
                    if (DropDownList1.Items.Count > 0)
                    {
                        int i = 0;
                        foreach (ListItem Curr in DropDownList1.Items)
                        {
                            if (Curr.Value.Trim().ToLower() == li.Value.Trim().ToLower())
                            {
                                i++;
                            }
                        }
                        if (i == 0)
                        {
                            DropDownList1.Items.Add(li);
                        }
                    }
                    //***********************************************************************//
                    else
                    {
                        DropDownList1.Items.Add(li);
                    }
                }
            }
            //*************** To sort the dropdownlist items alphabatically *************//
            List<ListItem> listCopy = new List<ListItem>();
            foreach (ListItem item in DropDownList1.Items)
            {
                listCopy.Add(item);
            }
            DropDownList1.Items.Clear();
            foreach (ListItem item in listCopy.OrderBy(item => item.Text))
            {
                DropDownList1.Items.Add(item);
            }
            //**************************************************************************//
            // DropDownList1.Items.Insert(0, "Select");
        }

        protected override void OnDataBinding(EventArgs e)
        {
            base.OnDataBinding(e);

            if (Mode == DataBoundControlMode.Edit && FieldValue != null)
            {
                // string selectedValueString = GetSelectedValueString();
                string selectedValueString = FieldValueEditString;
                
                ListItem item = DropDownList1.Items.FindByValue(selectedValueString);
                if (item != null)
                {
                    DropDownList1.SelectedValue = selectedValueString;
                }
            }
        }

        private Type EnumType
        {
            get
            {
                if (_enumType == null)
                {
                    _enumType = Column.GetEnumType();
                }
                return _enumType;
            }
        }

        protected override void ExtractValues(IOrderedDictionary dictionary)
        {
            string value = DropDownList1.SelectedValue;
            if (value == String.Empty)
            {
                value = null;
            }
            dictionary[Column.Name] = ConvertEditedValue(value);
        }

        public override Control DataControl
        {
            get
            {
                return DropDownList1;
            }
        }

    }
}
