<%@ Control Language="C#" CodeBehind="Calculator_Edit.ascx.cs" Inherits="AirportTransfer.Calculator_EditField" %>

<script language="javascript" type="text/javascript" src="../../../UI/Scripts/calculator/calculator.js"></script>

<script type="text/javascript" language="javascript">
    function Calculate(v) {
        v = eval(v);

        $('#<%=lblResult.ClientID %>').html(v);
    }


    function UpdateCalculationValue() {
        $('#<%=TextBox1.ClientID %>').keyup(function () {
            // alert($('#<%=TextBox1.ClientID %>').val());
            Calculate($('#<%=TextBox1.ClientID %>').val());
        });

        $('#<%=btnOk.ClientID %>').click(function () {
            // alert($('#<%=lblResult.ClientID %>').html());
            $('#<%=TextBox1.ClientID %>').val($('#<%=lblResult.ClientID %>').html());
        });
    }

    $(document).ready(function () {

        UpdateCalculationValue();

        var prm = Sys.WebForms.PageRequestManager.getInstance();

        prm.add_endRequest(function () {
            UpdateCalculationValue();
        });
    }); 
</script>


    <asp:UpdatePanel ID="pnlDelegationCostCalculator" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="divListBoxMode" title="<%# FieldValueString %>">
                   <table>
                        <tr>
                            <td>
                                    <table>
                                        <tr>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td class="tdVerticalAlignMiddle">
                                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# FieldValueEditString %>'></asp:TextBox>    
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblResult" runat="server"></asp:Label>
                                                        </td>           
                                                        <td class="tdVerticalAlignMiddle">
                                                            <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ControlToValidate="TextBox1" Display="Static" Enabled="false" ForeColor="Red" />
                                                            <asp:DynamicValidator runat="server" ID="DynamicValidator1" ControlToValidate="TextBox1" Display="Static" ForeColor="Red" />    
                                                        </td>
                                                    </tr>
                                                </table>    
                                            </td>
                                            <td>
                                                <asp:Button ID="btnOk" runat="server" Text="Calculate" ValidationGroup="NoValidation" />          
                                            </td>
                                        </tr>
                                    </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                perform simple arithmetic operations
                            </td>
                        </tr>
                   </table>
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>