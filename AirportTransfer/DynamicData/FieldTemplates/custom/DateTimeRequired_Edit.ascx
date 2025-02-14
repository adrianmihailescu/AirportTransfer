<%@ Control Language="C#" CodeBehind="DateTimeRequired_Edit.ascx.cs" Inherits="AirportTransfer.DynamicData.FieldTemplates.custom.DateTimeRequired_EditField" %>
        
<script type="text/javascript" src="../../../UI/Scripts/datepicker/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../UI/Scripts/datepicker/js/jquery-ui.min.js"></script>

    <link rel="Stylesheet" type="text/css" href="../../../UI/Scripts/datepicker/css/ui-lightness/jquery-ui-1.10.1.custom.css" />
    <link rel="Stylesheet" type="text/css" href="../../../UI/Scripts/datepicker/css/ui-lightness/jquery-ui-1.10.1.custom.min.css" />

    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%=DatePicker1.ClientID %>').datepicker({
                dateFormat: 'yy-mm-dd'
                , changeMonth: true
                , changeYear: true
                , showButtonPanel: true
            });
        });


        var prm = Sys.WebForms.PageRequestManager.getInstance();

        prm.add_endRequest(function () {
            $('#<%=DatePicker1.ClientID %>').datepicker({
                dateFormat: 'yy-mm-dd'
                , changeMonth: true
                , changeYear: true
                , showButtonPanel: true
            });
        });
 
  </script>

    <table>
        <tr>
            <td class="tdVerticalAlignMiddle">
                <asp:TextBox ID="DatePicker1" Enabled="true" runat="server" Text='<%# FieldValueEditString %>' Columns="20"></asp:TextBox>
            </td>
            <td class="tdVerticalAlignMiddle">
                (*)
            </td>
            <td class="tdVerticalAlignMiddle">
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="DatePicker1" Display="Static" Enabled="true" ForeColor="Red"/>
                <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ControlToValidate="DatePicker1" Display="Static" Enabled="false" ForeColor="Red" />
                <asp:DynamicValidator runat="server" ID="DynamicValidator1" ControlToValidate="DatePicker1" Display="Dynamic" />
                <asp:CustomValidator runat="server" ID="DateValidator"
                ControlToValidate="DatePicker1" Display="Static" EnableClientScript="false" Enabled="false" OnServerValidate="DateValidator_ServerValidate" />    
            </td>
            <td class="tdVerticalAlignMiddle">
                <asp:Literal ID="Literal1" runat="server" Text="<%$ AppSettings:DateFormatDisplay%>" /> 
            </td>
        </tr>
    </table>