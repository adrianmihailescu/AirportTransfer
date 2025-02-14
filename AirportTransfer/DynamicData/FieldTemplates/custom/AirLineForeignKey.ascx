<%@ Control Language="C#" CodeBehind="AirLineForeignKey.ascx.cs" Inherits="AirportTransfer.AirLineForeignKeyField" %>

<div class="divTextModeLeft" title="<%# GetDisplayString() %>">
    <asp:HyperLink ID="HyperLink1" runat="server"
        Text="<%# GetDisplayString() %>"
        NavigateUrl="<%# GetNavigateUrl() %>"  />
</div>
