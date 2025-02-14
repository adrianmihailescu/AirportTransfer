<%@ Control Language="C#" CodeBehind="Boolean_Edit.ascx.cs" Inherits="AirportTransfer.Boolean_EditField" %>

<script type="text/javascript" src="../../UI/Scripts/datepicker/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../UI/Scripts/datepicker/js/jquery-ui.min.js"></script>

<div class="divTextMode" title="<%# FieldValueString %>">
    <table>
        <tr>
            <td class="tdVerticalAlignMiddle">
                <asp:CheckBox runat="server" ID="CheckBox1" />
            </td>
        </tr>
    </table>
</div>