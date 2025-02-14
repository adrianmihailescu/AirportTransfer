<%@ Control Language="C#" CodeBehind="DateTime_Edit.ascx.cs" Inherits="AirportTransfer.DateTime_EditField" %>

    <script type="text/javascript">

        function SetDateTimePicker() {
            $('#<%=DatePicker1.ClientID %>').datepicker({
                dateFormat: 'yy-mm-dd'
                , changeMonth: true
                , changeYear: true
                , showButtonPanel: true
            });
        }

        $(document).ready(function () {
            SetDateTimePicker();
        });


        var prm = Sys.WebForms.PageRequestManager.getInstance();

        prm.add_endRequest(function () {
            SetDateTimePicker();
        });
 
  </script>

<div class="divTextMode" title="<%# FieldValueString %>">
    <table>
        <tr>
            <td class="tdVerticalAlignMiddle">
                <asp:TextBox ID="DatePicker1" Enabled="true" runat="server" Text='<%# FieldValueEditString %>' Columns="20"></asp:TextBox>                
            </td>
            <td class="tdVerticalAlignMiddle">
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="DatePicker1" Display="Static" Enabled="false" ForeColor="Red" />
            </td>
            <td class="tdVerticalAlignMiddle">
                <asp:DynamicValidator runat="server" ID="DynamicValidator1" ControlToValidate="DatePicker1" Display="Static" ForeColor="Red" />
            </td>
            <td class="tdVerticalAlignMiddle">
                <asp:CustomValidator runat="server" ID="DateValidator" ControlToValidate="DatePicker1" Display="Static" EnableClientScript="false" Enabled="false" OnServerValidate="DateValidator_ServerValidate" ForeColor="Red" />
            </td>
        </tr>
    </table>
</div>



<%--<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ControlToValidate="DatePicker1" Display="Static" Enabled="false" />--%>