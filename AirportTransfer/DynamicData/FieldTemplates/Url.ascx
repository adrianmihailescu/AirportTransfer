<%@ Control Language="C#" CodeBehind="Url.ascx.cs" Inherits="AirportTransfer.UrlField" %>

<div class="divTextModeLeft" title="<%# FieldValueString %>">
    <asp:HyperLink ID="HyperLinkUrl" runat="server" Text="<%# FieldValueString %>" Target="_blank" ToolTip="<%# FieldValueString %>" />
</div>

