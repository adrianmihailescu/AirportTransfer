using System;

using System.Data;
using System.Data.SqlClient;

using System.Collections;
using System.Collections.Generic;

using System.Linq;

using System.Web;

using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;

using System.Net.Mail;
using System.Configuration;

using AirportTransfer.db;

using System.Text.RegularExpressions;

// using AirportTransfer.BusinessObjects;

namespace AirportTransfer
{
    public class Utils
    {
        protected static AirportTransferEntities context = new AirportTransferEntities();
        protected static string connectionString = ConfigurationManager.ConnectionStrings["AirportTransferConnectionString"].ConnectionString;

        #region text formatting        
        /// <summary>
        /// replaces char codes with characters
        /// </summary>
        /// <param name="strValue"></param>
        /// <returns></returns>
        public static string ReplaceCharCodesToChars(string strValue)
        {
            string replacedString = strValue;

            if (!String.IsNullOrEmpty(strValue))
            {
                replacedString = ReplaceCharCodesToCharsTemp(replacedString, "#355", "ț");
                replacedString = ReplaceCharCodesToCharsTemp(replacedString, "#354", "Ţ");
                replacedString = ReplaceCharCodesToCharsTemp(replacedString, "#258", "Ă");
                replacedString = ReplaceCharCodesToCharsTemp(replacedString, "#259", "ă");
                replacedString = ReplaceCharCodesToCharsTemp(replacedString, "#194", "Â");
                replacedString = ReplaceCharCodesToCharsTemp(replacedString, "#226", "â");
                replacedString = ReplaceCharCodesToCharsTemp(replacedString, "#206", "Î");
                replacedString = ReplaceCharCodesToCharsTemp(replacedString, "#238", "î");
                replacedString = ReplaceCharCodesToCharsTemp(replacedString, "#194", "Â");
                replacedString = ReplaceCharCodesToCharsTemp(replacedString, "#350", "Ş");
                replacedString = ReplaceCharCodesToCharsTemp(replacedString, "#351", "ş");
                replacedString = ReplaceCharCodesToCharsTemp(replacedString, "#218", "Ș");
                replacedString = ReplaceCharCodesToCharsTemp(replacedString, "#219", "ș");
            }

            else
            {
                int s = 1;
            }

            return replacedString;
        }

        /// <summary>
        /// replaces char codes with characters
        /// </summary>
        /// <param name="strValue"></param>
        /// <param name="oldChar"></param>
        /// <param name="newChar"></param>
        /// <returns></returns>
        public static string ReplaceCharCodesToCharsTemp(string strValue, string oldChar, string newChar)
        {
            string result = "";
            result = strValue.Replace("&" + oldChar + ";", newChar);
            result = result.Replace("&amp;" + oldChar + ";", newChar);

            return result;
        }

        /// <summary>
        /// replaces characters with char odes
        /// </summary>
        /// <param name="strValue"></param>
        /// <returns></returns>
        public static string ReplaceCharsToCharCodes(string strValue)
        {
            string replacedString = "";

            if (!String.IsNullOrEmpty(strValue))
            {
                replacedString =
                    strValue
                    .Replace("ț", "&#355;")
                    .Replace("Ţ", "&#354;")
                    .Replace("Ă", "&#258;")
                    .Replace("ă", "&#259;")
                    .Replace("Â", "&#194;")
                    .Replace("â", "&#226;")
                    .Replace("Î", "&#206;")
                    .Replace("î", "&#238;")
                    .Replace("Â", "&#194;")
                    .Replace("Ş", "&#350;")
                    .Replace("ş", "&#351;")
                    .Replace("Ș", "&#218;")
                    .Replace("ș", "&#219;")
                ;
            }

            else
            {
                int s = 1;
            }

            return replacedString;
        }
        #endregion text formatting


