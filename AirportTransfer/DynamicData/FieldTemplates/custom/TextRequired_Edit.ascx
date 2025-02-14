<%@ Control Language="C#" CodeBehind="TextRequired_Edit.ascx.cs" Inherits="AirportTransfer.DynamicData.FieldTemplates.custom.TextRequired_EditField" %>

<table>
    <tr>
        <td>
            <asp:TextBox ID="TextBox1" runat="server" Text='<%# FieldValueEditString %>'></asp:TextBox>    
        </td>
        <td>
            (*)
        </td>
        <td>
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="TextBox1" Display="Static" Enabled="false" ForeColor="Red" />
            <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ControlToValidate="TextBox1" Display="Static" Enabled="false" ForeColor="Red" />
            <asp:DynamicValidator runat="server" ID="DynamicValidator1" ControlToValidate="TextBox1" Display="Static" ForeColor="Red" />    
        </td>
    </tr>
</table>

