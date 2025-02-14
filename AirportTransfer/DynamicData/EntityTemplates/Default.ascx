<%@ Control Language="C#" CodeBehind="Default.ascx.cs" Inherits="AirportTransfer.DefaultEntityTemplate" %>

<table>
    <asp:EntityTemplate runat="server" ID="EntityTemplate1">
        <ItemTemplate>
                <tr>
                    <td class="tdVerticalAlignMiddleDetails">
                        <asp:Label ID="Label1" runat="server" OnInit="Label_Init" />
                    </td>
                    <td class="tdVerticalAlignMiddle">
                        <asp:DynamicControl ID="DynamicControl1" runat="server" OnInit="DynamicControl_Init" />
                    </td>
                </tr>
        </ItemTemplate>
    </asp:EntityTemplate>
</table>

