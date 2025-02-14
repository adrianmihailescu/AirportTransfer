using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web.DynamicData;
using System.Web.Routing;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.Expressions;

using System.Linq;

using System.IO;
using System.Net;
using System.Net.Mail;

using System.Configuration;

using AirportTransfer.db;
// using AirportTransfer.BusinessObjects;


namespace AirportTransfer
{
    public partial class Insert : System.Web.UI.Page
    {
        protected MetaTable table;

        protected AirportTransferEntities context = new AirportTransferEntities();

        #region page methods
        protected void Page_Init(object sender, EventArgs e)
        {
            table = DynamicDataRouteHandler.GetRequestMetaTable(Context);
            FormView1.SetMetaTable(table, table.GetColumnValuesFromRoute(Context));
            DetailsDataSource.EntityTypeFilter = table.EntityType.Name;

            
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Title = table.DisplayName;
            // DynamicHyperLinkBack.CssClass = "displayNone";

        }

        protected void FormView1_ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            if (e.CommandName == DataControlCommands.CancelCommandName)
            {
                Response.Redirect(table.ListActionPath);
            }
        }

        /// <summary>
        /// executed after the insert statement
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            string strText = String.Empty;

            ShowMessageSuccess(showOperationResult, lblOperationResult, ConfigurationManager.AppSettings["TheNewRecordHasBeenAdded"], table.Name);
            /////
            Utils.ShowBackLinkOnEntity(DynamicHyperLinkBack, table.Name, e);
        }

        protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            if (table.Name.ToLower().Equals("airport"))
            {
                CheckForTheSameAirportCode(e);
            }

            else if (table.Name.ToLower().Equals("airline"))
            {
                CheckForTheSameAirLineName(e);
            }

            else if (table.Name.ToLower() == "costcenter")
            {
                // CheckForTheSameCostCenterName(e);
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

        

        #region check

        /// <summary>
        /// checks for an existing airport code
        /// </summary>
        /// <param name="e"></param>
        protected void CheckForTheSameAirportCode(FormViewInsertEventArgs e)
        {
            string addingValue = e.Values["Code"].ToString();

            var foundAirport = (from a in context.Airport
                     where (a.Code == addingValue)
                     select new { a.Code }).FirstOrDefault();

            if (foundAirport != null)
            {
                e.Cancel = true;

                string strText = String.Format(ConfigurationManager.AppSettings["CantAddAirportWithTheSameCode"], foundAirport.Code);
                ShowErrorMessage(lblOperationResult, strText);
            }
        }

        /// <summary>
        /// checks for an existing airline name
        /// </summary>
        /// <param name="e"></param>
        protected void CheckForTheSameAirLineName(FormViewInsertEventArgs e)
        {
            string addingValue = e.Values["Name"].ToString();

            var foundAirLine = (from a in context.AirLine
                                where (a.Name == addingValue)
                                select new { a.Name }).FirstOrDefault();

            if (foundAirLine != null)
            {
                e.Cancel = true;

                string strText = String.Format(ConfigurationManager.AppSettings["CantAddAirLineWithTheSameName"], foundAirLine.Name);
                ShowErrorMessage(lblOperationResult, strText);
            }
        }

        /// <summary>
        /// checks for an existing cost center name
        /// </summary>
        /// <param name="e"></param>
        protected void CheckForTheSameCostCenterEntity(FormViewInsertEventArgs e)
        {
            string addingValueName = e.Values["Name"].ToString();

            string addingValueProjectCode = e.Values["ProjectCode"].ToString();
            string addingValueBusinessUnit = e.Values["BusinessUnit"].ToString();

            var foundCostCenter = (from a in context.CostCenter
                                   where (a.Name == addingValueName && a.ProjectCode == addingValueProjectCode && a.BusinessUnit == addingValueBusinessUnit)
                                   select new { a.Name, a.ProjectCode, a.BusinessUnit }).FirstOrDefault();

            if (foundCostCenter != null)
            {
                    e.Cancel = true;

                    string strText = String.Format(ConfigurationManager.AppSettings["CantAddCostCenterWithTheSameEntity"], foundCostCenter.Name, foundCostCenter.ProjectCode, foundCostCenter.BusinessUnit);
                    ShowErrorMessage(lblOperationResult, strText);
            }
        }

        /// <summary>
        /// checks for an existing cost center name
        /// </summary>
        /// <param name="e"></param>
        protected void CheckForTheSameDelegationName(FormViewInsertEventArgs e)
        {
            string addingValue = e.Values["Name"].ToString();

            var foundDelegation = (from a in context.Delegation
                                   where (a.Name == addingValue)
                                   select new { a.Name }).FirstOrDefault();

            if (foundDelegation != null)
            {
                e.Cancel = true;

                string strText = String.Format(ConfigurationManager.AppSettings["CantAddDelegationWithTheSameName"], foundDelegation.Name);
                ShowErrorMessage(lblOperationResult, strText);
            }
        }

        /// <summary>
        /// checks for a StartDate greater than EndDate
        /// </summary>
        /// <param name="e"></param>
        protected void CheckForDelegationStartDateGreaterThanEndDate(FormViewInsertEventArgs e)
        {
            DateTime addingStartDate = Convert.ToDateTime(e.Values["StartDate"]);
            DateTime addingEndDate = Convert.ToDateTime(e.Values["EndDate"]);

            if (addingStartDate > addingEndDate)
            {
                e.Cancel = true;

                string strText = String.Format(ConfigurationManager.AppSettings["CantAddDelegationStartDateGreaterThanEndDate"], Utils.FormatDateTime(addingStartDate), Utils.FormatDateTime(addingEndDate));
                ShowErrorMessage(lblOperationResult, strText);
            }
        }

        /// <summary>
        /// checks for an empty currency when the cost is not empty
        /// </summary>
        /// <param name="e"></param>
        protected void CheckForEmptyCostWhenCurrencyNotEmpty(FormViewInsertEventArgs e)
        {
            string addingCurrency = Convert.ToString(e.Values["Currency"]);
            string addingCost = Convert.ToString(e.Values["Cost"]);

            if (!String.IsNullOrEmpty(addingCurrency))
            {
                if (String.IsNullOrEmpty(addingCost))
                {
                    e.Cancel = true;

                    string strText = String.Format(ConfigurationManager.AppSettings["CantAddDelegationEmptyCurrencyWhenCostNotEmpty"], addingCurrency);
                    ShowErrorMessage(lblOperationResult, strText);
                }
            }
        }

        /// <summary>
        /// checks for an empty cost when the currency is not empty
        /// </summary>
        /// <param name="e"></param>
        protected void CheckForEmptyCurrencyWhenCostNotEmpty(FormViewInsertEventArgs e)
        {
            string addingCurrency = Convert.ToString(e.Values["Currency"]);
            string addingCost = Convert.ToString(e.Values["Cost"]);

            if (!String.IsNullOrEmpty(addingCost))
            {
                if (String.IsNullOrEmpty(addingCurrency))
                {
                    e.Cancel = true;

                    string strText = String.Format(ConfigurationManager.AppSettings["CantAddDelegationEmptyCostWhenCurrencyNotEmpty"], addingCost);
                    ShowErrorMessage(lblOperationResult, strText);
                }
            }
        }

        /// <summary>
        /// checks for a pickup address the same with the drop address
        /// </summary>
        /// <param name="e"></param>
        protected void CheckForTaxiBookingPickupAddressEqualsDropAddress(FormViewInsertEventArgs e)
        {
            string addingPickupAddress = Convert.ToString(e.Values["PickupAddress"]);
            string addingDropAddress = Convert.ToString(e.Values["DropAddress"]);

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
        protected void CheckForTaxiBookingPassengersListEqualsNumber(FormViewInsertEventArgs e)
        {
            int addingNumberOfPersons = Convert.ToInt32(e.Values["NumberOfPersons"]);
            string[] addingPassengersName = e.Values["PassengersName"].ToString().Split(new string[] { "\r\n" }, StringSplitOptions.None);
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
        protected void CheckForTheSameTaxiCompanyName(FormViewInsertEventArgs e)
        {
            string addingValue = e.Values["Name"].ToString();

            var foundTaxiCompany = (from a in context.TaxiCompany
                               where (a.Name == addingValue)
                               select new { a.Name }).FirstOrDefault();

            if (foundTaxiCompany != null)
            {
                e.Cancel = true;

                string strText = String.Format(ConfigurationManager.AppSettings["CantAddTaxiCompanyWithTheSameName"], foundTaxiCompany.Name);
                ShowErrorMessage(lblOperationResult, strText);
            }
        }

        #endregion check

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

        
    }
}
