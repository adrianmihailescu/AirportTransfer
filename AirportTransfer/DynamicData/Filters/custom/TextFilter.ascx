<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TextFilter.ascx.cs" Inherits="AirportTransfer.DynamicData.Filters.custom.TextFilter" %>

<table>
    <tr>
        <td>
            <asp:TextBox ID="txtFilter1" AutoPostBack="false" OnTextChanged="TextBox1_OnTextChanged" runat="server"></asp:TextBox>    
        </td>
    </tr>
</table>