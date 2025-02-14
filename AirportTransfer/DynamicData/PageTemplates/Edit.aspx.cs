using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web.DynamicData;
using System.Web.Routing;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.Expressions;

using AirportTransfer.db;
// using AirportTransfer.BusinessObjects;

using System.Configuration;

using System.Linq;

namespace AirportTransfer
{
    public partial class Edit : System.Web.UI.Page
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

        protected void Page_Load(object sender, EventArgs e)
        {
            Title = table.DisplayName;
            DetailsDataSource.Include = table.ForeignKeyColumnsNames;

            string i = String.Empty;


            ///////////////////////////

            if ((Request.QueryString["IDEmployee"] != null) || (Request.QueryString["IDAirLine"] != null))
            {
                string strType = table.Name.ToLower();

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
            }
        }

        protected void FormView1_ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            if (e.CommandName == DataControlCommands.CancelCommandName)
            {
                Response.Redirect(table.ListActionPath);
            }
        }

        protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            
            ShowMessageSuccess(showOperationResult, lblOperationResult, ConfigurationManager.AppSettings["TheRecordHasBeenChanged"], table.Name);

        }

        protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            if (table.Name.ToLower().Equals("airport"))
            {
                CheckForTheSameAirportCode(e);
            }

            if (table.Name.ToLower().Equals("airline"))
            {
                CheckForTheSameAirLineName(e);
            }

            else if (table.Name.ToLower() == "costcenter")
            {
                CheckForTheSameCostCenterEntity(e);
            }

            else if (table.Name.ToLower().Equals("delegation"))
            {
                // CheckForTheSameDelegationName(e);
                CheckForDelegationStartDateGreaterThanEndDate(e);
            }

            else if (table.Name.ToLower().Equals("taxicompany"))
            {
                CheckForTheSameTaxiCompanyName(e);
            }

            else if (table.Name.ToLower().Equals("taxibooking"))
            {
                CheckForTaxiBookingPickupAddressEqualsDropAddress(e);
                CheckForTaxiBookingPassengersListEqualsNumber(e);
                CheckForEmptyCurrencyWhenCostNotEmpty(e);
                CheckForEmptyCostWhenCurrencyNotEmpty(e);
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

        #region check

        /// <summary>
        /// checks for an existing airport code
        /// </summary>
        /// <param name="e"></param>
        protected void CheckForTheSameAirportCode(FormViewUpdateEventArgs e)
        {
            string addingValue = e.NewValues["Code"].ToString();
            string oldValue = e.OldValues["Code"].ToString();

            var foundAirport = (from a in context.Airport
                                where (a.Code == addingValue)
                                select new { a.Code }).FirstOrDefault();

            if (foundAirport != null)
            {
                if (!(addingValue.Equals(oldValue)))
                {
                    e.Cancel = true;

                    string strText = String.Format(ConfigurationManager.AppSettings["CantAddAirportWithTheSameCode"], foundAirport.Code);
                    ShowErrorMessage(lblOperationResult, strText);
                }
            }
        }

        /// <summary>
        /// checks for an existing airline name
        /// </summary>
        /// <param name="e"></param>
        protected void CheckForTheSameAirLineName(FormViewUpdateEventArgs e)
        {
            string addingValue = e.NewValues["Name"].ToString();
            string oldValue = e.OldValues["Name"].ToString();

            var founAirLine = (from a in context.AirLine
                                where (a.Name == addingValue)
                                select new { a.Name }).FirstOrDefault();

            if (founAirLine != null)
            {
                if (!(addingValue.Equals(oldValue)))
                {
                    e.Cancel = true;

                    string strText = String.Format(ConfigurationManager.AppSettings["CantAddAirLineWithTheSameName"], founAirLine.Name);
                    ShowErrorMessage(lblOperationResult, strText);
                }
            }
        }

        /// <summary>
        /// checks for an existing airport name
        /// </summary>
        /// <param name="e"></param>
        protected void CheckForTheSameAirportName(FormViewUpdateEventArgs e)
        {
            string addingValue = e.NewValues["Name"].ToString();
            string oldValue = e.OldValues["Name"].ToString();

            var foundAirport = (from a in context.Airport
                                where (a.Name == addingValue)
                                select new { a.Name }).FirstOrDefault();

            if (foundAirport != null)
            {
                if (!(addingValue.Equals(oldValue)))
                {
                    e.Cancel = true;

                    string strText = String.Format(ConfigurationManager.AppSettings["CantAddAirportWithTheSameName"], foundAirport.Name);
                    ShowErrorMessage(lblOperationResult, strText);
                }
            }
        }

        /// <summary>
        /// checks for an existing cost center name
        /// </summary>
        /// <param name="e"></param>
        protected void CheckForTheSameCostCenterEntity(FormViewUpdateEventArgs e)
        {
            string addingValueName = e.NewValues["Name"].ToString();
            string oldValueName = e.OldValues["Name"].ToString();

            string addingValueProjectCode = e.NewValues["ProjectCode"].ToString();
            string oldValueProjectCode = e.OldValues["ProjectCode"].ToString();

            string addingValueBusinessUnit = e.NewValues["BusinessUnit"].ToString();
            string oldValueBusinessUnit = e.OldValues["BusinessUnit"].ToString();

            var foundCostCenter = (from a in context.CostCenter
                                   where (a.Name == addingValueName && a.ProjectCode == addingValueProjectCode && a.BusinessUnit == addingValueBusinessUnit)
                                   select new { a.Name, a.ProjectCode, a.BusinessUnit }).FirstOrDefault();

            if (foundCostCenter != null)
            {
                if (!(
                    addingValueName.Equals(oldValueName)
                    && addingValueProjectCode.Equals(oldValueProjectCode)
                    && addingValueBusinessUnit.Equals(oldValueBusinessUnit)
                    ))
                {
                    e.Cancel = true;

                    string strText = String.Format(ConfigurationManager.AppSettings["CantAddCostCenterWithTheSameEntity"], foundCostCenter.Name, foundCostCenter.ProjectCode, foundCostCenter.BusinessUnit);
                    ShowErrorMessage(lblOperationResult, strText);
                }
            }
        }

        /// <summary>
        /// checks for an existing cost center name
        /// </summary>
        /// <param name="e"></param>
        protected void CheckForTheSameDelegationName(FormViewUpdateEventArgs e)
        {
            string addingValue = e.NewValues["Name"].ToString();
            string oldValue = e.OldValues["Name"].ToString();

            var foundDelegation = (from a in context.Delegation
                                   where (a.Name == addingValue)
                                   select new { a.Name }).FirstOrDefault();

            if (foundDelegation != null)
            {
                if (!(addingValue.Equals(oldValue)))
                {
                    e.Cancel = true;

                    string strText = String.Format(ConfigurationManager.AppSettings["CantAddDelegationWithTheSameName"], foundDelegation.Name);
                    ShowErrorMessage(lblOperationResult, strText);
                }
            }
        }

        /// <summary>
        /// checks for an empty currency when the cost is not empty
        /// </summary>
        /// <param name="e"></param>
        protected void CheckForEmptyCostWhenCurrencyNotEmpty(FormViewUpdateEventArgs e)
        {
            string addingCurrency = Convert.ToString(e.NewValues["Currency"]);
            string addingCost = Convert.ToString(e.NewValues["Cost"]);

            if (!String.IsNullOrEmpty(addingCurrency))
            {
                if (String.IsNullOrEmpty(addingCost))
                {
                    e.Cancel = true;

                    string strText = String.Format(ConfigurationManager.AppSettings["CantAddDelegationEmptyCostWhenCurrencyNotEmpty"], addingCurrency);
                    ShowErrorMessage(lblOperationResult, strText);
                }
            }
        }

        /// <summary>
        /// checks for an empty cost when the currency is not empty
        /// </summary>
        /// <param name="e"></param>
        protected void CheckForEmptyCurrencyWhenCostNotEmpty(FormViewUpdateEventArgs e)
        {
            string addingCurrency = Convert.ToString(e.NewValues["Currency"]);
            string addingCost = Convert.ToString(e.NewValues["Cost"]);

            if (!String.IsNullOrEmpty(addingCost))
            {
                if (String.IsNullOrEmpty(addingCurrency))
                {
                    e.Cancel = true;

                    string strText = String.Format(ConfigurationManager.AppSettings["CantAddDelegationEmptyCurrencyWhenCostNotEmpty"], addingCost);
                    ShowErrorMessage(lblOperationResult, strText);
                }
            }
        }

        /// <summary>
        /// checks for a StartDate greater than EndDate
        /// </summary>
        /// <param name="e"></param>
        protected void CheckForDelegationStartDateGreaterThanEndDate(FormViewUpdateEventArgs e)
        {
            DateTime addingStartDate = Convert.ToDateTime(e.NewValues["StartDate"]);
            DateTime addingEndDate = Convert.ToDateTime(e.NewValues["EndDate"]);

            if (addingStartDate > addingEndDate)
            {
                e.Cancel = true;

                string strText = String.Format(ConfigurationManager.AppSettings["CantAddDelegationStartDateGreaterThanEndDate"], Utils.FormatDateTime(addingStartDate), Utils.FormatDateTime(addingEndDate));
                ShowErrorMessage(lblOperationResult, strText);
            }
        }

        /// <summary>
        /// checks for a pickup address the same with the drop address
        /// </summary>
        /// <param name="e"></param>
        protected void CheckForTaxiBookingPickupAddressEqualsDropAddress(FormViewUpdateEventArgs e)
        {
            string addingPickupAddress = Convert.ToString(e.NewValues["PickupAddress"]);
            string addingDropAddress = Convert.ToString(e.NewValues["DropAddress"]);

            if (addingPickupAddress.Equals(addingDropAddress))
            {
                e.Cancel = true;

                string strText = String.Format(ConfigurationManager.AppSettings["CantAddTaxiBookingWithTheSamePickupAddressDropAddress"], addingPickupAddress);
                ShowErrorMessage(lblOperationResult, strText);
            }
        }

        /// <summary>
        /// checks for a specified number of persons different than the passengers list count
        /// </summary>
        /// <param name="e"></param>
        protected void CheckForTaxiBookingPassengersListEqualsNumber(FormViewUpdateEventArgs e)
        {
            int addingNumberOfPersons = Convert.ToInt32(e.NewValues["NumberOfPersons"]);
            string[] addingPassengersName = e.NewValues["PassengersName"].ToString().Split(new string[] { "\r\n" }, StringSplitOptions.None);
            int addingPassengersActualNumber = addingPassengersName.Length;

            if (addingNumberOfPersons != addingPassengersActualNumber)
            {
                e.Cancel = true;

                string strText = String.Format(ConfigurationManager.AppSettings["CantAddTaxiBookingWithActualPassengersCountDifferentThanList"], addingPassengersActualNumber, addingNumberOfPersons);
                ShowErrorMessage(lblOperationResult, strText);
            }
        }

        /// <summary>
        /// checks for an existing taxi company name
        /// </summary>
        /// <param name="e"></param>
        protected void CheckForTheSameTaxiCompanyName(FormViewUpdateEventArgs e)
        {
            string addingValue = e.NewValues["Name"].ToString();
            string oldValue = e.OldValues["Name"].ToString();

            var foundTaxiCompany = (from a in context.TaxiCompany
                                    where (a.Name == addingValue)
                                    select new { a.Name }).FirstOrDefault();

            if (foundTaxiCompany != null)
            {
                if (!(addingValue.Equals(oldValue)))
                {
                    e.Cancel = true;

                    string strText = String.Format(ConfigurationManager.AppSettings["CantAddTaxiCompanyWithTheSameName"], foundTaxiCompany.Name);
                    ShowErrorMessage(lblOperationResult, strText);
                }
            }
        }

        #endregion check
        
    }
}