        #region sql
        /// <summary>
        /// intoarce o comanda generica de tip SqlCommand
        /// </summary>
        /// <param name="connectionString"></param>
        /// <param name="strNumeProcedura"></param>
        /// <returns></returns>
        protected static SqlCommand GetSqlCommand(string connectionString, string strNumeProcedura)
        {
            /////////////////////////////////

            // Create a new data adapter based on the specified query.
            SqlConnection sqlConnection = new SqlConnection(connectionString);
            SqlCommand sqlCommand = new SqlCommand();
            try
            {
                sqlConnection.Open();

                sqlCommand = new SqlCommand(strNumeProcedura, sqlConnection);

                // transmit valorile parametrilor
                sqlCommand.CommandType = CommandType.StoredProcedure;
                sqlCommand.CommandText = strNumeProcedura;
                /////////////////////////////

                return sqlCommand;
            }

            catch
            {
                sqlCommand = new SqlCommand();
                return sqlCommand;
            }
        }

        /// <summary>
        /// generic method for add / insert / delete
        /// </summary>
        /// <param name="strNumeProcedura"></param>
        /// <param name="alListaParametri"></param>
        /// <param name="alValoriParametri"></param>
        public static int GenericOperation(string strNumeProcedura, SqlParameter outputParameter, ArrayList alListaParametri, ArrayList alValoriParametri)
        {
            SqlCommand sqlCommand = GetSqlCommand(connectionString, strNumeProcedura);

            /////////////
            int idMesajProcedura = 0;

            if (outputParameter != null)
            {
                outputParameter.Direction = ParameterDirection.Output;
                sqlCommand.Parameters.Add(outputParameter);
            }
            // adaug parametrii si valorile
            for (int i = 0; i < alListaParametri.Count; i++)
            {
                sqlCommand.Parameters.AddWithValue(alListaParametri[i].ToString(), alValoriParametri[i]);
            }

            try
            {
                idMesajProcedura = sqlCommand.ExecuteNonQuery();
                //////////////////////////

                int loggedErrorNumber;

                if (outputParameter != null)
                {
                    loggedErrorNumber = Convert.ToInt32(sqlCommand.Parameters["ErrorNumber"].Value);
                }

                else
                {
                    loggedErrorNumber = idMesajProcedura;
                }

                return loggedErrorNumber;
            }

            catch
            {
                // return idMesajProcedura;
                throw;
            }

            finally
            {
                if (sqlCommand.Connection.State == ConnectionState.Open)
                    sqlCommand.Connection.Close();
            }
        }
        #endregion sql



        #region grid methods
        /// <summary>
        /// changes a gridview page if not the last one or the first one
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public static void GridView1_PageIndexChanging(GridView gridViewToSet, GridViewPageEventArgs e)
        {
            int newPageIndex = e.NewPageIndex;
            int gridTotalPages = gridViewToSet.PageCount;

            if (newPageIndex <= gridTotalPages - 1)
            {
                e.Cancel = true;

                if (newPageIndex >= 0)
                {
                    gridViewToSet.PageIndex = e.NewPageIndex;
                    e.Cancel = true;
                }
            }
        }

        /// <summary>
        /// changes highlight / unhighlight on a row
        /// </summary>
        /// <param name="e"></param>
        public static void SetGridRowHighlight(System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("onMouseOver", ConfigurationManager.AppSettings["GridRowHighlight"]);
                e.Row.Attributes.Add("onMouseOut", ConfigurationManager.AppSettings["GridRowUnHighlight"]);
            }
        }

        /// <summary>
        /// builds the back link for an entity after inserting a new one
        /// </summary>
        /// <param name="DynamicHyperLinkBack"></param>
        /// <param name="tableName"></param>
        /// <param name="e"></param>
        public static void ShowBackLinkOnEntity(HyperLink DynamicHyperLinkBack, string tableName, FormViewInsertedEventArgs e)
        {
            /////

            DynamicHyperLinkBack.CssClass = "displayBlock";
            DynamicHyperLinkBack.Text = "back";

            DynamicHyperLinkBack.NavigateUrl = String.Format(ConfigurationManager.AppSettings["EntityNavigateBackUrl"], tableName);
            /////
        }

        /// <summary>
        /// builds the back link for an entity after inserting a new one
        /// </summary>
        /// <param name="DynamicHyperLinkBack"></param>
        /// <param name="tableName"></param>
        /// <param name="e"></param>
        public static void ShowBackLinkOnEntity(HyperLink DynamicHyperLinkBack, string tableName)
        {
            /////
            DynamicHyperLinkBack.CssClass = "displayBlock";
            DynamicHyperLinkBack.Text = "back";

            DynamicHyperLinkBack.NavigateUrl = String.Format(ConfigurationManager.AppSettings["EntityNavigateBackUrl"], tableName);
            /////
        }

