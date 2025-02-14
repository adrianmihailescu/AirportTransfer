<%@ Control Language="C#" CodeBehind="MultilineText_Edit.ascx.cs" Inherits="AirportTransfer.MultilineText_EditField" %>

<div class="divListBoxMode" title="<%# FieldValueString %>">
    <table>
        <tr>
            <td class="tdVerticalAlignMiddle">
                <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Text='<%# FieldValueEditString %>' Columns="80" Rows="5"></asp:TextBox>
            </td>
            <td class="tdVerticalAlignMiddle">
                <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" ControlToValidate="TextBox1" Display="Static" Enabled="false" ForeColor="Red" />                
            </td>
            <td class="tdVerticalAlignMiddle">
                <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ControlToValidate="TextBox1" Display="Static" Enabled="false" ForeColor="Red" />
            </td>
            <td class="tdVerticalAlignMiddle">
                <asp:DynamicValidator runat="server" id="DynamicValidator1" ControlToValidate="TextBox1" Display="Static" ForeColor="Red" />
            </td>
        </tr>
    </table>
</div>


