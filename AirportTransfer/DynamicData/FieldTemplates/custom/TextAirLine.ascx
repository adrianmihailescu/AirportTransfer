<%@ Control Language="C#" CodeBehind="TextAirLine.ascx.cs" Inherits="AirportTransfer.DynamicData.FieldTemplates.custom.TextAirLineField" %>

<link rel="Stylesheet" type="text/css" href="../../../UI/Css/Site.css"/>

<div class="divTextMode" title="<%# FieldValueString %>">
    <table>
            <tr>
                <td class="tdVerticalAlignMiddle">
                    <asp:HyperLink ID="HyperLink2" runat="server" Target="_blank">
                        <asp:Image ID="imgShowAirLineLogo" runat="server" CssClass="imgHeaderWide"  />
                    </asp:HyperLink>                    
                </td>
                <td class="tdVerticalAlignMiddle">
                    <asp:HyperLink ID="HyperLink1" runat="server" Text="<%# FieldValueString %>" Target="_blank" />
                </td>
            </tr>
    </table>
</div>