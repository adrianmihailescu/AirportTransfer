<%@ Page Language="C#" MasterPageFile="~/Site.master" CodeBehind="Default.aspx.cs" Inherits="AirportTransfer._Default" %>

<%@ Register src="~/UI/UserControls/GridViewPager.ascx" tagname="GridViewPager" tagprefix="asp" %>
<%@ Register TagPrefix="uc" TagName="Email" Src="~/DynamicData/FieldTemplates/custom/EmailAddress.ascx" %>
<%@ Import Namespace="AirportTransfer" %>


<%@ Register src="UI/UserControls/QuickLinks.ascx" tagname="QuickLinks" tagprefix="uc" %>


<asp:Content ID="headContent" ContentPlaceHolderID="head" Runat="Server">

    <link rel="Stylesheet" type="text/css" href="../../UI/Css/Site.css" />

            <script type="text/javascript" language="javascript" src="UI/Scripts/datepicker/js/jquery-1.9.1.min.js"></script>
            <script type="text/javascript" language="javascript" src="UI/Scripts/datepicker/js/jquery-ui.min.js"></script>

            <script type="text/javascript" language="javascript" src="UI/Scripts/general/jquery.cookie.js"></script>
            <script type="text/javascript" language="javascript" src="UI/Scripts/general/global.js"></script>

            <link rel="Stylesheet" type="text/css" href="UI/Scripts/datepicker/css/ui-lightness/jquery-ui-1.10.1.custom.css" />
            
        <script language="javascript" type="text/javascript">

            function Highlight(row) {
                row.className = "gridViewRowHighlight";
            }

            function UnHighlight(row) {
                row.className = "gridViewRowUnHighlight";
            }

            function ToggleFiltersPanel() {
                SetToggleOn('#<%=pnlTodayScheduledDelegations.ClientID %>', '#<%=lblShowHideFilters.ClientID %>', '#<%=showHideTodayScheduledDelegations.ClientID %>', 'form_visible_filters', '#<%=imgShowHideTodayScheduledDelegations.ClientID %>');
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
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server" />

        <div class="divMainContent">

           <table>
                <tr>
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
            </table>

            <uc:QuickLinks ID="QuickLinks1" runat="server" />
            <table class="mainContent">
                <tr>
                    <td>
                        <h2>Delegations with EndDate on <%=Utils.FormatDateTime(GetSelectedCalendarDate())%> (<%=GetNumberOfRowsInGrid() %>)</h2>
                    </td>
                </tr>
                <tr>
                            <td>
                                <asp:Panel id="showHideTodayScheduledDelegations" runat="server" CssClass="divShowFilters">
                                                <table>
                                                    <tr>
                                                        <td class="tdVerticalAlignMiddle">
                                                            <asp:Image ID="imgShowHideTodayScheduledDelegations" runat="server" ImageUrl="~/DynamicData/Content/Images/ui/book-open-icon.png" CssClass="imgHeaderSmall" />
                                                        </td>
                                                        <td class="tdVerticalAlignMiddle">
                                                            <asp:Label ID="lblShowHideFilters" runat="server" Text="Show / Hide"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                </asp:Panel>
                            </td>
                </tr>
                <tr>
                    <td>
                        <asp:Panel id="pnlTodayScheduledDelegations" runat="server">
                        <table>
                            <tr>
                                <td style="border: solid 1px lightgray">
                                    <asp:UpdatePanel ID="updatePanelCalendar" runat="server">
                                        <ContentTemplate>
                                                                        <table>
                                                                            <tr>
                                                                                <td colspan="2">
                                                                                    <asp:Calendar ID="Calendar1" runat="server"
                                                                                    ondayrender="userCalendar_DayRender" BackColor="White" BorderColor="White" 
                                                                                    BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="#a03033" 
                                                                                    Height="190px" NextPrevFormat="FullMonth" Width="350px" 
                                                                                    SelectionMode="None">
                                                                                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                                                                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#696969" 
                                                                                        VerticalAlign="Bottom" />
                                                                                    <OtherMonthDayStyle ForeColor="Black" />
                                                                                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                                                                    <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="1px" 
                                                                                        Font-Bold="True" Font-Size="12pt" ForeColor="#696969" />
                                                                                    <TodayDayStyle BackColor="#CCCCCC" />
                                                                                </asp:Calendar>                                        
                                                                                scheduled delegations by day
                                                                                </td>
                                                                            </tr>                                                                            
                                                                        </table>                                                           
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
                        <table>
                            <tr>
                                                                                            <td class="tdVerticalAlignMiddle">                            
                                                                                                <asp:ImageButton ID="imgExportToExcel" runat="server" CssClass="imgHeaderSmall" ImageUrl="~/DynamicData/Content/Images/ui/file-extension-xls-icon.png" OnClick="btnExportToExcel_Click" />
                                                                                           </td>
                                                                                           <td class="tdVerticalAlignMiddle">
                                                                                                <asp:LinkButton ID="btnExportToExcel" runat="server" onclick="btnExportToExcel_Click" Text="Export List To Excel"></asp:LinkButton>
                                                                                           </td>
                            </tr>
                        </table>
                        </asp:Panel> 
                    </td>
                </tr>
            </table>

        </div>

</asp:Content>


