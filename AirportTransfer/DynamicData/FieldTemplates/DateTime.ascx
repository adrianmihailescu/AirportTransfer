<%@ Control Language="C#" CodeBehind="DateTime.ascx.cs" Inherits="AirportTransfer.DateTimeField" %>

<div class="divTextMode" title="<%# FieldValueString %>">
                <asp:Label runat="server" ID="Literal1" Text="<%# FieldValueString %>" ToolTip="<%# FieldValueString %>"></asp:Label>    
</div>