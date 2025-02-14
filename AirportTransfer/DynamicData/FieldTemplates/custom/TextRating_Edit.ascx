<%@ Control Language="C#" CodeBehind="TextRating_Edit.ascx.cs" Inherits="AirportTransfer.DynamicData.FieldTemplates.custom.TextRating_EditField" %>

<script language="javascript" type="text/javascript" src="../../../UI/Scripts/rating/jquery.js"></script>
<script language="javascript" type="text/javascript" src="../../../UI/Scripts/rating/rating.js"></script>
<link rel="stylesheet" type="text/css" href="../../../UI/Scripts/rating/rating.css" />

<link rel="stylesheet" type="text/css" href="../../../UI/Css/Site.css" />

<script language="javascript" type="text/javascript">

    function Highlight(row) {
        row.className = "gridViewRowHighlight";
    }

    function UnHighlight(row) {
        row.className = "gridViewRowUnHighlight";
    }

    $(function () {
        $('.rating').rating();

    var prm = Sys.WebForms.PageRequestManager.getInstance();

        prm.add_endRequest(function () {
            $('.rating').rating();
        });
    });

    </script>

<%--<input type="text" class="rating rating5" />--%>

<asp:UpdatePanel ID="pnlRatingUpdatePanel" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <asp:panel ID="pnlRatingContainer" runat="server">
            <table>
                <tr>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="rating rating5">
                        </asp:TextBox>   
                    </td>
                    <td class="tdVerticalAlignMiddle">
                        <asp:LinkButton id="lnkClearRating" runat="server" 
                            onclick="lnkClearRating_Click" validationgroup="NoValidation">
                            <asp:Image ID="imgClearRating" runat="server" ImageUrl="~/DynamicData/Content/Images/ui/Eraser-icon.png" ToolTip="Clear Rating" />
                        </asp:LinkButton> 
                    </td>
                </tr>
            </table>
        </asp:panel>
    </ContentTemplate>
</asp:UpdatePanel>
