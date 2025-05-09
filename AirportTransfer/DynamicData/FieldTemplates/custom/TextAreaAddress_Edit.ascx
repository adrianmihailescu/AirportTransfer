﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TextAreaAddress_Edit.ascx.cs" Inherits="AirportTransfer.DynamicData.FieldTemplates.custom.TextAreaAddress_Edit" %>


            <script type="text/javascript" language="javascript" src="../../../UI/Scripts/datepicker/js/jquery-1.9.1.min.js"></script>
            <script type="text/javascript" language="javascript" src="../../../UI/Scripts/datepicker/js/jquery-ui.min.js"></script>
            <script type="text/javascript" language="javascript" src="../../../UI/Scripts/general/global.js"></script>


                <script language="javascript" type="text/javascript">

                    $(document).ready(function () {
                        $('#<%=lnkShowLocationOnMap.ClientID %>').attr('target', '_blank');

                        ///////
                        $('#<%=lnkShowLocationOnMap.ClientID %>').click(function () {

                            var s = $('#<%=TextBoxAddress.ClientID %>').val();
                            var fullLocation = 'http://maps.google.com/?q=' +  s; 

                            $('#<%=lnkShowLocationOnMap.ClientID %>').attr('href', fullLocation)
                        });
                        ///////

                    });
    </script>

  <%--start google maps--%>
  <script type="text/javascript" language="javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
<script type="text/javascript" language="javascript">

    function Initialize() {
        try {

            var mapOptions = {
                center: new google.maps.LatLng(0, 0),
                zoom: 13,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var map = new google.maps.Map(document.getElementById('<%=googleMapsContainer.ClientID %>'), mapOptions);

            
            var input = document.getElementById('<%=TextBoxAddress.ClientID %>');

            var autocomplete = new google.maps.places.Autocomplete(input);
            autocomplete.bindTo('bounds', map);

        }

        catch (error) {
            alert(error);
        }
    }
    google.maps.event.addDomListener(window, 'load', Initialize);

</script>

<%--end google maps--%>

<table>
    <tr>
        <td>
                <asp:TextBox ID="TextBoxAddress" runat="server" Text="<%# FieldValueEditString %>" 
            Columns="10" TextMode="MultiLine" CssClass="TextAreaEdit" ></asp:TextBox>    
        </td>
        <td>
            <asp:Panel id="googleMapsContainer" style="display: none" runat="server">
            </asp:Panel>
        </td>
        <td>
            <asp:LinkButton ID="lnkShowLocationOnMap" runat="server" ValidationGroup="NoValidation">
                <asp:Image ID="imgShowLocationOnMap" CssClass="imgHeaderSmall"
                ToolTip="Show location on Google Maps"
                ImageUrl="~/DynamicData/Content/Images/ui/Google-Maps-icon.png" runat="server" />
                </asp:LinkButton>
        </td>
        <td>
            (*)
        </td>
        <td>
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="TextBoxAddress" Display="Static" Enabled="false" ForeColor="Red" />
            <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ControlToValidate="TextBoxAddress" Display="Static" Enabled="false" ForeColor="Red" />
            <asp:DynamicValidator runat="server" ID="DynamicValidator1" ControlToValidate="TextBoxAddress" Display="Static" ForeColor="Red" />  
        </td>
    </tr>
</table>
