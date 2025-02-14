<%@ Control Language="C#" CodeBehind="TextArea.ascx.cs" Inherits="AirportTransfer.DynamicData.FieldTemplates.custom.TextAreaField" %>
<div class="divTextModeLeft" title="<%# FieldValueString %>">
    <asp:Label runat="server" ID="Literal1" Text="<%# FieldValueString %>" ToolTip="<%# FieldValueStringToolTip(FieldValueString) %>"></asp:Label>  
</div>