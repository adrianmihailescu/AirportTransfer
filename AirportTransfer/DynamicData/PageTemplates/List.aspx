<%@ Page Language="C#" MasterPageFile="~/Site.master" CodeBehind="List.aspx.cs" Inherits="AirportTransfer.List" EnableEventValidation="false" %>
<%@ Register src="~/UI/UserControls/GridViewPager.ascx" tagname="GridViewPager" tagprefix="asp" %>

<%@ Register src="../../UI/UserControls/QuickLinks.ascx" tagname="QuickLinks" tagprefix="uc" %>



<asp:Content ID="headContent" ContentPlaceHolderID="head" Runat="Server">

            <link rel="Stylesheet" type="text/css" href="../../UI/Css/Site.css" />

            <script type="text/javascript" language="javascript" src="../../UI/Scripts/datepicker/js/jquery-1.9.1.min.js"></script>
            <script type="text/javascript" language="javascript" src="../../UI/Scripts/datepicker/js/jquery-ui.min.js"></script>

            <script type="text/javascript" language="javascript" src="../../UI/Scripts/general/jquery.cookie.js"></script>
            <script type="text/javascript" language="javascript" src="../../UI/Scripts/general/global.js"></script>

            <link rel="Stylesheet" type="text/css" href="../../UI/Scripts/datepicker/css/ui-lightness/jquery-ui-1.10.1.custom.css" />

            

    <script language="javascript" type="text/javascript">

        function Highlight(row) {
            row.className = "gridViewRowHighlight";
        }

        function UnHighlight(row) {
            row.className = "gridViewRowUnHighlight";
        }

        function ToggleFiltersPanel() {
            SetToggleOn('#<%=pnlFilters.ClientID %>', '#<%=lblShowHideFilters.ClientID %>', '#<%=showHideFilters.ClientID %>', 'form_visible_filters', '#<%=imgShowHideFilters.ClientID %>');
        }

        $(document).ready(function () {

            ToggleFiltersPanel();

            var prm = Sys.WebForms.PageRequestManager.getInstance();

            prm.add_endRequest(function () {
                ToggleFiltersPanel();
            });

            $('#<%=pnlLoading.ClientID %>').toggleClass("loadingPleaseWaitNone");

        }); 
    </script>

</asp:Content>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DynamicDataManager ID="DynamicDataManager1" runat="server" AutoLoadForeignKeys="true">
        <DataControls>
            <asp:DataControlReference ControlID="GridView1" />
        </DataControls>
    </asp:DynamicDataManager>

     <table>
        <tr>
            <td>
                <%if (table.Name.ToLower() == "taxicompany") { %>
                <h2>TaxiCompanies List</h2>   
                <%} else { %>
                <h2><% =table.Name%>s List</h2>
                <%} %>    
            </td>
            <td>
                <asp:Panel ID="pnlLoading" runat="server" CssClass="loadingPleaseWait">
                    <table>
                        <tr>
                            <td>
                                <asp:Image ID="imgLoading" runat="server" ImageUrl="~/DynamicData/Content/Images/ui/ajax-loader.gif" />
                            </td>
                            <td>
                                Loading...
                            </td>
                        </tr>
                    </table>                    
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <uc:QuickLinks ID="QuickLinks1" runat="server" />
            </td>
        </tr>
    </table>
