<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember/design.master" AutoEventWireup="true" CodeFile="cpassword.aspx.cs" Inherits="SiteMember_cpassword" %>

<%@ Register src="HomeMenu.ascx" tagname="HomeMenu" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderLeft" Runat="Server">
 <div>
 <table width="210px" cellpadding="0" cellspacing="0">
    
     <tr>
     <td>
    <asp:ImageButton ID="ImageButton1" runat="server" 
        onclick="ImageButton1_Click" Height="135px" Width="150px" />

    <br />

<br />
   </td>
     </tr>   
    
<tr>
<td>
    <asp:Label ID="Label3" runat="server" Text="Label" CssClass="lb"></asp:Label>&nbsp;<asp:Label 
         ID="Label2" runat="server" Text="Label" CssClass="lb"></asp:Label>
     <br />
   
        </td>
     </tr>
       
 <tr>
 <td>
     <uc1:HomeMenu ID="HomeMenu1" runat="server" />
     
     </td>
     </tr>
     </table>
    </div>
    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderRight" Runat="Server">
<div style="width: 783px">
    <table id="ch_pass" style="font-family: calibri; text-transform: capitalize">
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
                New Password: </td>
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
                <asp:TextBox ID="cfm_txt" runat="server" Width="250px" TextMode="Password"></asp:TextBox>
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
                    onclick="submit_btn_Click" ValidationGroup="ch_pass" Font-Names="Calibri" 
                    onclientclick="return confirm('Do you want to change Password...?')" 
                    Width="100px" />
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
</div>
 
</asp:Content>

