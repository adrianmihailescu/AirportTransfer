using System;
using System.ComponentModel.DataAnnotations;
using System.Web.DynamicData;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

using System.Collections;
using System.Drawing;

namespace AirportTransfer
{
    public partial class _Default : System.Web.UI.Page
    {
        protected MetaTable table;

        #region calendar

        /// <summary>
        /// returns the number of rows in grid
        /// </summary>
        /// <returns></returns>
        protected int GetNumberOfRowsInGrid()
        {
            return CheckIfDelegationsAreScheduledForToday(Calendar1.SelectedDate);
        }

        /// <summary>
        /// checks if an user has books scheduled to be returned for a specific date
        /// </summary>
        /// <param name="ImgId"></param>
        /// <returns></returns>
        protected int CheckIfDelegationsAreScheduledForToday(DateTime data)
        {
            // setez valorile parametrilor
            DateTime selectedDateValue = data;

            ArrayList alListaParametri = new ArrayList();
            alListaParametri.Add("@data");

            ArrayList alValoriParametri = new ArrayList();
            alValoriParametri.Add(selectedDateValue);

            string strProcedureName = "GetScheduledDelegationsForToday";
            int operationResult = Utils.GenericOperation(strProcedureName, null, alListaParametri, alValoriParametri);

            return operationResult;
        }
        #endregion calendar

        #region page methods
        protected void Page_Load(object sender, EventArgs e)
        {
            // SqlDataSource1.SelectParameters["data"].DefaultValue = DateTime.Now.ToString();

            if (Calendar1.SelectedDate == DateTime.MinValue || Calendar1.SelectedDate == DateTime.MaxValue)
            {
                Calendar1.SelectedDate = DateTime.Now;
            }

        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            
        }

        #endregion page methods        

        /// <summary>
        /// gets the calendar's selected date
        /// </summary>
        /// <returns></returns>
        protected DateTime GetSelectedCalendarDate()
        {
            return Calendar1.SelectedDate;
        }
        
        protected void userCalendar_DayRender(object sender, DayRenderEventArgs e)
        {
            HyperLink lnkNavigateToDelegation = new HyperLink();
            string dateToRender = e.Day.Date.ToString(ConfigurationManager.AppSettings["DateFormatDisplay"]);
            DateTime selectedDate = e.Day.Date;

            try
            {
                if (e.Day.IsOtherMonth
                    && (Utils.GetDateFromDateTime(e.Day.Date) != Utils.GetDateFromDateTime(DateTime.Now))
                    ) // show only the current month's days
                {
                    e.Cell.Controls.Clear();
                }

                else
                {
                    // DateTime selectedDate = new DateTime(2013, 6, 25);

                    int result = CheckIfDelegationsAreScheduledForToday(selectedDate);

                    if (result > 0)
                    {
                        // Label b = new Label();

                        lnkNavigateToDelegation.NavigateUrl = String.Format(ConfigurationManager.AppSettings["DelegationsListEndDate"], dateToRender);
                        lnkNavigateToDelegation.Text = "<br />[" + result + "]";
                        lnkNavigateToDelegation.Target = "_blank";

                        e.Cell.Controls.Add(lnkNavigateToDelegation);

                        e.Cell.BackColor = Color.DarkOrange;
                        e.Cell.ForeColor = Color.White;
                        // b.Dispose();

                    }

                    else
                    {

                        lnkNavigateToDelegation.NavigateUrl = String.Format(ConfigurationManager.AppSettings["DelegationsListEndDate"], dateToRender);
                        lnkNavigateToDelegation.Text = e.Day.Date.Day.ToString();
                        lnkNavigateToDelegation.Target = "_blank";

                        e.Cell.Controls.Clear();
                        e.Cell.Controls.Add(lnkNavigateToDelegation);

                        Label lblToDisplay = new Label();
                        lblToDisplay.Text = "<br />&nbsp;";


                        e.Cell.Controls.Add(lblToDisplay);
                    }

                    if (e.Day.Date == DateTime.Now.Date)
                    {
                        e.Cell.Font.Bold = true;
                        e.Cell.BorderStyle = BorderStyle.Solid;
                        e.Cell.BorderColor = Color.Black;
                        e.Cell.BorderWidth = new Unit(1, UnitType.Pixel);
                    }

                    else
                    {
                        e.Cell.BorderStyle = BorderStyle.Solid;
                        e.Cell.BorderColor = Color.LightGray;
                        e.Cell.BorderWidth = new Unit(1, UnitType.Pixel);
                    }
                }
            }

            catch
            {
                throw;
            }

            finally
            {
                // dispose controls
                lnkNavigateToDelegation.Dispose();
            }
        }

        protected void btnExportToExcel_Click(object sender, EventArgs e)
        {
            Control controlToPrint = Calendar1;
            Utils.ExportGridToExcel(controlToPrint, ConfigurationManager.AppSettings["XlsExportName"], String.Format(ConfigurationManager.AppSettings["ExportListAt"], "Delegations List"));
        }

        
    }
}