        public static bool IsDateTimeValue(string strValue)
        {
            bool result = true;

            try
            {
                DateTime dtValue = Convert.ToDateTime(strValue);
                result = true;
            }

            catch (FormatException ex)
            {
                result = false;
            }

            return result;
        }

        /// <summary>
        /// exports a gridview to excel
        /// </summary>
        /// <param name="strTableName"></param>
        /// <param name="strFileName"></param>
        public static void ExportGridToExcel(Control gvToExport, string strFileName, string strReportTitle)
        {
            // bool b = IsDateTimeValue("2013-05-23");

            Table tblToExport = new Table();

            TableRow trImage; trImage = new TableRow();
            TableCell tcImage; tcImage = new TableCell();

            TableRow trGrid; trGrid = new TableRow();
            TableCell tcGrid; tcGrid = new TableCell();

            Image imgHeader = new Image();

            try
            {
                if (gvToExport is GridView)
                {
                    ((GridView)gvToExport).AllowPaging = false;
                    ((GridView)gvToExport).DataBind();
                }

                // BindGrid();

                imgHeader.ImageUrl = HttpContext.Current.Server.MapPath(ConfigurationManager.AppSettings["EndavaLogo"]); imgHeader.ID = "imgHeader";

                System.Drawing.Image imgToAdd = System.Drawing.Image.FromFile(imgHeader.ImageUrl);

                Unit width = new Unit(imgToAdd.Width, UnitType.Pixel);
                Unit height = new Unit(imgToAdd.Height, UnitType.Pixel);

                tcImage.Width = width;
                tcImage.Height = height;

                // add header image
                tcImage.Controls.Add(imgHeader);

                trImage.Cells.Add(tcImage);
                tblToExport.Rows.Add(trImage);

                tcGrid.Controls.Add(gvToExport);
                trGrid.Cells.Add(tcGrid);
                tblToExport.Rows.Add(trGrid);

                // add date of generation
                Label lblGeneratedAt = new Label();
                lblGeneratedAt.Text = strReportTitle + " " + DateTime.Now.ToString(ConfigurationManager.AppSettings["DateFormatDisplayExcel"]);

                tcImage = new TableCell();
                tcImage.HorizontalAlign = HorizontalAlign.Center;
                tcImage.Font.Bold = true;
                tcImage.Controls.Add(lblGeneratedAt);

                //////// 
                trImage = new TableRow();
                trImage.Cells.Add(tcImage);
                tblToExport.Rows.Add(trImage);

                tcGrid.Controls.Add(gvToExport);
                trGrid.Cells.Add(tcGrid);
                tblToExport.Rows.Add(trGrid);

                PrepareGridViewForExport(tblToExport);

                HttpContext.Current.Response.ClearContent();
                HttpContext.Current.Response.ContentType = ConfigurationManager.AppSettings["ExcelReportFormat"];
                // HttpContext.Current.Response.ContentType = "application/vnd.xls";
                HttpContext.Current.Response.AddHeader("content-disposition", String.Format(ConfigurationManager.AppSettings["ExcelReportAttachment"], strFileName));
                // HttpContext.Current.Response.Charset = "";

                HttpContext.Current.Response.ContentEncoding = System.Text.Encoding.Unicode;
                HttpContext.Current.Response.BinaryWrite(System.Text.Encoding.Unicode.GetPreamble());
                
                using (StringWriter stringWriter = new StringWriter())
                {
                    HtmlTextWriter htmlWriter = new HtmlTextWriter(stringWriter);
                    tblToExport.RenderControl(htmlWriter);
                    HttpContext.Current.Response.Write(stringWriter.ToString());
                    HttpContext.Current.Response.End();
                    // HttpContext.Current.ApplicationInstance.CompleteRequest();
                }

            }

            catch (System.Threading.ThreadAbortException ex)
            {
            }

            catch (Exception ex)
            {
                throw;
            }

            finally
            {
                // cleanup code
                tcGrid.Dispose();
                trGrid.Dispose();
                tcImage.Dispose();
                trImage.Dispose();
                tblToExport.Dispose();
                imgHeader.Dispose();

            }
        }

