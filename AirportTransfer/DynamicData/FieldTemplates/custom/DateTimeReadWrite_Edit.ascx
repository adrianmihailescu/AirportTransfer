<%@ Control Language="C#" CodeBehind="DateTimeReadWrite_Edit.ascx.cs" Inherits="AirportTransfer.DynamicData.FieldTemplates.custom.DateTimeReadWrite_EditField" %>

<script type="text/javascript" src="../../../UI/Scripts/datepicker/js/jquery-ui.min.js"></script>

    <link rel="Stylesheet" type="text/css" href="../../../UI/Scripts/datepicker/css/ui-lightness/jquery-ui-1.10.1.custom.css" />
    <link rel="Stylesheet" type="text/css" href="../../../UI/Scripts/datepicker/css/ui-lightness/jquery-ui-1.10.1.custom.min.css" />

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

    <table>
        <tr>
            <td class="tdVerticalAlignMiddle">
                <asp:TextBox ID="DatePicker1" Enabled="true" runat="server" Text='<%# FieldValueEditString %>' Columns="20"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="DatePicker1" Display="Static" Enabled="false" ForeColor="Red" />                
            </td>
            <td>
                <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ControlToValidate="DatePicker1" Display="Static" Enabled="false" ForeColor="Red" />
            </td>
            <td>
                <asp:DynamicValidator runat="server" ID="DynamicValidator1" ControlToValidate="DatePicker1" Display="Static" />
            </td>
            <td>
                <asp:CustomValidator runat="server" ID="DateValidator" ControlToValidate="DatePicker1" Display="Static" EnableClientScript="false" Enabled="false" OnServerValidate="DateValidator_ServerValidate" />
            </td>
        </tr>
    </table>