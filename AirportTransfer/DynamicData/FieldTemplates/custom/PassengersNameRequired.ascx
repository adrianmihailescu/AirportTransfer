<%@ Control Language="C#" CodeBehind="PassengersNameRequired.ascx.cs" Inherits="AirportTransfer.DynamicData.FieldTemplates.custom.PassengersNameRequiredField" %>
<div class="divTextModeLeft" title="<%# FieldValueStringToolTip(FieldValueString) %>">
    <asp:Label runat="server" ID="Literal1" Text="<%# FieldValueString %>" ToolTip="<%# FieldValueStringToolTip(FieldValueString) %>"></asp:Label>  
</div>