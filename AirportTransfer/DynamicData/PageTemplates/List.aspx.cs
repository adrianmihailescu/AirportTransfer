using System;
using System.Configuration;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web.DynamicData;
using System.Web.Routing;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.Expressions;

using System.Data;
using System.Data.SqlClient;

using System.IO;
using System.Drawing;
using System.Web;


using System.Linq;
using System.Net;
using System.Net.Mail;

using System.Text;

using AirportTransfer.db;
using System.Web.UI.HtmlControls;

namespace AirportTransfer
{
    public partial class List : System.Web.UI.Page
    {
        protected MetaTable table;

        int numberOfRowsInGrid = 0;

        #region page methods
        protected void Page_Init(object sender, EventArgs e)
        {
            table = DynamicDataRouteHandler.GetRequestMetaTable(Context);
            GridView1.SetMetaTable(table, table.GetColumnValuesFromRoute(Context));
           
            GridDataSource.EntityTypeFilter = table.EntityType.Name;
            
            if (table.PrimaryKeyColumns.Count > 0)
            {
                GridView1.Sort(table.PrimaryKeyColumns[0].Name, SortDirection.Descending); // sort after the first column of the table's primary key)
            }

        }

        protected void ApplyFilters(string queryString)
        {
            string paramSearch = "";

            if (Request.QueryString[queryString] != null)
            {
                paramSearch = Request.QueryString[queryString];
                GridDataSource.WhereParameters.Clear();

                GridDataSource.WhereParameters.Add(queryString, DbType.Int32, paramSearch);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Title = table.DisplayName;
            GridDataSource.Include = table.ForeignKeyColumnsNames;

            // GridView1.BottomPagerRow.Visible = true;

            // Disable various options if the table is readonly
            if (table.IsReadOnly)
            {
                GridView1.Columns[0].Visible = false;
                // InsertHyperLink.Visible = false;
                GridView1.EnablePersistedSelection = false;
            }

            string paramSearch = String.Empty;

            if (table.Name.ToLower() == "delegation")
            {
                ///////
                if (Request.QueryString["EndDate"] != null)
                {
                    paramSearch = Request.QueryString["EndDate"];
                    GridDataSource.WhereParameters.Clear();

                    GridDataSource.WhereParameters.Add("EndDate", DbType.DateTime, paramSearch);
                }
            }

            ApplyFilters("IDFlight");
            ApplyFilters("IDAirportFrom");
            ApplyFilters("IDAirportTo");
            ApplyFilters("IDAirline");
            ApplyFilters("IDCostCenter");
            ApplyFilters("IDEmployee");
            ApplyFilters("IDTaxiBooking");
            ApplyFilters("IDTaxiCompany");
            ApplyFilters("IDDelegation");
            // Utils.ShowBackLinkOnEntity(DynamicHyperLink2, table.Name);
        }

        protected void Label_PreRender(object sender, EventArgs e)
        {
            System.Web.UI.WebControls.Label label = (System.Web.UI.WebControls.Label)sender;
            DynamicFilter dynamicFilter = (DynamicFilter)label.FindControl("DynamicFilter");

            QueryableFilterUserControl fuc = dynamicFilter.FilterTemplate as QueryableFilterUserControl;
            if (fuc != null && fuc.FilterControl != null)
            {
                label.AssociatedControlID = fuc.FilterControl.GetUniqueIDRelativeTo(label);
            }
        }

        protected override void OnPreRenderComplete(EventArgs e)
        {
            RouteValueDictionary routeValues = new RouteValueDictionary(GridView1.GetDefaultValues());
            // InsertHyperLink.NavigateUrl = table.GetActionPath(PageAction.Insert, routeValues);
            InsertHyperLink.Text = "Add New " + table.Name;
            InsertHyperLink.NavigateUrl = "../../" + table.Name + "/Insert.aspx";

            string queryString = Request.QueryString.ToString();
            if (!String.IsNullOrEmpty(queryString))
            {
                InsertHyperLink.NavigateUrl += "?" + queryString;
            }

            base.OnPreRenderComplete(e);
        }

        protected void DynamicFilter_FilterChanged(object sender, EventArgs e)
        {
            GridView1.PageIndex = 0;
            GridDataSource.WhereParameters.Clear();
        }

        /// <summary>
        /// called when exporting the grid rows to excel
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnExportToExcel_Click(object sender, EventArgs e)
        {
            Control controlToPrint = GridView1;

            string listTitle = (table.Name.ToLower() == "taxicompany") ? "TaxiCompanies" : table.Name + "s";

            Utils.ExportGridToExcel(controlToPrint, ConfigurationManager.AppSettings["XlsExportName"], String.Format(ConfigurationManager.AppSettings["ExportListAt"], listTitle));
        }

        public override void VerifyRenderingInServerForm(Control control)
        {

        }        
        
        #endregion page methods

        #region grid methids
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Utils.GridView1_PageIndexChanging(GridView1, e);
        }

        protected void GridDataSource_Selected(object sender, EntityDataSourceSelectedEventArgs e)
        {
            numberOfRowsInGrid = e.TotalRowCount;
        }

        protected int GetNumberOfRowsInGrid()
        {
            return numberOfRowsInGrid;
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            Utils.SetGridRowHighlight(e);
        }
        #endregion grid methods
                     

    }
}
