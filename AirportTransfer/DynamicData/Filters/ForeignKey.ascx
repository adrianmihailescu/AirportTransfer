<%@ Control Language="C#" CodeBehind="ForeignKey.ascx.cs" Inherits="AirportTransfer.ForeignKeyFilter" %>

<script language="javascript" type="text/javascript">
    $(document).ready(function () {
        $('#<%=ListBox1.ClientID %>').click(function () {
            // alert($('#<%=ListBox1.ClientID %>').val());

            if (
            ($('#<%=ListBox1.ClientID %>').val() != null)
            && ($('#<%=ListBox1.ClientID %>').val() != '')

            ) {
                // alert($('#<%=ListBox1.ClientID %>').val());

                var $text = '../../<%=GetTableName() %>/Details.aspx?<%=GetPrimaryKeyColumnName()%>=' + $('#<%=ListBox1.ClientID %>').val();

                $('#<%=lnkEntityDetails.ClientID %>').attr('target', '_blank');
                $('#<%=lnkEntityDetails.ClientID %>').attr('href', $text);
            }

            else {
                // alert('null');
                $('#<%=lnkEntityDetails.ClientID %>').attr('target', '_self');
                $('#<%=lnkEntityDetails.ClientID %>').attr('href', '');
            }

        });



    })
</script>

<asp:Panel id="ddlContainer" runat="server" CssClass="divListBoxMode">
    <table>
        <tr>
            <td>
                              <div class="divListBoxMode">
                                <asp:DropDownList runat="server" ID="ListBox1" AutoPostBack="false"
                                OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" CssClass="ListBoxMaxWidth">
<%--                                                                        <asp:ListItem Text="-- All --" Value="" Selected="true"/>--%>
                                </asp:DropDownList>
                            </div>    
            </td>
            <td>
                <table>
                        <tr>
                            <td class="tdVerticalAlignMiddle">
                                <asp:HyperLink ID="lnkEntityNew" runat="server" Target="_blank" NavigateUrl="">
                                    <asp:Image ID="imgEntityNew" runat="server" CssClass="imgHeaderSmall" ImageUrl="~/DynamicData/Content/Images/ui/fk_add_item.png" />
                                </asp:HyperLink>
                            </td>                            
                            <td class="tdVerticalAlignMiddle">
                                <asp:HyperLink ID="lnkEntityDetails" runat="server" NavigateUrl="">
                                    <asp:Image ID="imgEntityDetails" runat="server" CssClass="imgHeaderSmall" ImageUrl="~/DynamicData/Content/Images/ui/fk_old_details_find.png" />
                                </asp:HyperLink>
                            </td>
                            <td class="tdVerticalAlignMiddle">
                                <asp:LinkButton ID="lnkEntityRefresh" runat="server" 
                                    onclick="lnkEntityRefresh_Click" ToolTip="refresh" ValidationGroup="NoValidation">
                                <asp:Image ID="imgEntityRefresh" runat="server" CssClass="imgHeaderSmall" ImageUrl="~/DynamicData/Content/Images/ui/fk_refresh.png" />
                                </asp:LinkButton>
                            </td>
                        </tr>
               </table> 
            </td>
        </tr>
    </table>
</asp:Panel>