<%@ Control Language="C#" CodeBehind="DateTimeReadWrite.ascx.cs" Inherits="AirportTransfer.DynamicData.FieldTemplates.custom.DateTimeReadWriteField" %>

<div class="divTextMode" title="<%# FieldValueString %>">
                <asp:Label runat="server" ID="Literal1" Text="<%# FieldValueString %>" ToolTip="<%# FieldValueString %>"></asp:Label>    
</div>
<%--Lease.ActualReturnDate--%>