<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DateFilter.ascx.cs" Inherits="AirportTransfer.DynamicData.Filters.custom.DateFilter" %>

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
        <td>
                      <asp:TextBox ID="DatePicker1" AutoPostBack="false" runat="server" 
    ontextchanged="DatePicker1_TextChanged"></asp:TextBox>  
        </td>
    </tr>
  </table>
