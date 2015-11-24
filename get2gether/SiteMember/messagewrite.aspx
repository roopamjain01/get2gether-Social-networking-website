<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember/design.master" AutoEventWireup="true" CodeFile="messagewrite.aspx.cs" Inherits="SiteMember_messagewrite" %>

<%@ Register src="HomeMenu.ascx" tagname="HomeMenu" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderLeft" Runat="Server">
 <div>
 <table width="210px" cellpadding="0" cellspacing="0" frame="rhs">
    
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
    <p>
        <br />
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderRight" Runat="Server">
        <table width="783">
            <tr>
                <td width="150px" style="font-family: calibri; font-style: normal">
                    To :</td>
                <td style="font-family: calibri; font-style: normal">
                    <asp:TextBox ID="to_txt" runat="server" Width="300px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="font-family: calibri; font-style: normal">
                    Message :</td>
                <td style="font-family: calibri; font-style: normal">
                    <asp:TextBox ID="message_txt" runat="server" Width="300px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
            <td colspan="2">
            <hr />
            </td>
            </tr>
            <tr>
                <td align="right" style="font-family: calibri; font-style: normal">
                    <asp:Button ID="send_btn" runat="server" onclick="send_btn_Click" Text="Send" 
                        Width="100px" />
                </td>
                <td style="font-family: calibri; font-style: normal">
                    &nbsp;&nbsp;
                    <asp:Button ID="cancle_txt" runat="server" onclick="cancle_txt_Click" 
                        Text="Cancel" Width="100px" />
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="right" style="font-family: calibri; font-style: normal">
                    &nbsp;</td>
                <td style="font-family: calibri; font-style: normal">
                    <asp:Label ID="Label1" runat="server" EnableViewState="False" Text="Label"></asp:Label>
                </td>
            </tr>
        </table>
      
</asp:Content>

