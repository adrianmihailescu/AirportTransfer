<%@ Page Language="C#" MasterPageFile="~/Site.master" CodeBehind="Details.aspx.cs" Inherits="AirportTransfer.Details" EnableEventValidation="false" %>


<asp:Content ID="headContent" ContentPlaceHolderID="head" Runat="Server">
            <link rel="Stylesheet" type="text/css" href="../../UI/Css/Site.css" />

            <script type="text/javascript" language="javascript" src="../../UI/Scripts/datepicker/js/jquery-1.9.1.min.js"></script>
            <script type="text/javascript" language="javascript" src="../../UI/Scripts/datepicker/js/jquery-ui.min.js"></script>
            <script type="text/javascript" language="javascript" src="../../UI/Scripts/general/global.js"></script>

            <link rel="Stylesheet" type="text/css" href="../../UI/Scripts/datepicker/css/ui-lightness/jquery-ui-1.10.1.custom.css" />

                <script language="javascript" type="text/javascript">

                    $(document).ready(function () {

                        $('#<%=pnlLoading.ClientID %>').toggleClass("loadingPleaseWaitNone");

                    }); 
        </script>

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DynamicDataManager ID="DynamicDataManager1" runat="server" AutoLoadForeignKeys="true">
        <DataControls>
            <asp:DataControlReference ControlID="FormView1" />
        </DataControls>
    </asp:DynamicDataManager>

    <table>
        <tr>
            <td>
                <h2><%= table.DisplayName %> Details</h2>    
            </td>
        </tr>
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

        <table><!--error information-->
        <tr>
            <td>
                <asp:Panel id="showOperationResult" runat="server" CssClass="divInvisible">
                                    <table>
                                        <tr>
                                            <td class="tdVerticalAlignMiddle">
                                                <asp:Image ID="imgOperationResultInformation" runat="server" ImageUrl="~/DynamicData/Content/Images/ui/information_32.png" CssClass="imgHeaderSmall" />
                                            </td>
                                            <td class="tdVerticalAlignMiddle">
                                                <asp:Image ID="imgOperationResultError" runat="server" ImageUrl="~/DynamicData/Content/Images/ui/dialog_warning.png" CssClass="imgHeaderSmall" />
                                            </td>
                                            <td>
                                                <asp:Label ID="lblOperationResult" runat="server">
                                                </asp:Label>                                                
                                            </td>
                                            <td>
                                                <asp:DynamicHyperLink ID="DynamicHyperLink2" runat="server" Action="List" Text="Back" />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
            </td>
        </tr>
    </table><!--error information-->
    <table>
        <tr>
            <td>
                <div>
                    <asp:DynamicHyperLink ID="ListHyperLink" runat="server" Action="List">Show All Items</asp:DynamicHyperLink>
                </div>
            </td>
            <td>
                &nbsp;&nbsp;&nbsp;
            </td>
                    <td class="tdVerticalAlignMiddle">                            
                                <asp:ImageButton ID="imgExportToExcel" runat="server" CssClass="imgHeaderSmall" ImageUrl="~/DynamicData/Content/Images/ui/file-extension-xls-icon.png" OnClick="lnkExportDetailsToExcel_Click" />
                           </td>
                           <td class="tdVerticalAlignMiddle">
                                <asp:LinkButton ID="lnkExportDetailsToExcel" runat="server" onclick="lnkExportDetailsToExcel_Click" Text="Export Details To Excel"></asp:LinkButton>
                           </td>
        </tr>
    </table>  

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
                HeaderText="List of validation errors" />
            <asp:DynamicValidator runat="server" ID="DetailsViewValidator" ControlToValidate="FormView1" Display="None" />

            <table>
                <tr>
                    <td>
                        <table style="border: solid 1px lightgray">
                            <tr>
                                <td>
                                    <asp:FormView runat="server" ID="FormView1" DataSourceID="DetailsDataSource" 
                                        OnItemDeleted="FormView1_ItemDeleted" 
                                        onitemdeleting="FormView1_ItemDeleting">
                                        <ItemTemplate>
                                            <table id="detailsTable">
                                                <tr>
                                                    <td>
                                                        <asp:Panel ID="pnlShowDinamicEntity" runat="server">
                                                            <asp:DynamicEntity ID="DynamicEntity1" runat="server"></asp:DynamicEntity>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>                                    
                                            </table>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:DynamicHyperLink ID="DynamicHyperLink1" runat="server" Action="Edit" Text="Edit" />
                                                    </td>
                                                    <td>
                                                        &nbsp;&nbsp;&nbsp;
                                                    </td>
                                                    <td>
                                                        * <asp:LinkButton ID="LinkButtonDelete" runat="server" CommandName="Delete" Text="Delete" OnClientClick='return confirm("Are you sure you want to delete this item?");' />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <EmptyDataTemplate>
                                            No information is available for this <%=table.Name %>.<br />Please add.
                                        </EmptyDataTemplate>
                                    </asp:FormView>
                                </td>
                                <% if ((table.DisplayName.ToLower() == "employee") || (table.DisplayName.ToLower() == "airline")) // show preview image only if showing a picture or an user
                                   { %>
                                <td class="tdVerticalAlignMiddle">
                                    <asp:Panel ID="imhShadow" runat="server" CssClass="shadow">
                                        <asp:Image ID="imgShowPreview" runat="server" CssClass="imgShowPreview" />
                                    </asp:Panel>                            
                                </td>
                                <% } %>
                                <td>
                                    &nbsp;
                                </td>

                            </tr>
                        </table>    
                    </td>
                </tr>
                <tr>
                    <td>
                        <table style="width: 100%">
                            <tr>
                                <td colspan="2" style="max-height: 20px;">
                                    <asp:Image ID="imgShadow" runat="server" ImageUrl="~/DynamicData/Content/Images/ui/shadow875 small.png" style="width: 100%" Height="20" />
                                </td>
                            </tr>
                        </table>    
                    </td>
                </tr>
            </table>

            <table>
                            <tr>
                                        <td class="tdVerticalAlignMiddle">
                                            <asp:Image ID="imgInformation" runat="server" ImageUrl="~/DynamicData/Content/Images/ui/information_32.png" CssClass="imgHeaderSmall" />
                                        </td>
                                        <td>
                                            * The <% =table.Name%> will be marked as deleted
                                        </td>
                                    </tr>

            </table>

            <asp:EntityDataSource ID="DetailsDataSource" runat="server" EnableDelete="true" />

            <asp:QueryExtender TargetControlID="DetailsDataSource" ID="DetailsQueryExtender" runat="server">
                <asp:DynamicRouteExpression />
            </asp:QueryExtender>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:AirportTransferConnectionString %>">
    </asp:SqlDataSource>

            
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>