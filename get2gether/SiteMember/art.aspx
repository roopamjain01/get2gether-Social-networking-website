<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember/design.master" AutoEventWireup="true" CodeFile="art.aspx.cs" Inherits="art" %>

<%@ Register src="editprofile.ascx" tagname="editprofile" tagprefix="uc2" %>

<%@ Register src="editprofile.ascx" tagname="editprofile" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderLeft" Runat="Server">
   <div> 
    <table width="100%" frame="border">
        <tr>
            <td>
                <asp:Image ID="Image1" runat="server" Height="135px" Width="150px" />
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
  
   
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderRight" Runat="Server">
    
<table width="745px">
      <tr>
         <td width="30%" style="font-family: Calibri; font-style: normal">
             Music :</td>
         <td style="font-family: Calibri; font-style: normal">
             <asp:TextBox ID="music_txt" runat="server" Width="280px"></asp:TextBox>
             
         </td>
     
     </tr>
      <tr>
         <td colspan="2" class="style2" style="font-family: calibri; font-style: normal">
            <hr />
        </td>
      </tr>
      <tr>
         <td style="font-family: calibri; font-style: normal">
             Books :</td>
         <td style="font-family: calibri; font-style: normal">
             <asp:TextBox ID="book_txt" runat="server" Width="280px"></asp:TextBox>
            
         </td>
     </tr>
     <tr>
         <td colspan="2" style="font-family: calibri; font-style: normal">
            <hr />
        </td>
      </tr>
      
      <tr>
         <td style="font-family: calibri; font-style: normal" >
             Movies :</td>
         <td style="font-family: calibri; font-style: normal" >
             <asp:TextBox ID="movie_txt" runat="server" Width="280px"></asp:TextBox>
             
         </td>
     </tr>
     <tr>
         <td colspan="2" style="font-family: calibri; font-style: normal">
             <hr />
        </td>
      </tr>
      
      <tr>
         <td style="font-family: calibri; font-style: normal">
             Television :</td>
         <td style="font-family: calibri; font-style: normal">
             <asp:TextBox ID="tele_txt" runat="server" Width="280px"></asp:TextBox>
            
         </td>
     </tr>
     <tr>
         <td colspan="2">
            <hr />
        </td>
      </tr>
      
      <tr>
         <td style="font-family: calibri; font-style: normal">
             Games :</td>
         <td>
             <asp:TextBox ID="game_txt" runat="server" Width="280px"></asp:TextBox>
             
         </td>
     </tr>
     <tr>
         <td colspan="2">
            <hr />
        </td>
      </tr>
      <tr>
         <td width="30%">
         <td>
            <asp:Button ID="savechanges_btn" runat="server" Text="Next &gt;&gt;" 
                onclick="savechanges_btn_Click" style="height: 26px" Width="120px" />
         </td>
         </td> 
     </tr>
      
</table>

</asp:Content>

