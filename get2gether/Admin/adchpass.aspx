<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="adchpass.aspx.cs" Inherits="Admin_adchpass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <table id="ch_pass" 
                    style="font-family: calibri; text-transform: capitalize; width: 1000px;">
        <tr>
            <td width="200px">
                Old Password:</td>
            <td>
                <asp:TextBox ID="old_txt" runat="server" Width="250px" TextMode="Password" 
                    Font-Names="Calibri"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="old_txt" ErrorMessage="*" Font-Names="Calibri" 
                    ForeColor="Red" ValidationGroup="ch_pass"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="font-family: calibri; font-style: normal" width="200px">
                New Password: 
            </td>
            <td width="580px">
                <asp:TextBox ID="new_txt" runat="server" Width="250px" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="new_txt" ErrorMessage="*" Font-Names="Calibri" 
                    ForeColor="Red" ValidationGroup="ch_pass"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td width="200px">
                Confirm Password:
            </td>
            <td>
                <asp:TextBox ID="cfm_txt" runat="server" Width="250px" TextMode="Password" >
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="cfm_txt" ErrorMessage="*" Font-Names="Calibri" 
                    ForeColor="Red" ValidationGroup="ch_pass"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="new_txt" ControlToValidate="cfm_txt" 
                    ErrorMessage="Password not matched" Font-Names="Calibri" ForeColor="Red" 
                    ValidationGroup="ch_pass" Width="200px"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <hr />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="submit_btn0" runat="server" Text="Submit" 
                    onclick="submit_btn_Click" ValidationGroup="ch_pass" Width="100px" 
                    onclientclick="return confirm('Save Change Password...?')" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

