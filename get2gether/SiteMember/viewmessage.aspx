<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember/design.master" AutoEventWireup="true" CodeFile="viewmessage.aspx.cs" Inherits="SiteMember_viewmessage" %>

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
<div style="width: 783px">
    <asp:ImageButton ID="ImageButton2" runat="server" 
        PostBackUrl="~/SiteMember/message.aspx" ImageUrl="~/images/searchfri.png" 
        Width="400px" />
        <hr />
    <asp:Label ID="Label3" runat="server" Text="No Message Found !!!" CssClass="lb"></asp:Label>
</div>
 
<div>
    <asp:DataList ID="DataList1" runat="server">

    <HeaderTemplate>
    <table width="783">
    </HeaderTemplate>
    <ItemTemplate>
         
         <tr>
            <td rowspan="6" width="120px" style="text-align: left; vertical-align: top">
                <asp:Image ImageUrl='<%# Eval("photo") %>' Height="100px" Width="100px" ID="Image2" runat="server" />
            </td>
            <td colspan="2" style="font-family: calibri; font-size: large; font-weight: bold; color: #000000; width: 560px; text-transform: capitalize;">
                <%# Eval("first_name") %>&nbsp;<%# Eval("Last_name") %></td>
            
         </tr>
         
         <tr>
            <td colspan="2" style="font-family: calibri; width: 560px; color: #0000CC;">
                Message:
            </td>
         </tr>

         <tr>
            <td colspan="2" style="font-family: Calibri; color: #000000; background-color: #BCD2FE;">
               
                <%# Eval("message") %>
            </td>
         </tr>
         
         <tr>
            <td colspan="2" style="font-family: calibri; color:#0000CC">Date: 
                <%# Eval("senddate") %>
            </td>
         </tr>
         <tr>
            <td width="783px" colspan="2">
                <hr />
            </td>
            </tr>

         <tr>
            <td style="text-align: left; width: 100px;">
                <asp:Button ID="Button3" runat="server" OnCommand="Button1_command" CommandName='<%# Eval("user_name") %>'  Text="Reply" Width="100" />
            </td>
            <td style="text-align: left; width: 460px;">
                <asp:Button ID="Button4" runat="server" OnCommand="Button2_command" CommandName='<%# Eval("id") %>' Text="Delete"  Width="100" OnClientClick="return confirm('Really delete message...?')" />
            </td>
  </tr>
            <tr>
            <td width="783px" colspan="3">
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




