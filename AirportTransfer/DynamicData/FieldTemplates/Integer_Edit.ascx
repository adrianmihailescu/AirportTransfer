<%@ Control Language="C#" CodeBehind="Integer_Edit.ascx.cs" Inherits="AirportTransfer.Integer_EditField" %>

<div class="divTextMode" title="<%# FieldValueString %>">
    <table>
        <tr>
            <td class="tdVerticalAlignMiddle">
                <asp:TextBox ID="TextBox1" runat="server" Text="<%# FieldValueEditString %>" Columns="10" ></asp:TextBox>    
            </td>
            <td class="tdVerticalAlignMiddle">
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="TextBox1" Display="Static" Enabled="false" ForeColor="Red" />     
            </td>
            <td class="tdVerticalAlignMiddle">
                <asp:CompareValidator runat="server" ID="CompareValidator1" ControlToValidate="TextBox1" Display="Static"
        Operator="DataTypeCheck" Type="Integer" ForeColor="Red"/>
            </td>
            <td class="tdVerticalAlignMiddle">
                <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ControlToValidate="TextBox1" Display="Static" Enabled="false" />
            </td>
            <td class="tdVerticalAlignMiddle">
                <asp:RangeValidator runat="server" ID="RangeValidator1" ControlToValidate="TextBox1" Type="Integer"
        Enabled="false" EnableClientScript="true" MinimumValue="0" MaximumValue="100" Display="Static" ForeColor="Red" />
            </td>
            <td class="tdVerticalAlignMiddle">
                <asp:DynamicValidator runat="server" ID="DynamicValidator1" ControlToValidate="TextBox1" Display="Static" ForeColor="Red" />      
            </td>
        </tr>
    </table>
</div>
