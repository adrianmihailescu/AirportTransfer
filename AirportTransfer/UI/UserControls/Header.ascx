<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="AirportTransfer.UI.UserControls.Header" %>

            <link rel="Stylesheet" type="text/css" href="../../UI/Scripts/datepicker/css/ui-lightness/jquery-ui-1.10.1.custom.css" />
            <link rel="Stylesheet" type="text/css" href="../../UI/Css/Site.css" />

<table>
    <tr>
        <td>
            <table>
                <tr>
                    <td align="center">
                                                                <table>
                                                                    <tr>
                                                                        <td align="center">
                                                                            <asp:HyperLink ID="HyperLink1" NavigateUrl="~/" runat="server">
                                                                                <asp:Image ID="imgHome" runat="server" ImageUrl="~/DynamicData/Content/Images/ui/Home-icon6173.png" CssClass="imgHeader" ToolTip="Home" />
                                                                            </asp:HyperLink>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:HyperLink ID="lnkHome" Text="Home" NavigateUrl='<%$ AppSettings:MainPageLinkHome %>' runat="server"></asp:HyperLink> 
                                                                        </td>
                                                                    </tr>
                                                                </table>                                                                                                                       
                                                            </td>
                </tr>
            </table>
        </td>
        <td>
                <table style="width: 100%; table-layout:fixed">
                                                        <tr>                                                            
                                                            <td align="center">
                                                                <table>
                                                                    <tr>
                                                                        <td align="center">
                                                                            <asp:HyperLink ID="HyperLink3" NavigateUrl='<%$ AppSettings:MainPageLinkFlight %>' runat="server">
                                                                                <asp:Image ID="imgFight" runat="server" ImageUrl="~/DynamicData/Content/Images/ui/air_tickets.png" CssClass="imgHeader" />
                                                                            </asp:HyperLink>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:HyperLink ID="lnkFlight" Text="Flights" NavigateUrl='<%$ AppSettings:MainPageLinkFlight %>' runat="server"></asp:HyperLink>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td align="center">
                                                                <table>
                                                                    <tr>
                                                                        <td align="center">
                                                                            <asp:HyperLink ID="HyperLink2" NavigateUrl='<%$ AppSettings:MainPageLinkAirport %>' runat="server">
                                                                                <asp:Image ID="imgAirport" runat="server" ImageUrl="~/DynamicData/Content/Images/ui/plane.png" CssClass="imgHeader" />
                                                                            </asp:HyperLink>    
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:HyperLink ID="lnkAirport" Text="Airports" NavigateUrl='<%$ AppSettings:MainPageLinkAirport %>' runat="server"></asp:HyperLink>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td align="center">
                                                                <table>
                                                                    <tr>
                                                                        <td align="center">
                                                                            <asp:HyperLink ID="HyperLink5" NavigateUrl='<%$ AppSettings:MainPageLinkAirLine %>' runat="server">
                                                                                <asp:Image ID="imgAirLine" runat="server" ImageUrl="~/DynamicData/Content/Images/ui/Travel-Airplane-icon.png" CssClass="imgHeader" />
                                                                            </asp:HyperLink>    
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:HyperLink ID="lnkAirLine" Text="Air Lines" NavigateUrl='<%$ AppSettings:MainPageLinkAirLine %>' runat="server"></asp:HyperLink>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td align="center">
                                                                <table>
                                                                    <tr>
                                                                        <td align="center">
                                                                            <asp:HyperLink ID="HyperLink11" NavigateUrl='<%$ AppSettings:MainPageLinkCostCenter %>' runat="server">
                                                                                <asp:Image ID="imgCostCenter" runat="server" ImageUrl="~/DynamicData/Content/Images/ui/emblem-money-2.png" CssClass="imgHeader" />
                                                                            </asp:HyperLink>    
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:HyperLink ID="lnkCostCenter" Text="Cost Centers" NavigateUrl='<%$ AppSettings:MainPageLinkCostCenter %>' runat="server"></asp:HyperLink>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td align="center">
                                                                <table>
                                                                    <tr>
                                                                        <td align="center">
                                                                            <asp:HyperLink ID="HyperLink4" NavigateUrl='<%$ AppSettings:MainPageLinkDelegation %>' runat="server">
                                                                                <asp:Image ID="imgDelegation" runat="server" ImageUrl="~/DynamicData/Content/Images/ui/emblem_library.png" CssClass="imgHeader" />
                                                                            </asp:HyperLink>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:HyperLink ID="lnkDelegation" Text="Delegations" NavigateUrl='<%$ AppSettings:MainPageLinkDelegation %>' runat="server"></asp:HyperLink>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td align="center">
                                                                <table>
                                                                    <tr>
                                                                        <td align="center">
                                                                            <asp:HyperLink ID="HyperLink8" NavigateUrl='<%$ AppSettings:MainPageLinkEmployee %>' runat="server">
                                                                                <asp:Image ID="imgEmployee" runat="server" ImageUrl="~/DynamicData/Content/Images/ui/user-group-icon.png" CssClass="imgHeader" />
                                                                            </asp:HyperLink>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:HyperLink ID="lnkEmployee" Text="Employees" NavigateUrl='<%$ AppSettings:MainPageLinkEmployee %>' runat="server"></asp:HyperLink>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td align="center">
                                                                <table>
                                                                    <tr>
                                                                        <td align="center">
                                                                            <asp:HyperLink ID="HyperLink6" NavigateUrl='<%$ AppSettings:MainPageLinkTaxiBooking %>' runat="server">
                                                                                <asp:Image ID="imgTaxiBooking" runat="server" ImageUrl="~/DynamicData/Content/Images/ui/Rent a car.png" CssClass="imgHeader" />
                                                                            </asp:HyperLink>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:HyperLink ID="lnkTaxiBooking" Text="Bookings" NavigateUrl='<%$ AppSettings:MainPageLinkTaxiBooking %>' runat="server"></asp:HyperLink>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td align="center">
                                                                <table>
                                                                    <tr>
                                                                        <td align="center">
                                                                            <asp:HyperLink ID="HyperLink9" NavigateUrl='<%$ AppSettings:MainPageLinkTaxiCompany %>' runat="server">
                                                                                <asp:Image ID="imgTaxiCompany" runat="server" ImageUrl="~/DynamicData/Content/Images/ui/taxi.png" CssClass="imgHeader" />
                                                                            </asp:HyperLink>  
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:HyperLink ID="lnkTaxiCompany" Text="Companies" NavigateUrl='<%$ AppSettings:MainPageLinkTaxiCompany %>' runat="server"></asp:HyperLink>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                </tr>
            </table>    
        </td>
        <td>
            <table>
                <tr>
                                                                                <td align="center">
                                                                <table>
                                                                    <tr>
                                                                        <td align="center">
                                                                            <asp:HyperLink ID="HyperLink7" NavigateUrl='<%$ AppSettings:MainPageLinkHelp %>' Target="_blank" runat="server">
                                                                                <asp:Image ID="imgHelp" runat="server" ImageUrl="~/DynamicData/Content/Images/ui/question1.png" CssClass="imgHeader" ToolTip="Help" />
                                                                            </asp:HyperLink>                                                                            
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:HyperLink ID="lnkHelp" Text="Help" NavigateUrl='<%$ AppSettings:MainPageLinkHelp %>' runat="server"></asp:HyperLink>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:Image ID="imgShadow" runat="server" ImageUrl="~/DynamicData/Content/Images/ui/shadow875.png" class="shadowImageHeader" />
        </td>
    </tr>
</table>