<%@ Control Language="C#" CodeBehind="TextRating.ascx.cs" Inherits="AirportTransfer.DynamicData.FieldTemplates.custom.TextRatingField" %>

<div class="divTextModeLeft" title="<%# FieldValueStringToolTip() %>">
    <asp:Literal runat="server" ID="Literal1" Text="<%# FieldValueString %>"></asp:Literal> 
</div>