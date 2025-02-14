<%@ Control Language="C#" CodeBehind="Enumeration.ascx.cs" Inherits="AirportTransfer.EnumerationFilter" %>

<table>
    <tr>
        <td>
            <asp:DropDownList runat="server" ID="DropDownList1" AutoPostBack="false"
                OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem Text="All" Value=""></asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>   
            </asp:DropDownList>    
        </td>
    </tr>
</table>

