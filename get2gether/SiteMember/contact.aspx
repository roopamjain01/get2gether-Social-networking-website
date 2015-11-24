<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember/design.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="contact" %>


<%@ Register src="editprofile.ascx" tagname="editprofile" tagprefix="uc3" %>

<%@ Register src="editprofile.ascx" tagname="editprofile" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderLeft" Runat="Server">
   
    <table width="100%">
        <tr>
            <td>
                <asp:Image ID="Image2" runat="server" Height="135px" Width="150px" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Label" Font-Bold="True" 
                    CssClass="lb"></asp:Label>
            &nbsp;<asp:Label ID="Label2" runat="server" CssClass="lb" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <uc1:editprofile ID="editprofile1" runat="server" />
                <br />
                <br />
            </td>
        </tr>
    </table>
   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderRight" Runat="Server">
    <table width="745px">
        <tr>
            <td width="30%" style="font-family: calibri; font-style: normal">
                Email :</td>
            <td width="70%">
                <asp:TextBox ID="email_txt" runat="server" Width="280px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="email_txt" ErrorMessage="Enter in Proper Format" 
                    Font-Names="Calibri" ForeColor="Red" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="font-family: calibri; font-style: normal">
                <hr />
            </td>
        </tr>
        <tr>
            <td style="font-family: calibri; font-style: normal">
                Phones :</td>
            <td>
                <asp:TextBox ID="ph_txt" runat="server" Width="280px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="ph_txt" ErrorMessage="Enter 10 Digit Number" 
                    Font-Names="Calibri" ForeColor="Red" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="font-family: calibri; font-style: normal">
                <hr />
            </td>
        </tr>
        <tr>
            <td style="font-family: calibri; font-style: normal">
                Address :</td>
            <td>
                <asp:TextBox ID="add_txt" runat="server" Width="280px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="font-family: calibri; font-style: normal">
                <hr />
            </td>
        </tr>
        <tr>
            <td style="font-family: calibri; font-style: normal">
                City :</td>
            <td>
                <asp:TextBox ID="city_txt" runat="server" Width="280px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="font-family: calibri; font-style: normal">
                <hr />
            </td>
        </tr>
        <tr>
            <td style="font-family: calibri; font-style: normal">
                &nbsp;</td>
            <td>
            <asp:Button ID="savechanges_btn" runat="server" Text="Save Changes" 
                onclick="savechanges_btn_Click" />
            </td>
        </tr>
    </table>
</asp:Content>

