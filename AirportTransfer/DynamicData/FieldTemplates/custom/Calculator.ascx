<%@ Control Language="C#" CodeBehind="Calculator.ascx.cs" Inherits="AirportTransfer.CalculatorField" %>
<div class="divTextModeLeft" title="<%# FieldValueString %>">
    <asp:Label runat="server" ID="Literal1" Text="<%# FieldValueString %>" ToolTip="<%# FieldValueStringToolTip() %>"></asp:Label>  
</div>