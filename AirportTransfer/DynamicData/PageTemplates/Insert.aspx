<%@ Page Language="C#" MasterPageFile="~/Site.master" CodeBehind="Insert.aspx.cs" Inherits="AirportTransfer.Insert" ValidateRequest="false" %>

<%@ Register src="../../UI/UserControls/QuickLinks.ascx" tagname="QuickLinks" tagprefix="uc" %>

<asp:Content ID="headContent" ContentPlaceHolderID="head" Runat="Server">

            <link rel="Stylesheet" type="text/css" href="../../UI/Css/Site.css" />

            <script type="text/javascript" language="javascript" src="../../UI/Scripts/datepicker/js/jquery-1.9.1.min.js"></script>
            <script type="text/javascript" language="javascript" src="../../UI/Scripts/datepicker/js/jquery-ui.min.js"></script>
            <script type="text/javascript" language="javascript" src="../../UI/Scripts/general/jquery.cookie.js"></script>
            <script type="text/javascript" language="javascript" src="../../UI/Scripts/general/global.js"></script>

            <link rel="Stylesheet" type="text/css" href="../../UI/Scripts/datepicker/css/ui-lightness/jquery-ui-1.10.1.custom.css" />

                <script language="javascript" type="text/javascript">

                    $(document).ready(function () {

                        // alert('start');
                        $('#<%=pnlLoading.ClientID %>').toggleClass("loadingPleaseWaitNone");
                        // alert('none');

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
                    <h2>Add New <%= table.DisplayName %></h2>
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
                <td colspan="2">
                    <uc:QuickLinks ID="QuickLinks1" runat="server" />
                </td>
            </tr>
        </table>

<%--        <asp:UpdatePanel ID="UpdatePanelInsert" runat="server" UpdateMode="Conditional">
        <ContentTemplate>--%>

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
<%--                                            <td>
                                                <asp:DynamicHyperLink ID="DynamicHyperLinkBack" runat="server" Action="List" Text="Back" />
                                            </td>--%>
                                        </tr>
                                    </table>
                                </asp:Panel>
            </td>
        </tr>

    </table><!--error information-->
    <table>
        <tr>
            <td>
                <asp:HyperLink ID="DynamicHyperLinkBack" runat="server"></asp:HyperLink>
            </td>
        </tr>
    </table>   

    <table>
        <tr>
            <td>
                <asp:Label ID="lblRequiredField" runat="server">
                    (*) Indicates a required field
                </asp:Label>
            </td>
        </tr>
    </table>
                
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true" DisplayMode="List" ForeColor="Red"
                HeaderText="<table><tr><td class='tdVerticalAlignMiddle'><img src='../DynamicData/Content/Images/ui/error-icon.png' alt = 'errors:'></td><td class='tdVerticalAlignMiddle'>Please correct the following errors:</td></tr></table>" />
            <asp:DynamicValidator runat="server" ID="DetailsViewValidator" ControlToValidate="FormView1" Display="None" />
            
            <table>
                <tr>
                    <td class="InsertEditForms">
                        <asp:FormView runat="server" ID="FormView1" 
                        DataSourceID="DetailsDataSource" DefaultMode="Insert"
                                OnItemCommand="FormView1_ItemCommand" 
                                OnItemInserted="FormView1_ItemInserted" 
                    RenderOuterTable="false" oniteminserting="FormView1_ItemInserting" >
                                <InsertItemTemplate>
                                    <table id="detailsTable">
                                        <asp:DynamicEntity ID="DynamicEntity1" runat="server" Mode="Insert" />
                                        <tr>
                                            <td colspan="2">
                                                <hr />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="tdVerticalAlignMiddle">
                                                        <asp:ImageButton runat="server" CommandName="Insert" ID="imgButtonInsert" ImageUrl="~/DynamicData/Content/Images/ui/insert_Accept-icon.png" CssClass="imgHeaderSmall" />
                                                        <asp:LinkButton runat="server" CommandName="Insert" ID="lnkButtonInsert" text="Insert">
                                                        </asp:LinkButton>
                                            </td>
                                            <td class="tdVerticalAlignMiddle" >
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:ImageButton runat="server" CommandName="Cancel" ID="imgButtonCancel" ImageUrl="~/DynamicData/Content/Images/ui/insert_Sign-Error-icon.png" CssClass="imgHeaderSmall" CausesValidation="false" OnClientClick='javascript:return confirm("Exit and lose unsaved changes?");' />
                                                        <asp:LinkButton runat="server" CommandName="Cancel" ID="lnkButtonCancel" text="Cancel" CausesValidation="false" OnClientClick='javascript:return confirm("Exit and lose unsaved changes?");'>
                                                        </asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>

                                </InsertItemTemplate>
                            </asp:FormView>
                    </td>
                </tr>
            </table>                         
            <asp:EntityDataSource ID="DetailsDataSource" runat="server" EnableInsert="true" />
<%--        </ContentTemplate>
    </asp:UpdatePanel>     --%>                   

</asp:Content>

