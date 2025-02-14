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
    public partial class TextRatingField : System.Web.DynamicData.FieldTemplateUserControl
    {
        //private const int MAX_DISPLAYLENGTH_IN_LIST = 25;

        public string FieldValueStringToolTip()
        {
            string value = base.FieldValueString;
            return value;
        }

        public override string FieldValueString
        {
            get
            {
                string value = base.FieldValueString;
                
                string strToDisplay = "";

                // string strImagePath = MapPath("~/DynamicData/Content/Images/ui/single star.png");      

                // string strImagePath = "../../DynamicData/Content/Images/ui/star_full.png";
                string strImagePath = ConfigurationManager.AppSettings["ImagesRating"];

                if ((value != null) && (value != String.Empty))
                    {
                        int intValue = Convert.ToInt32(value);                  

                        for (int i = 0; i < intValue; i++)
                        {
                            strImagePath = strImagePath.Replace("\\", @"/");

                            strToDisplay += "<img src=\"" + strImagePath + "\" alt=\"*\" />";
                        }
                    }

                return strToDisplay; // strToDisplay;

                // return Utils.RemoveHtmlTagsFromString(strToDisplay); // strToDisplay;
            }
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
