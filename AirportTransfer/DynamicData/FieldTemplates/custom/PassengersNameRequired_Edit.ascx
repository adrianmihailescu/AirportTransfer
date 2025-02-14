<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PassengersNameRequired_Edit.ascx.cs" Inherits="AirportTransfer.DynamicData.FieldTemplates.custom.PassengersName_Edit" %>

<table>
    <tr>
        <td>
            <asp:TextBox ID="TextBox1" runat="server" Text="<%# FieldValueEditString %>" 
        Columns="10" TextMode="MultiLine" CssClass="TextAreaEdit" ></asp:TextBox>    
        </td>
        <td>
            (*)
        </td>
        <td>
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="TextBox1" Display="Static" Enabled="false" ForeColor="Red" />
            <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ControlToValidate="TextBox1" Display="Static" Enabled="false" ForeColor="Red" />
            <asp:DynamicValidator runat="server" ID="DynamicValidator1" ControlToValidate="TextBox1" Display="Static" />    
        </td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:Label ID="lblPassengersNameHint" runat="server">
                one name by line
            </asp:Label>
        </td>
    </tr>
</table>
