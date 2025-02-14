<%@ Control Language="C#" CodeBehind="ForeignKey_Edit.ascx.cs" Inherits="AirportTransfer.ForeignKey_EditField" %>

            <script type="text/javascript" language="javascript" src="../../UI/Scripts/datepicker/js/jquery-1.9.1.min.js"></script>
            <script type="text/javascript" language="javascript" src="../../UI/Scripts/datepicker/js/jquery-ui.min.js"></script>


<script language="javascript" type="text/javascript">
    $(document).ready(function () {
        $('#<%=ListBox1.ClientID %>').click(function () {
//             alert($('#<%=ListBox1.ClientID %>').val());

            if (
            ($('#<%=ListBox1.ClientID %>').val() != null)
            && ($('#<%=ListBox1.ClientID %>').val() != '')

            ) {
//                 alert($('#<%=ListBox1.ClientID %>').val());

                var $text = '../../<%=GetTableName() %>/Details.aspx?<%=GetPrimaryKeyColumnName()%>=' + $('#<%=ListBox1.ClientID %>').val();

                $('#<%=lnkEntityDetails.ClientID %>').attr('target', '_blank');
                $('#<%=lnkEntityDetails.ClientID %>').attr('href', $text);
            }

            else {
//                alert('null');
                $('#<%=lnkEntityDetails.ClientID %>').attr('target', '_self');
                $('#<%=lnkEntityDetails.ClientID %>').attr('href', '');
            }

        });
    })
</script>

<asp:UpdatePanel ID="pnlForeignKeyUpdatePanel" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <table>
            <tr>
                <td>
                    <div class="divListBoxMode">
                        <asp:DropDownList ID="ListBox1" runat="server" ValidationGroup="ForeignKeyValidator" >
                                            <%--<asp:ListItem Text="-- All --" Value="" Selected="true"/>--%>
                        </asp:DropDownList>
                    </div>
                </td>
                <td>
                    (*)
                </td>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:HyperLink ID="lnkEntityNew" runat="server" Target="_blank" NavigateUrl="">
                                    <asp:Image ID="imgEntityNew" runat="server" ImageUrl="~/DynamicData/Content/Images/ui/fk_add_item.png" />
                                </asp:HyperLink>
                            </td>                            
                            <td>
                                <asp:HyperLink ID="lnkEntityDetails" runat="server" NavigateUrl="">
                                    <asp:Image ID="imgEntityDetails" runat="server" ImageUrl="~/DynamicData/Content/Images/ui/fk_old_details_find.png" />
                                </asp:HyperLink>
                            </td>
                            <td>
                                <asp:LinkButton ID="lnkEntityRefresh" runat="server" 
                                    onclick="lnkEntityRefresh_Click" ToolTip="refresh" ValidationGroup="NoValidation">
                                <asp:Image ID="imgEntityRefresh" runat="server" ImageUrl="~/DynamicData/Content/Images/ui/fk_refresh.png" />
                                </asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </td>        
                <td>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="ListBox1" Display="Static" Enabled="false" ValidationGroup="ForeignKeyValidator" ForeColor="Red" />
                    <asp:DynamicValidator runat="server" ID="DynamicValidator1" ControlToValidate="ListBox1" Display="Static" ForeColor="Red" />
                </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>