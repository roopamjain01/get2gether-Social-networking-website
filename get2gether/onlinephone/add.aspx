<%@ Page Title="" Language="C#" MasterPageFile="~/onlinephone/Site.master" AutoEventWireup="true" CodeFile="add.aspx.cs" Inherits="add" %>

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
        <td style="font-family: Calibri; font-size: large; text-transform: capitalize; text-align: left; width: 120px;">
            <asp:Label ID="Label1" runat="server" Text="Name :"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="name" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ErrorMessage="Enter Name..." ControlToValidate="name"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td style="font-family: Calibri; font-size: large; text-transform: capitalize; text-align: left; width: 120px;">
            <asp:Label ID="Label2" runat="server" Text="Number :"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="number" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ErrorMessage="Enter Number..." ControlToValidate="number"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
                &nbsp;</td>
        <td>
            <asp:Button ID="Button1" runat="server" Text="Add" onclick="Button1_Click" />
        </td>
    </tr>
    <tr>
        <td>
                &nbsp;</td>
        <td style="font-family: Calibri; font-weight: bold; font-size: x-large; color: #0000FF">
            <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
        </td>
    </tr>
</table>
</asp:Content>

