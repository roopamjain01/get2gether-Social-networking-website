<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember/design.master" AutoEventWireup="true" CodeFile="viewproalbum.aspx.cs" Inherits="SiteMember_viewproalbum" %>

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
        <asp:DataList ID="DataList1" runat="server" DataKeyField="albumid"   
            DataSourceID="sqldatasource" RepeatDirection="Horizontal" Height="170px" 
            Width="200px" RepeatColumns="4" ToolTip="View Album" >
            <ItemTemplate>
                <asp:ImageButton ImageUrl='<%# Eval("albumphoto") %>'  Height="150" Width="180" OnCommand="button_command" CommandName='<%# Eval("albumid") %>' ID="ImageButton2" runat="server" ToolTip="Open Album" ForeColor="#003399" BackColor="#FFCCFF" BorderColor="#000066" BorderStyle="Outset" BorderWidth="1px" />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="sqldatasource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>"        
            
                 SelectCommand="SELECT [albumid], [albumname], [albumphoto] FROM [albumphoto] WHERE username=@username" 
                 onselecting="sqldatasource_Selecting">
            <SelectParameters>
                <asp:SessionParameter Name="username" SessionField="info1_username" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

