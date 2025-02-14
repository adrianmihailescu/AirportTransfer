<%@ Control Language="C#" CodeBehind="Text.ascx.cs" Inherits="AirportTransfer.TextField" %>
<div class="divTextModeLeft" title="<%# FieldValueString %>">
    <asp:Label runat="server" ID="Literal1" Text="<%# FieldValueString %>" ToolTip="<%# FieldValueStringToolTip() %>"></asp:Label>  
</div>