<%@ Control Language="C#" CodeBehind="Boolean.ascx.cs" Inherits="AirportTransfer.BooleanFilter" %>

<table>
    <tr>
            <td>
                <asp:Panel ID="pnlRadioValues" runat="server">
                    <table>
                        <tr>
                            <td class="tdVerticalAlignMiddle">
                                    <asp:RadioButton GroupName="BooleanValue" ID="radioBooleanValueAll" runat="server" 
                                Checked="true" oncheckedchanged="radioBooleanValueAll_CheckedChanged" />
                            </td>
                            <td class="tdVerticalAlignMiddle">
                                all
                            </td>
                            <td>
                                &nbsp;&nbsp;&nbsp;
                            </td>
                            <td class="tdVerticalAlignMiddle">
                                    <asp:RadioButton GroupName="BooleanValue" ID="radioBooleanValueYes" runat="server" 
                                oncheckedchanged="radioBooleanValueYes_CheckedChanged" />                                
                            </td>
                            <td class="tdVerticalAlignMiddle">
                                <asp:Image ID="imgBooleanValueYes" runat="server" ImageUrl="~/DynamicData/Content/Images/ui/ok.png" CssClass="imgHeaderVerySmall" />
                            </td>
                            <td>
                                &nbsp;&nbsp;&nbsp;
                            </td>
                            <td class="tdVerticalAlignMiddle">
                                <asp:RadioButton GroupName="BooleanValue" ID="radioBooleanValueNo" runat="server" 
                            oncheckedchanged="radioBooleanValueNo_CheckedChanged" />
                            </td>
                            <td class="tdVerticalAlignMiddle">
                                <asp:Image ID="imgBooleanValueNo" runat="server" ImageUrl="~/DynamicData/Content/Images/ui/checkbox_unchecked.png" CssClass="imgHeaderVerySmall" />
                            </td>
                            <td>
                                &nbsp;&nbsp;&nbsp;
                            </td>
                            <td class="tdVerticalAlignMiddle">
                                <asp:RadioButton GroupName="BooleanValue" ID="radioBooleanValueNotSet" 
                            runat="server" oncheckedchanged="radioBooleanValueNotSet_CheckedChanged" /> 
                            </td>
                            <td class="tdVerticalAlignMiddle">
                                not set
                            </td>
                        </tr>
                    </table>                          
                </asp:Panel>  
         </td>
    </tr>
</table>

