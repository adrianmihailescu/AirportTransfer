<%@ Control Language="C#" CodeBehind="TextTime.ascx.cs" Inherits="AirportTransfer.DynamicData.FieldTemplates.custom.TextTimeField" %>

<div class="divTextMode" title="<%# FieldValueString %>">
    <asp:Label runat="server" ID="Literal1" Text="<%# FieldValueString %>" ToolTip="<%# FieldValueString %>"></asp:Label>     
</div>