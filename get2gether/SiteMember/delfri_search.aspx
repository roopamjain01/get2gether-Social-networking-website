<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember/design.master" AutoEventWireup="true" CodeFile="delfri_search.aspx.cs" Inherits="SiteMember_delfri_search" %>

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
    <div style="width: 785px">
    <table width="783px">
        <tr>
            <td width="150px" style="text-transform: capitalize; font-family: calibri">
&nbsp; Search Friend:</td>
            <td width="250px">
                <asp:TextBox ID="TextBox1" runat="server" Width="250px"></asp:TextBox>
            </td>
            <td width="600px">
                <asp:ImageButton ID="ImageButton2" runat="server" 
                    ImageUrl="~/images/Picture1.png" 
                    Height="25px" onclick="ImageButton2_Click" />
            </td>
        </tr>
         </tr>
                        <tr>
                        <td colspan="3">
                        <hr />
                        </td>
                        </tr>
        <tr>
            <td colspan="3">
                &nbsp;
                <asp:Label ID="Label3" runat="server" Font-Names="Calibri" Text="Label"></asp:Label>
                <asp:DataList ID="DataList2" runat="server">
                    <HeaderTemplate>
                        <table width="784px">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td style="width: 130px">
                                <asp:Image ImageUrl='<%# Eval("photo") %>'  Height="100" Width="120" ID="Image1" runat="server" />
                            </td>
                            <td style="width: 200px; font-family: calibri; font-size: large; text-transform: capitalize;">
                                <%# Eval("First_name") %>&nbsp;<%# Eval("Last_name") %></td>
                            <td style="width: 400px">
                                <asp:Button ID="Button1" runat="server" OnCommand="Button1_command" CommandName='<%# Eval("user_name")%>' Text="Delete" Width="100" OnClientClick="return confirm ('Do you want to delete Friend...?')" />
                            </td>
                        </tr>
                        <tr>
                        <td colspan="3">
                        <hr />
                        </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:DataList>
             </td>
        </tr>
    </table>
    </div>
</asp:Content>

