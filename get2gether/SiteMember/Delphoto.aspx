﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember/design.master" AutoEventWireup="true" CodeFile="Delphoto.aspx.cs" Inherits="SiteMember_Delphoto" %>

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
            <asp:DataList ID="DataList1" runat="server"
                DataSourceID="sqldatasource1" RepeatDirection="Horizontal" Height="220" 
                Width="250" RepeatColumns="3">            
               <ItemTemplate>
                <asp:Image ID="Image1"  ImageUrl='<%# Eval("photo") %>'  Height="200" Width="250" runat="server" BorderColor="#000066" BorderWidth="1px" BorderStyle="Outset" BackColor="#FFCCFF" />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <asp:Button ID="Button1" runat="server" OnCommand="Button1_command" CommandName='<%# Eval("photoid") %>' Text="Delete" Width="100" OnClientClick="return confirm('Do you want to delete Photo...?')" />
                </ItemTemplate>
            </asp:DataList>    
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>" 
                SelectCommand="SELECT [photoid], [photo], [albumid] FROM [photo] WHERE ([albumid] = @albumid)">
                 <SelectParameters>
                     <asp:SessionParameter DefaultValue="aid" Name="albumid" SessionField="aid" 
                         Type="Int32" />
                 </SelectParameters>
            </asp:SqlDataSource>       
     </div>               
</asp:Content>

