<%@ Control Language="C#" CodeBehind="TextAreaAddress.ascx.cs" Inherits="AirportTransfer.DynamicData.FieldTemplates.custom.TextAreaAddressField" %>

<div class="divTextMode" title="<%# FieldValueString %>">
    <table>
            <tr>
                <td class="tdVerticalAlignMiddle">
                    <asp:HyperLink ID="HyperLink2" runat="server" Target="_blank">
                        <asp:Image ID="imgShowLocationOnMap" runat="server" ImageUrl="~/DynamicData/Content/Images/ui/Google-Maps-icon.png" ToolTip="Show location on Google Maps" />
                    </asp:HyperLink>                    
                </td>
                <td class="tdVerticalAlignMiddle">
                    <asp:HyperLink ID="HyperLink1" runat="server" Text="<%# FieldValueString %>" Target="_blank" />
                </td>
            </tr>
    </table>
</div>

