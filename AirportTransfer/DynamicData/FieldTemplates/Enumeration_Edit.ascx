<%@ Control Language="C#" CodeBehind="Enumeration_Edit.ascx.cs" Inherits="AirportTransfer.Enumeration_EditField" %>

<div class="divTextMode" title="<%# FieldValueString %>">
    <table>
        <tr>
            <td class="tdVerticalAlignMiddle">
                <asp:DropDownList ID="DropDownList1" runat="server" />
            </td>
            <td class="tdVerticalAlignMiddle">
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="DropDownList1" Display="Static" Enabled="false" ForeColor="Red" />                
            </td>
            <td class="tdVerticalAlignMiddle">
                <asp:DynamicValidator runat="server" ID="DynamicValidator1" ControlToValidate="DropDownList1" Display="Static" ForeColor="Red" />          
            </td>
        </tr>
    </table>
</div>

