<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuickLinks.ascx.cs" Inherits="AirportTransfer.UI.UserControls.QuickLinks" %>
<table>
                        <tr>
                           <td class="tdVerticalAlignMiddle">
                                <asp:Label ID="lblQuickLinks" runat="server" Text="Quick Links"></asp:Label>
                           </td>
                           <td>
                            &nbsp;
                           </td>
                           <td class="tdVerticalAlignMiddle">
                            | new:
                           </td>
                           <td>
                            &nbsp;
                           </td>
                           <td class="tdVerticalAlignMiddle">
                                <asp:HyperLink ID="lnkQuickLinksFlight" runat="server" Text="Flight" NavigateUrl='<%$ AppSettings:DefaultPageLinkFlight %>'></asp:HyperLink>
                           </td>
                           <td>
                            &nbsp;
                           </td>
                           <td class="tdVerticalAlignMiddle">
                                <asp:HyperLink ID="lnkQuickLinksAirport" runat="server" Text="Airport" NavigateUrl='<%$ AppSettings:DefaultPageLinkAirport %>'></asp:HyperLink>
                           </td>
                           <td>
                            &nbsp;
                           </td>
                           <td class="tdVerticalAlignMiddle">
                                <asp:HyperLink ID="lnkQuickLinksAirLine" runat="server" Text="AirLine" NavigateUrl='<%$ AppSettings:DefaultPageLinkAirLine %>'></asp:HyperLink>
                           </td>
                           <td>
                            &nbsp;
                           </td>
                           <td class="tdVerticalAlignMiddle">
                                <asp:HyperLink ID="lnkQuickLinksCostCenter" runat="server" Text="Cost Center" NavigateUrl='<%$ AppSettings:DefaultPageLinkCostCenter %>'></asp:HyperLink>
                           </td>
                           <td>
                            &nbsp;
                           </td>
                           <td class="tdVerticalAlignMiddle">
                                <asp:HyperLink ID="lnkQuickLinksDelegation" runat="server" Text="Delegation" NavigateUrl='<%$ AppSettings:DefaultPageLinkDelegation %>'></asp:HyperLink>
                           </td>
                           <td>
                            &nbsp;
                           </td>
                           <td class="tdVerticalAlignMiddle">
                                <asp:HyperLink ID="lnkQuickLinkEmployee" runat="server" Text="Employee" NavigateUrl='<%$ AppSettings:DefaultPageLinkEmployee %>'></asp:HyperLink>
                           </td>
                           <td>
                            &nbsp;
                           </td>
                           <td class="tdVerticalAlignMiddle">
                                <asp:HyperLink ID="lnkQuickLinksTaxiBooking" runat="server" Text="Taxi Booking" NavigateUrl='<%$ AppSettings:DefaultPageLinkTaxiBooking %>'></asp:HyperLink>
                           </td>
                           <td>
                            &nbsp;
                           </td>
                           <td class="tdVerticalAlignMiddle">
                                <asp:HyperLink ID="lnkQuickLinksTaxiCompany" runat="server" Text="Taxi Company" NavigateUrl='<%$ AppSettings:DefaultPageLinkTaxiCompany %>'></asp:HyperLink>
                           </td>
                        </tr>
            </table>
