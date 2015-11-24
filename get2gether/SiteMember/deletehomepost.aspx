<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember/design.master" AutoEventWireup="true" CodeFile="deletehomepost.aspx.cs" Inherits="SiteMember_deletehomepost" %>

<%@ Register src="HomeMenu.ascx" tagname="HomeMenu" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
                    <asp:Label ID="Label1" runat="server" Text="Label" CssClass="lb"></asp:Label>
                    &nbsp;<asp:Label 
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

    
       <asp:Button ID="Button2" runat="server" 
           PostBackUrl="~/SiteMember/deletepost.aspx" Text="Delete Photo Post" />

    
       <asp:DataList ID="DataList1" runat="server">

    <HeaderTemplate>
    <table width="783">
    </HeaderTemplate>
    <ItemTemplate>
         <tr>
            <td width="800px" colspan="2">
                <hr />
            </td>
            </tr>

         <tr>
            <td rowspan="6" width="120px" style="text-align: left; vertical-align: top">
                <asp:Image ImageUrl='<%# Eval("photo") %>' Height="100px" Width="100px" ID="Image2" runat="server" />
            </td>
            <td colspan="2" style="font-family: calibri; font-size: large; font-weight: bold; color: #000000; width: 560px; text-transform: capitalize;">
                <%# Eval("first_name") %>&nbsp;<%# Eval("Last_name") %></td>
            
         </tr>
         
         <tr>
            <td colspan="2" style="font-family: calibri; width: 560px; color: #0000CC;">
                Post:
            </td>
         </tr>

         <tr>
            <td colspan="2" style="font-family: Calibri; color: #000000; background-color: #BCD2FE;">
               
                <%# Eval("post") %>
            </td>
         </tr>
         
         
         <tr>
            <td colspan="2" style="font-family: calibri; color:#0000CC">Date: 
                <%# Eval("date") %>
            </td>
         </tr>
         
         <tr>
         <td>
             <asp:Button ID="Button1" runat="server" CommandName='<%# Eval("id") %>'  OnCommand="Button1_command" Text="Delete" Width="100" OnClientClick="return confirm('Do you want to delete Post...?')" />
           </td>
           </tr>
         
       
         
    </ItemTemplate>
    <FooterTemplate>
    </table>
  
    </FooterTemplate>

    </asp:DataList>
</div>
</asp:Content>