        /// <summary>
        /// prepare a control for exporting to excel
        /// </summary>
        /// <param name="gridView"></param>
        public static void PrepareGridViewForExport(Control controlToExport)
        {
            for (int i = 0; i < controlToExport.Controls.Count; i++)
            {
                //Get the control

                Control currentControl = controlToExport.Controls[i];

                if (currentControl is LinkButton)
                {
                    controlToExport.Controls.Remove(currentControl);
                    controlToExport.Controls.AddAt(i, new LiteralControl((currentControl as LinkButton).Text));
                }

                else if ((currentControl is Image) && !(currentControl is ImageButton))
                {
                    // RenderGridViewControlToExport(controlToExport, i, currentControl);

                    controlToExport.Controls.Remove(currentControl);

                    Image imgToAdd = (Image)currentControl;
                    // imgToAdd.ImageUrl = "file://" + HttpContext.Current.Server.MapPath("~/DynamicData/Content/Images/" + ((Image)currentControl).ImageUrl);
                    string tempPath = ((Image)currentControl).ImageUrl;

                    if (!String.IsNullOrEmpty(tempPath))
                    {
                        if (tempPath.Contains("~/"))
                        {
                            imgToAdd.ImageUrl = HttpContext.Current.Server.MapPath(tempPath);
                        }

                        imgToAdd.ImageUrl = "file://" + ((Image)currentControl).ImageUrl.Replace("\\", "/");

                        controlToExport.Controls.AddAt(i, imgToAdd);
                    }
                }

                else if (currentControl is ImageButton)
                {
                    controlToExport.Controls.Remove(currentControl);
                    controlToExport.Controls.AddAt(i, new LiteralControl((currentControl as ImageButton).AlternateText));

                    ImageButton imgToAdd = (ImageButton)currentControl;
                    imgToAdd.ImageUrl = HttpContext.Current.Server.MapPath(ConfigurationManager.AppSettings["ImagesFolder"].Replace("../../", "~/") + ((ImageButton)currentControl).ImageUrl);
                }

                else if (currentControl is HyperLink)
                {
                    controlToExport.Controls.Remove(currentControl);
                    controlToExport.Controls.AddAt(i, new LiteralControl((currentControl as HyperLink).Text));
                }

                else if (currentControl is Label)
                {
                    controlToExport.Controls.Remove(currentControl);

                    string currentLabelText = (currentControl as Label).Text;
                    controlToExport.Controls.AddAt(i, new LiteralControl((currentControl as Label).Text));
                }

                else if (currentControl is DropDownList)
                {
                    controlToExport.Controls.Remove(currentControl);
                    controlToExport.Controls.AddAt(i, (new LiteralControl((currentControl as DropDownList).SelectedItem.Text)));
                }

                else if (currentControl is CheckBox)
                {
                    controlToExport.Controls.Remove(currentControl);
                    controlToExport.Controls.AddAt(i, new LiteralControl((currentControl as CheckBox).Checked ? "True" : "False"));
                }

                RenderGridViewIfControlIsDynamic(controlToExport
                    , i
                    , currentControl
                    , "dynamicdata_fieldtemplates_datetime_ascx"
                    , "dynamicdata_fieldtemplates_boolean_ascx"
                    , "dynamicdata_fieldtemplates_custom_picture_ascx"
                    , "dynamicdata_fieldtemplates_custom_taxireservationmade_ascx"
                    , "dynamicdata_fieldtemplates_custom_textrating_ascx"
                    , "dynamicdata_fieldtemplates_custom_textairline_ascx"
                    );

                if (currentControl.HasControls())
                {
                    // if there is any child controls, call this method to prepare for export
                    PrepareGridViewForExport(currentControl);
                }
            }
        }
        
        /// <summary>
        /// 
        /// </summary>
        /// <param name="strName"></param>
        /// <param name="controlToExport"></param>
        /// <param name="i"></param>
        /// <param name="currentControl"></param>
        /// <param name="dynamicControlsList"></param>
        private static void RenderGridViewIfControlIsDynamic(Control controlToExport, int i, Control currentControl, params string[] dynamicControlsList)
        {
            foreach (string c in dynamicControlsList)
            {
                if (currentControl.GetType().Name.Equals(c)) // checks if the image is an image (picture) field
                {
                    RenderGridViewControlToExport(controlToExport, i, currentControl);
                }
            }
        }

