<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember/design.master" AutoEventWireup="true" CodeFile="aboutus.aspx.cs" Inherits="SiteMember_aboutus" %>

<%@ Register src="HomeMenu.ascx" tagname="HomeMenu" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderLeft" Runat="Server">
    <asp:ImageButton ID="ImageButton1" runat="server" 
        onclick="ImageButton1_Click" Height="135px" Width="150px" />
    <br />
    <asp:Label ID="Label1" runat="server" Text="Label" CssClass="lb"></asp:Label>
    &nbsp;<asp:Label 
         ID="Label2" runat="server" Text="Label" CssClass="lb"></asp:Label>
    <br />
    <uc1:HomeMenu ID="HomeMenu1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderRight" Runat="Server">
   <div> 
       <table width="780">
           <tr>
               <td width="200">
                   <asp:Image ID="Image2" runat="server" ImageUrl="~/images/a1.PNG" Height="170px" 
                       Width="200px" />
               </td>
               <td width="390">
                   <table width="570" class="name">
                       <tr>
                           <td width="80">
                               Name:</td>
                           <td width="450">
                               Roopam Jain</td>
                       </tr>
                       <tr>
                           <td>
                                        School:</td>
                                    <td>
                                        government girls senior secondary school salumber.</td>
                       </tr>
                       <tr>
                                    <td>
                                        College:</td>
                           <td>
                                        techno india nJR institute of technology udaipur(raj).</td>
                       </tr>
                       <tr>
                           <td>
                               Phone no:</td>
                           <td>
                                        9468967574</td>
                       </tr>
                       <tr>
                           <td>
                                        e-mail:</td>
                           <td class="email">
                                        roopamjain01@gmail.com</td>
                       </tr>
                   </table>
               </td>
           </tr>
           <tr>
           <td colspan="3">
               <hr />
           </td></tr>
           <tr>
               <td width="200">
                   <asp:Image ID="Image3" runat="server" ImageUrl="~/images/a2.PNG" Height="170px" 
                       Width="200px" />
               </td>
               <td>
                   <table width="570" class="name">
                       <tr>
                           <td width="80">
                               Name:</td>
                           <td width="450">
                               ronak dak</td>
                       </tr>
                       <tr>
                           <td>
                                        School:</td>
                                    <td>
                                        cPS</td>
                       </tr>
                       <tr>
                                    <td>
                                        College:</td>
                           <td>
                                        techno india nJR institute of technology udaipur(raj).</td>
                       </tr>
                       <tr>
                           <td>
                               Phone no:</td>
                           <td>
                               9414726969</td>
                       </tr>
                       <tr>
                           <td>
                                        e-mail:</td>
                           <td class="email">
                               ronakdak@gmail.com</td>
                       </tr>
                   </table>
               </td>
           </tr>
       </table>
</div>
</asp:Content>

