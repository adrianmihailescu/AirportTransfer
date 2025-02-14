<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DateTimeNonEditable_Edit.ascx.cs" Inherits="AirportTransfer.DynamicData.FieldTemplates.custom.DateTimeNonEditable_Edit" %>

    <table>
        <tr>
            <td class="tdVerticalAlignMiddle">
                <asp:Literal runat="server" ID="Literal1" Text="<% #FieldValueString %>" />
            </td>
        </tr>
    </table>
<%--Lease.LeaseDate--%>