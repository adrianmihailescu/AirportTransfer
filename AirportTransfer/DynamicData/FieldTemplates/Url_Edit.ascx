<%@ Control Language="C#" CodeBehind="Url_Edit.ascx.cs" Inherits="AirportTransfer.Url_EditField" %>

<%--            <script type="text/javascript" language="javascript" src="../../../UI/Scripts/datepicker/js/jquery-1.9.1.min.js"></script>
            <script type="text/javascript" language="javascript" src="../../../UI/Scripts/datepicker/js/jquery-ui.min.js"></script>
            <script type="text/javascript" language="javascript" src="../../../UI/Scripts/general/global.js"></script>--%>


                <script language="javascript" type="text/javascript">

                    $(document).ready(function () {
                        $('#<%=lnkCheckWebSite.ClientID %>').attr('target', '_blank');

                        ///////
                        $('#<%=lnkCheckWebSite.ClientID %>').click(function () {

                            var s = $('#<%=TextBox1.ClientID %>').val();

                            if (!s.toLowerCase().indexOf("http://") >= 0) {
                                if (s != "") {
                                    s = "http://" + s;
                                }
                            }

                            var fullLocation = s;

                            // alert(s);

                            $('#<%=lnkCheckWebSite.ClientID %>').attr('href', fullLocation)
                        });
                        ///////

                    });
    </script>

<table>
    <tr>
        <td>
            <asp:TextBox ID="TextBox1" runat="server" Text='<%# FieldValueEditString %>'></asp:TextBox>    
        </td>
        <td>
            <asp:LinkButton ID="lnkCheckWebSite" runat="server" ValidationGroup="NoValidation">
                <asp:Image ID="imgCheckWebSite" runat="server" ImageUrl="~/DynamicData/Content/Images/ui/hyperlink_internet_search.png" ToolTip="Check Web Site" CssClass="imgHeaderSmall" />
            </asp:LinkButton>
        </td>
        <td>
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="TextBox1" Display="Static" Enabled="false" ForeColor="Red" />
            <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ControlToValidate="TextBox1" Display="Static" Enabled="false" ForeColor="Red" />
            <asp:DynamicValidator runat="server" ID="DynamicValidator1" ControlToValidate="TextBox1" Display="Static" ForeColor="Red" />    
        </td>
    </tr>
</table>

