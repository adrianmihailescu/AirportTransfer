<%@ Control Language="C#" CodeBehind="Text_Edit.ascx.cs" Inherits="AirportTransfer.Text_EditField" %>

<div class="divTextMode" title="<%# FieldValueString %>">
    <table>
        <tr>
            <td class="tdVerticalAlignMiddle">
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# FieldValueEditString %>'></asp:TextBox>    
            </td>
            <td class="tdVerticalAlignMiddle">
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="TextBox1" Display="Static" Enabled="false" ForeColor="Red" />
                <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ControlToValidate="TextBox1" Display="Static" Enabled="false" ForeColor="Red" />
                <asp:DynamicValidator runat="server" ID="DynamicValidator1" ControlToValidate="TextBox1" Display="Static" ForeColor="Red" />    
            </td>
        </tr>
    </table>
</div>