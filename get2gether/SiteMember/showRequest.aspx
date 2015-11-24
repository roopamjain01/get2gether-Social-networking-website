<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember/design.master" AutoEventWireup="true" CodeFile="showRequest.aspx.cs" Inherits="SiteMember_showRequest" %>

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
        &nbsp;<asp:DataList ID="DataList1" runat="server">
         

    <HeaderTemplate>
    <table width="783px">
    
    </HeaderTemplate>
    <ItemTemplate>
         <tr>
           <td style="width: 150px">
             <asp:Image ImageUrl='<%# Eval("photo") %>'  Height="100px" Width="120px" ID="Image1" runat="server" />
          </td>
        
         <td style="width: 200px; text-transform: capitalize; font-family: Calibri;">
        <%# Eval("First_name") %> &nbsp; <%# Eval("Last_name") %>

       </td>
       <td width="230px">
           <asp:Button ID="Button1" runat="server" OnCommand="Button1_command"  CommandName='<%# Eval("username") %>' Text="Accept" Width="100" OnClientClick="return confirm('Do you want to Accept Friend request ?')" />
           <asp:Button ID="Button2" runat="server" OnCommand="Button2_command"  CommandName='<%# Eval("username") %>' Text="Reject" Width="100px" OnClientClick="return confirm('Do you want to Reject Friend request ?')" />
          </td>
    </tr>
    <tr>
    <td colspan="3">
        <hr />
    </td></tr>
     
    
    </ItemTemplate>
    <FooterTemplate>
    </table>
  
    </FooterTemplate>


    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>
       
        <br />
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <asp:Label ID="Label3" runat="server" Text="Label" Font-Names="Calibri"></asp:Label>
        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
        </div>
</asp:Content>

