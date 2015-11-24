<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember/design.master" AutoEventWireup="true" CodeFile="friend.aspx.cs" Inherits="SiteMember_friend" %>

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
<div class="contentright" style="width: 784px">

    <asp:Label ID="Label3" runat="server" ForeColor="#990000" Text="Label" 
        Font-Names="Calibri"></asp:Label>
    <asp:LinkButton ID="LinkButton2" runat="server" Font-Names="Calibri" 
        PostBackUrl="~/SiteMember/friendlist.aspx">Find Friend</asp:LinkButton>
    <br />

<asp:DataList ID="DataList2" runat="server" Width="784px" >

    <HeaderTemplate>
    <table width="785">
    
    </HeaderTemplate>
    <ItemTemplate>
         <tr>
           <td style="width: 130px">
             <asp:Image ImageUrl='<%# Eval("photo") %>'  Height="100" Width="120" ID="Image1" runat="server" />
          </td>
         <td style="width: 180px; font-family: calibri; font-size: large; text-transform: capitalize;">
        <%# Eval("First_name") %>&nbsp;<%# Eval("Last_name") %></td>
        <td width="120">
             <asp:Button ID="Button1" runat="server" CommandName='<%# Eval("user_name")%>' OnCommand="Button1_command" Text="View Profile" />
             </td>
             <td width="400">
             <asp:Button ID="Button2" runat="server"  CommandName='<%# Eval("user_name")%>' OnCommand="Button2_command" Text="Send Message" />
           </td>
           
           </tr>
           <tr>
           <td colspan="4">
           <hr />
           </td>
           </tr>
     
    
    </ItemTemplate>

    <FooterTemplate>
    </table>
  
    </FooterTemplate>

    </asp:DataList>
   
       </div>
</asp:Content>

