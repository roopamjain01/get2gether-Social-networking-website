<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember/design.master" AutoEventWireup="true" CodeFile="album_name.aspx.cs" Inherits="SiteMember_album_name" %>

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
<div>
 <table width="785px">
            
            <tr>
                <td width="20%" style="font-family: calibri; font-style: normal" > &nbsp;&nbsp; Album Name:</td>
                <td >
                    <asp:TextBox ID="name_txt" runat="server" Width="250px"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="name_txt" ErrorMessage="*" 
                        ForeColor="Red" ValidationGroup="am"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="font-family: calibri; font-style: normal"> &nbsp;&nbsp; Place:</td>
                <td >
                    <asp:TextBox ID="loc_txt" runat="server" Width="250px"></asp:TextBox>
                 
                </td>
            </tr>
            <tr>
               <td  colspan="2">
               <hr />
               </td>
           </tr>
           <tr>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" style="width: 217px" />
                </td>
                <td >
                    
                    <asp:Button ID="Button1" runat="server" CssClass="lb" onclick="Button1_Click" 
                        Text="upload" />
                    
                    <asp:Button ID="cancel_btn" runat="server" Text="Cancel" 
                        onclick="cancel_btn_Click1" CssClass="lb"/>
                </td>
            </tr>  
               <tr>
               <td  colspan="2">
               <hr />
               </td>
           </tr>
            <tr>
            <td colspan="2">
                    <asp:Label ID="Label3" runat="server" Text="Label" Font-Names="Calibri"></asp:Label>
                </td>
            </tr>
          
            
            
        </table>
</div>
</asp:Content>

