<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember/design.master" AutoEventWireup="true" CodeFile="upload.aspx.cs" Inherits="SiteMember_upload" %>

<%@ Register src="HomeMenu.ascx" tagname="HomeMenu" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style3
        {
            height: 30px;
        }
    </style>
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
    <asp:Label ID="Label1" runat="server" Text="Label" CssClass="lb"></asp:Label>&nbsp;<asp:Label 
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
    <table width="784">
        <tr>
            <td class="style3" width="400">
&nbsp;&nbsp;
    <asp:FileUpload ID="FileUpload1" runat="server" style="width: 217px" BorderStyle="Solid" 
                    BorderWidth="1px" Font-Names="Calibri" Height="26px" Width="400px" />
            </td>
            <td class="style3">
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Upload" 
                    Width="100px" />
            </td>
        </tr>
        <tr>
            <td>
&nbsp;&nbsp;
    <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <br />
&nbsp;&nbsp;
    <br />
    &nbsp;&nbsp; 
</asp:Content>