<%--                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
            <ContentTemplate>--%>
            <div>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
                    HeaderText="List of validation errors" />
                <asp:DynamicValidator runat="server" ID="GridViewValidator" ControlToValidate="GridView1" Display="None" />

                    <table>
                        <tr>
                            <td>
                                            <asp:Panel id="showHideFilters" runat="server" CssClass="divShowFilters">
                                            <table>
                                                <tr>
                                                    <td class="tdVerticalAlignMiddle">
                                                        <asp:Image ID="imgShowHideFilters" runat="server" ImageUrl="~/DynamicData/Content/Images/ui/book-open-icon.png" CssClass="imgHeaderSmall" />
                                                    </td>
                                                    <td class="tdVerticalAlignMiddle">
                                                        <asp:Label ID="lblShowHideFilters" runat="server" Text="Show / Hide Filters"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                            </asp:Panel>
                                                <asp:Panel id="pnlFilters" runat="server">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:UpdatePanel ID="UpdatePanelFilters" runat="server" UpdateMode="Conditional">
                                                                    <ContentTemplate>
                                                                        <table style="border: solid 1px lightgray">

                                                                            <asp:QueryableFilterRepeater runat="server" ID="FilterRepeater">
                                                                                <ItemTemplate>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("DisplayName") %>' OnPreRender="Label_PreRender" />    
                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:DynamicFilter runat="server" ID="DynamicFilter" OnFilterChanged="DynamicFilter_FilterChanged" />            
                                                                                                </td>
                                                                                            </tr>

                                                                                </ItemTemplate>
                                                                            </asp:QueryableFilterRepeater>
                                                                        </table>
                                                                        <table>
                                                                            <tr>
                                                                                <td class="tdVerticalAlignMiddle">
                                                                                    <asp:ImageButton ID="imgSearch" runat="server" CssClass="imgHeaderSmall" ImageUrl="~/DynamicData/Content/Images/ui/find.png" OnClick="DynamicFilter_FilterChanged"  />
                                                                                </td>
                                                                                <td class="tdVerticalAlignMiddle">
                                                                                    <asp:LinkButton ID="btnSearch" runat="server" Text="Search" OnClick="DynamicFilter_FilterChanged" />
                                                                               </td>
                                                                            </tr>
                                                                        </table>
                                                                        <%--<hr />--%>
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="max-height: 20px;">
                                                                <asp:Image ID="imgShadow" runat="server" ImageUrl="~/DynamicData/Content/Images/ui/shadow875 small.png" style="width: 100%" Height="20" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>                                        
                                    </td>
                            </tr>
                    </table>   
                
                <table>
                        <tr>
                           <td class="tdVerticalAlignMiddle">
                                <asp:DynamicHyperLink ID="DynamicHyperLink3" runat="server" Action="Insert">
                                    <asp:Image ID="imgAdd" runat="server" CssClass="imgHeaderSmall" ImageUrl="~/DynamicData/Content/Images/ui/address_book_add.png" />
                                </asp:DynamicHyperLink>                            
                           </td>
                           <td class="tdVerticalAlignMiddle">
                                <asp:DynamicHyperLink ID="InsertHyperLink" runat="server" Action="Insert" Target="_blank">Add New <%= table.DisplayName%>
                                </asp:DynamicHyperLink>
                           </td>
                           <%if (GetNumberOfRowsInGrid() > 0)
                             {%>
                           <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                           </td>
                           <td class="tdVerticalAlignMiddle">                            
                                <asp:ImageButton ID="imgExportToExcel" runat="server" CssClass="imgHeaderSmall" ImageUrl="~/DynamicData/Content/Images/ui/file-extension-xls-icon.png" OnClick="btnExportToExcel_Click" />
                           </td>
                           <td class="tdVerticalAlignMiddle">
                                <asp:LinkButton ID="btnExportToExcel" runat="server" onclick="btnExportToExcel_Click" Text="Export List To Excel"></asp:LinkButton>
                           </td>
                           <%} %>
                        </tr>
                </table>
                <br />
            </div>

            <asp:Panel ID="pnlGridContainer" runat="server" CssClass="mainContent">
                <table>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="updatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:Panel ID="divShadow" runat="server" CssClass="shadow">
                                        <asp:GridView ID="GridView1" runat="server" DataSourceID="GridDataSource" EnablePersistedSelection="true"
                                            AllowPaging="True" AllowSorting="True" 
                                            onpageindexchanging="GridView1_PageIndexChanging" PageSize="10" 
                                            onrowdatabound="GridView1_RowDataBound">

                                            <SortedAscendingHeaderStyle CssClass="gridSortAsc" />
                                            <SortedDescendingHeaderStyle CssClass="gridSortDesc" />

                                            <Columns>
                                                <asp:TemplateField>
                                                  <ItemTemplate>
                                                    <table>
                                                        <tr>
                                                            <td class="tdVerticalAlignMiddle">
                                                                <asp:DynamicHyperLink ID="DynamicHyperLink1" runat="server" Action="Edit" Text="Edit"/>        
                                                            </td>                                                                                                      
                                                        </tr>
                                                    </table>
                                                  </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <table>
                                                            <tr>
                                                                <td class="tdVerticalAlignMiddle">
                                                                    <asp:DynamicHyperLink ID="DynamicHyperLink2" runat="server" Text="Details" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                      </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>

                                            <EmptyDataTemplate>
                                                No information is available for this <%=table.Name %>.<br />Please add some.
                                            </EmptyDataTemplate>

                                            <PagerTemplate>
                                                            <asp:GridViewPager ID="gvPager1"  runat="server" />
                                            </PagerTemplate>
                                        </asp:GridView>
                                    </asp:Panel>                                
                                </ContentTemplate>
                            </asp:UpdatePanel>                           
                        </td>                    
                    </tr>
                </table>
                           <table>
                                <tr>
                                    <td class="tdVerticalAlignMiddle">
                                            <asp:Image ID="imgInformation" runat="server" ImageUrl="~/DynamicData/Content/Images/ui/information_32.png" CssClass="imgHeaderSmall" />
                                     </td>
                                    <td class="tdVerticalAlignMiddle">
                                        items: <%=GetNumberOfRowsInGrid() %>
                                    </td>
                                    <%if (GetNumberOfRowsInGrid() > 0)
                                      {%>
                                    <td class="tdVerticalAlignMiddle">
                                        * the record can be deleted in the Details page.
                                    </td>
                                    <%} %>
                                </tr>
                            </table>
            </asp:Panel>
            <asp:EntityDataSource ID="GridDataSource" runat="server" EnableDelete="True" 
                onselected="GridDataSource_Selected">
            </asp:EntityDataSource>
            
            <asp:QueryExtender TargetControlID="GridDataSource" ID="GridQueryExtender" runat="server">
                <asp:DynamicFilterExpression ControlID="FilterRepeater" />
            </asp:QueryExtender>
</asp:Content>
