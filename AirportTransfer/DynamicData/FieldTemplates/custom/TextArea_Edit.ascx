<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TextArea_Edit.ascx.cs" Inherits="AirportTransfer.DynamicData.FieldTemplates.custom.TextArea_Edit" %>

<table>
    <tr>
        <td>
            <asp:TextBox ID="TextBox1" runat="server" Text="<%# FieldValueEditString %>" 
        Columns="10" TextMode="MultiLine" CssClass="TextAreaEdit" MaxLength="4000" ></asp:TextBox>    
        </td>
        <td>
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="TextBox1" Display="Static" Enabled="false" ForeColor="Red" />
            <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ControlToValidate="TextBox1" Display="Static" Enabled="false" ForeColor="Red" />
            <asp:DynamicValidator runat="server" ID="DynamicValidator1" ControlToValidate="TextBox1" Display="Static" ForeColor="Red" />    
        </td>
    </tr>
</table>
