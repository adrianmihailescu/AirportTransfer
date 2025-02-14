using System;

using System.Collections;

using System.Data;
using System.Data.SqlClient;

using System.Drawing;

using System.Configuration;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web;
using System.Web.DynamicData;
using System.Web.Routing;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.Expressions;

using System.Linq;

using System.IO;
using System.Net;
using System.Net.Mail;

using System.Web.UI.HtmlControls;
using System.Xml.Linq;

using AirportTransfer.db;
// using AirportTransfer.BusinessObjects;

namespace AirportTransfer
{
    public partial class Details : System.Web.UI.Page
    {
        protected MetaTable table;
        protected AirportTransferEntities context = new AirportTransferEntities();

        #region page methods
        protected void Page_Init(object sender, EventArgs e)
        {
            table = DynamicDataRouteHandler.GetRequestMetaTable(Context);

            FormView1.SetMetaTable(table);
            DetailsDataSource.EntityTypeFilter = table.EntityType.Name;

        }

        /// <summary>
        /// called when the page is loaded
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            Title = table.DisplayName;
            DetailsDataSource.Include = table.ForeignKeyColumnsNames;

            string i = String.Empty;
            string strType = table.Name.ToLower();

            // ((LinkButton)FormView1.FindControl("LinkButtonDelete")).OnClientClick = String.Format(ConfigurationManager.AppSettings["EntityDeleteConfirmation"], table.Name.ToLower());

            if ((table.Name.ToLower() == "employee")  || (table.Name.ToLower() == "airline")) // display the book preview only if we are viewing a book
            {
                if (strType == "employee")
                {
                    i = Request.QueryString["IDEmployee"];
                }

                else if (strType == "airline")
                {
                    i = Request.QueryString["IDAirLine"];
                }

                imgShowPreview.ImageUrl = String.Format(ConfigurationManager.AppSettings["HandlerImageFormat"], i, strType);
                imgShowPreview.AlternateText = (String.Format(ConfigurationManager.AppSettings["NoImageAvailableLine1"], table.Name.ToLower()));

                ///////
                int currentIndex = Convert.ToInt32(i);
            }
        }

        /// <summary>
        /// gets the default date parameter's value 03/13/2013
        /// </summary>
        /// <returns></returns>
        public DateTime GetDefaultParameterReportingValue()
        {
            if (SqlDataSource1.SelectParameters["data"].DefaultValue == null)
                return DateTime.Now;

            return Convert.ToDateTime(SqlDataSource1.SelectParameters["data"].DefaultValue);
        }       

        protected void FormView1_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            ShowMessageSuccess(showOperationResult, lblOperationResult, ConfigurationManager.AppSettings["TheRecordHasBeenDeleted"], table.Name);

        }

        protected void FormView1_ItemDeleting(object sender, FormViewDeleteEventArgs e)
        {
            if (table.Name.ToLower().Equals("lease"))
            {
                int strIDLease = Convert.ToInt32(Utils.GetStringValue(e.Keys["IDLease"]));

                int addingBookLeaseStock = Convert.ToInt32(e.Values["Copies"]);

                // get the values from joined tables
            }


        }
        #endregion page methods

        #region messages
        

        /// <summary>
        /// displays a success operation panel
        /// </summary>
        /// <param name="pnlToShow"></param>
        /// <param name="lblToShow"></param>
        /// <param name="strText"></param>
        /// <param name="tableName"></param>
        protected void ShowMessageSuccess(Panel pnlToShow, Label lblToShow, string strText, string tableName)
        {
            pnlToShow.CssClass = "divVisibleHeader";

            strText = String.Format(strText, tableName);
            ShowInformationMessage(lblToShow, strText);
        }

        /// <summary>
        /// shows an error message
        /// </summary>
        /// <param name="lblToShow"></param>
        /// <param name="strText"></param>
        protected void ShowErrorMessage(Label lblToShow, string strText)
        {
            lblToShow.ForeColor = System.Drawing.Color.Red;
            lblToShow.Text = strText;

            showOperationResult.CssClass = "divVisibleHeader";
            imgOperationResultInformation.CssClass = "divInvisibleHeaderSmall";
            imgOperationResultError.CssClass = "divVisibleHeaderSmall";
        }

        /// <summary>
        /// shows an information messaghe
        /// </summary>
        /// <param name="lblToShow"></param>
        /// <param name="strText"></param>
        protected void ShowInformationMessage(Label lblToShow, string strText)
        {
            lblToShow.ForeColor = System.Drawing.Color.Green;
            lblToShow.Text = strText;

            showOperationResult.CssClass = "divVisibleHeader";
            imgOperationResultInformation.CssClass = "divVisibleHeaderSmall";
            imgOperationResultError.CssClass = "divInvisibleHeaderSmall";
        }
        #endregion messages

        public override void VerifyRenderingInServerForm(Control control)
        {
            // base.VerifyRenderingInServerForm(control);
        }

        protected void lnkExportDetailsToExcel_Click(object sender, EventArgs e)
        {
            /*
            Control controlToPrint = FormView1.FindControl("pnlShowDinamicEntity");

            // PrintWebControl(controlToPrint);
            Utils.ExportGridToExcel(controlToPrint, ConfigurationManager.AppSettings["XlsExportName"], String.Format(ConfigurationManager.AppSettings["ExportDetails"], table.Name));
            */


        }
    }
}
