<%@ Page Title="" Language="C#" MasterPageFile="~/onlinephone/Site.master" AutoEventWireup="true" CodeFile="delete.aspx.cs" Inherits="delete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="style1">
        <tr>
            <td style="font-family: Calibri; font-size: large" width="120">
                <asp:Label ID="Label4" runat="server" Text="Enter Name :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBox4" ErrorMessage="Enter Name..."></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="Button5" runat="server" Text="Delete" onclick="Button5_Click" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="font-family: calibri; font-size: x-large; font-weight: bold; color: #0000FF">
                &nbsp;</td>
            <td style="font-family: calibri; font-size: x-large; font-weight: bold; color: #0000FF">
                <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