        /// <summary>
        /// removes unnecessary characters from an image path
        /// </summary>
        /// <param name="strText"></param>
        /// <returns></returns>
        private static string SanitizeTextPath(string strText)
        {
            string tempText = "";
            
            tempText = strText
                .Replace("../../", "~/")
                .Replace("../", "~/")
                .Replace("\"", "")
                .Replace(@"Employee\", @"")
                .Replace(@"Delegation\", @"")
                .Replace(@"Flight\", @"")
                .Replace(@"Airport\", @"")
                .Replace(@"AirLine\", @"")
                .Replace(@"CostCenter\", @"")
                .Replace(@"TaxiCompany\", @"")
                .Replace(@"TaxiBooking\", @"")
                ;

            if (strText.IndexOf("class=") > 0)
            {
                tempText = tempText.Substring(0, tempText.IndexOf("class=") - 1);
            }

            if (strText.IndexOf("id=") > 0)
            {
                tempText = tempText.Substring(0, tempText.IndexOf("id=") - 1);
            }

            return tempText;
        }

        /// <summary>
        /// renders a custom gridview control for export
        /// </summary>
        /// <param name="gridView"></param>
        /// <param name="i"></param>
        /// <param name="currentControl"></param>
        private static void RenderGridViewControlToExport(Control gridView, int i, Control currentControl)
        {
            Control controlToAdd = currentControl.FindControl("Literal1");

            if (controlToAdd == null)
                controlToAdd = currentControl.FindControl("HyperLink1");

            Label lblToDisplay = new Label(); lblToDisplay.Width = Unit.Pixel(100);

            try
            {

                if (controlToAdd != null)
                {
                    string tempText = "";

                    if (controlToAdd is Literal)
                    {
                        tempText = ((Literal)controlToAdd).Text;
                    }

                    else if (controlToAdd is HyperLink)
                    {
                        tempText = ((HyperLink)controlToAdd).Text;
                    }

                    if (controlToAdd is Label)
                    {
                        tempText = ((Label)controlToAdd).Text;
                    }

                    //string textWithoutAlt = "";
                    string text = "";

                    if (tempText != String.Empty)
                    {
                        string[] imagesInList = tempText.Split(new string[] { "<img src=" }, StringSplitOptions.None);

                        if (imagesInList.Length > 0)
                        {

                            foreach (string currentImage in imagesInList)
                            {
                                if (!String.IsNullOrEmpty(currentImage))
                                {
                                    if (currentImage.Contains("/Images/"))
                                    {
                                        text = currentImage.Substring(currentImage.IndexOf("<img src=") + 5).Replace("\" />", ""); // get image source

                                        if (text.IndexOf("alt=") > 0)
                                        {
                                            lblToDisplay.Text = (imagesInList.Length - 1).ToString();
                                        }

                                        else
                                        {
                                            lblToDisplay.Text += "<img border=\"0\" src=\"" + SanitizeTextPath(HttpContext.Current.Server.MapPath(SanitizeTextPath(text))) + "\" />";                                            
                                        }
                                    }

                                    else
                                    {
                                        text = currentImage.Trim(); // get image source
                                        lblToDisplay.Text = text;

                                    }

                                    gridView.Controls.Remove(currentControl);
                                    gridView.Controls.AddAt(i, lblToDisplay);
                                }
                            }
                        }
                    }
                }
            }

            catch (Exception ex)
            {
                throw ex;
            }

            finally
            {
                lblToDisplay.Dispose();
                controlToAdd.Dispose();
            }
        }
        #endregion grid methods

        #region collections

        /// <summary>
        /// checks if an item is in a listbox values
        /// </summary>
        /// <param name="id"></param>
        /// <param name="dlToSearch"></param>
        /// <returns></returns>
        public static bool IsIdInListValues(string id, DropDownList dlToSearch)
        {
            bool result = false;

            for (int i = 0; i < dlToSearch.Items.Count; i++)
            {
                if (dlToSearch.Items[i].Value.Equals(id))
                {
                    result = true;
                }
            }

            return result;
        }

        /// <summary>
        /// sorts a list box alphabetically
        /// </summary>
        /// <param name="lstToSort"></param>
        /// <returns></returns>
        public static DropDownList SortedListBox(DropDownList lstToSort)
        {
            List<ListItem> t = new List<ListItem>();
            List<string> listWithValues = new List<string>();

            Comparison<ListItem> compare = new Comparison<ListItem>(CompareListItems);
            foreach (ListItem lbItem in lstToSort.Items)
            {
                if (!listWithValues.Contains(lbItem.Text.ToLower())) // add only once a cost center name
                {
                    t.Add(lbItem);
                    listWithValues.Add(lbItem.Text.ToLower());
                }
            }

            t.Sort(compare);
            lstToSort.Items.Clear();
            lstToSort.Items.AddRange(t.ToArray().Distinct().ToArray());

            return lstToSort;

        }

        /// <summary>
        /// compares two list items
        /// </summary>
        /// <param name="liFirst"></param>
        /// <param name="liSecond"></param>
        /// <returns></returns>
        public static int CompareListItems(ListItem liFirst, ListItem liSecond)
        {
            return String.Compare(liFirst.Text.ToLower(), liSecond.Text.ToLower());
        }
        #endregion collections

        #region convert methods
        /// <summary>
        /// converts an object value to string
        /// </summary>
        /// <param name="valoare"></param>
        /// <returns></returns>
        public static string GetStringValue(object valoare)
        {
            return (valoare == null ? String.Empty : valoare.ToString());
        }

        /// <summary>
        /// converts an object value to DateTime
        /// </summary>
        /// <param name="valoare"></param>
        /// <returns></returns>
        public static string GetDateValue(object valoare)
        {
            return (valoare == null ? String.Empty : Convert.ToDateTime(valoare).ToString(ConfigurationManager.AppSettings["DateFormatDisplay"]));
        }

        /// <summary>
        /// formats a DateTimeValue to yyyy-MM-dd
        /// </summary>
        /// <param name="dtValue"></param>
        /// <returns></returns>
        public static string FormatDateTime(DateTime dtValue)
        {
            return dtValue.ToString(ConfigurationManager.AppSettings["DateFormatDisplay"]);
        }

        /// <summary>
        /// Gets the date value without hour min sec from a DateTime
        /// </summary>
        /// <param name="dtValue"></param>
        /// <returns></returns>
        public static DateTime GetDateFromDateTime(DateTime dtValue)
        {
            DateTime result = new DateTime(dtValue.Year, dtValue.Month, dtValue.Day);
            return result;
        }

        #endregion convert methods

        #region image
        /// <summary>
        /// gets the preview image of a given id in the database
        /// </summary>
        /// <param name="context"></param>
        /// <param name="imgId"></param>
        /// <returns></returns>
        public static System.Drawing.Image GetPreviewImageFromDB(HttpContext context, int? imgId, string type, string airlineName)
        {
            MemoryStream memoryStream = new MemoryStream();
            System.Drawing.Image imgFromDB;
            try
            {
                if (imgId != null)
                {
                    memoryStream = new MemoryStream(Utils.GetImageMemoryStreamFromDB(imgId, type, null), false);
                }

                else
                {
                    memoryStream = new MemoryStream(Utils.GetImageMemoryStreamFromDB(null, null, airlineName), false);
                }

                imgFromDB = System.Drawing.Image.FromStream(memoryStream);

                if (memoryStream.Length > 0)
                {
                    imgFromDB = System.Drawing.Image.FromStream(memoryStream);
                    // imgFromGB.Size = new System.Drawing.Size(100, 100);

                    imgFromDB.Save(context.Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);
                }

                return imgFromDB;
            }

            catch
            {
                imgFromDB = null; // the image could not be bound
                return imgFromDB;
            }

            finally
            {
                memoryStream.Dispose();
            }
        }

        /// <summary>
        /// gets the preview image of a given id in the database
        /// </summary>
        /// <param name="context"></param>
        /// <param name="imgId"></param>
        /// <returns></returns>
        public static System.Drawing.Image GetPreviewImageFromDBFlight(HttpContext context, string flightNumber)
        {
            MemoryStream memoryStream = new MemoryStream();
            System.Drawing.Image imgFromDB;
            try
            {
                if (!String.IsNullOrEmpty(flightNumber))
                {
                    memoryStream = new MemoryStream(Utils.GetImageMemoryStreamFromDBFlight(flightNumber), false);
                }

                imgFromDB = System.Drawing.Image.FromStream(memoryStream);

                if (memoryStream.Length > 0)
                {
                    imgFromDB = System.Drawing.Image.FromStream(memoryStream);
                    // imgFromGB.Size = new System.Drawing.Size(100, 100);

                    imgFromDB.Save(context.Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);
                }

                return imgFromDB;
            }

            catch
            {
                imgFromDB = null; // the image could not be bound
                return imgFromDB;
            }

            finally
            {
                memoryStream.Dispose();
            }
        }

        /// <summary>
        /// gets the memory stream representation of an image
        /// </summary>
        /// <param name="ImgId"></param>
        /// <returns></returns>
        public static byte[] GetImageMemoryStreamFromDB(int? ImgId, string type, string airLineName)
        {
            SqlConnection conn = null;
            SqlCommand cmd = new SqlCommand();

            byte[] ImageByteArray = new byte[] { };

            try
            {
                conn = new SqlConnection(
                    ConfigurationManager.ConnectionStrings["AirportTransferConnectionString"].ConnectionString);

                conn.Open();

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conn;
                cmd.CommandTimeout = 0;

                if (String.IsNullOrEmpty(airLineName))
                {
                    if (type == "employee")
                    {
                        cmd.CommandText = "GetEmployeePreviewImage";
                    }

                    else if (type == "airline")
                    {
                        cmd.CommandText = "GetAirLinePreviewImage";
                    }

                    cmd.Parameters.Add("@id", SqlDbType.Int, 0).Value = ImgId;
                }

                else if (ImgId == null && String.IsNullOrEmpty(type))
                {
                    cmd.CommandText = "GetAirLinePreviewImageByName";
                    cmd.Parameters.Add("@airline_name", SqlDbType.Text, 0).Value = airLineName;
                }

                SqlDataReader drTemp = cmd.ExecuteReader();
                if (drTemp.Read())
                {
                    if (drTemp["result"] != DBNull.Value)
                        ImageByteArray = (byte[])drTemp["result"];
                }

                if (!drTemp.IsClosed)
                {
                    drTemp.Close();
                }
                return ImageByteArray;
            }

            catch
            {
                return null;
            }

            finally
            {
                if (conn.State != ConnectionState.Closed)
                {
                    conn.Close();
                }

                /*
                conn.Dispose();
                 */
                cmd.Dispose();
            }
        }

        /// <summary>
        /// gets the memory stream representation of an image
        /// </summary>
        /// <param name="ImgId"></param>
        /// <returns></returns>
        public static byte[] GetImageMemoryStreamFromDBFlight(string flightNumber)
        {
            SqlConnection conn = null;
            SqlCommand cmd = new SqlCommand();

            byte[] ImageByteArray = new byte[] { };

            try
            {
                conn = new SqlConnection(
                    ConfigurationManager.ConnectionStrings["AirportTransferConnectionString"].ConnectionString);

                conn.Open();

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conn;
                cmd.CommandTimeout = 0;

                if (!String.IsNullOrEmpty(flightNumber))
                {
                    cmd.CommandText = "GetAirLinePreviewImageByFlightNumber";
                    cmd.Parameters.Add("@flight_number", SqlDbType.Text, 0).Value = flightNumber;
                }

                SqlDataReader drTemp = cmd.ExecuteReader();
                if (drTemp.Read())
                {
                    if (drTemp["result"] != DBNull.Value)
                        ImageByteArray = (byte[])drTemp["result"];
                }

                if (!drTemp.IsClosed)
                {
                    drTemp.Close();
                }
                return ImageByteArray;
            }

            catch (Exception ex)
            {
                return null;
            }

            finally
            {
                if (conn.State != ConnectionState.Closed)
                {
                    conn.Close();
                }

                /*
                conn.Dispose();
                 */
                cmd.Dispose();
            }
        }

        #endregion image

    }
}