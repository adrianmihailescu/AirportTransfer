<%@ Control Language="C#" CodeBehind="Children.ascx.cs" Inherits="AirportTransfer.ChildrenField" %>

<div class="divTextModeLeft" title="<%# GetDisplayString() %>">
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="<%# GetChildrenPath() %>" />
</div>