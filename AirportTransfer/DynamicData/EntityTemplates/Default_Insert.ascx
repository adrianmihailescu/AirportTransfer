﻿<%@ Control Language="C#" CodeBehind="Default_Insert.ascx.cs" Inherits="AirportTransfer.Default_InsertEntityTemplate" %>

<%@ Reference Control="~/DynamicData/EntityTemplates/Default.ascx" %>

        <asp:EntityTemplate runat="server" ID="EntityTemplate1">
    <ItemTemplate>
        <tr class="InsertEditForms">
            <td>
                <asp:Label ID="Label1" runat="server" OnInit="Label_Init" OnPreRender="Label_PreRender" />
            </td>
            <td>
                <asp:DynamicControl runat="server" ID="DynamicControl" Mode="Insert" OnInit="DynamicControl_Init" />
            </td>
        </tr>
    </ItemTemplate>
</asp:EntityTemplate>

