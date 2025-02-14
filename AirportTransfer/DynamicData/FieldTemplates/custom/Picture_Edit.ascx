<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Picture_Edit.ascx.cs" Inherits="AirportTransfer.DynamicData.FieldTemplates.Picture_Edit" %>

<table>
    <tr>
        <td>
            <asp:FileUpload ID="fuEmployeeImage" runat="server" />    
        </td>
        <td>
            &nbsp;&nbsp;
        </td>
        <td>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
    ControlToValidate="fuEmployeeImage" ValidationExpression="^.*\.(jpg|JPG|jpeg|JPEG|bmp|BMP|png|PNG|gif|GIF|tif|TIF|tiff|TIFF)$"
    runat="server" ErrorMessage="Please upload only image files (jpg|jpeg|bmp|png|gif|tif|tiff)." ForeColor="Red">*</asp:RegularExpressionValidator>
        </td>
    </tr>
</table>

    <%--ControlToValidate="fuBookImage" ValidationExpression="^.*\.(jpg|jpeg|bmp|png|gif|tif|tiff)$" --%>
<%--Book.Picture--%>

