<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember/design.master" AutoEventWireup="true" CodeFile="album.aspx.cs" Inherits="SiteMember_album" %>

<%@ Register src="HomeMenu.ascx" tagname="HomeMenu" tagprefix="uc2" %>

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

             &nbsp;&nbsp;&nbsp;

             <br />
&nbsp;&nbsp;

             <asp:ImageButton ID="ImageButton3" runat="server" 
                 ImageUrl="~/images/creatalb.png" PostBackUrl="~/SiteMember/album_name.aspx" 
                 Width="250px" onclick="ImageButton3_Click" />
        
        <hr />
       </div>
             <asp:DataList ID="DataList1" runat="server" DataKeyField="albumid"   
            DataSourceID="sqldatasource" RepeatDirection="Horizontal" Height="120px" 
            Width="180px" RepeatColumns="3">
            
            <ItemTemplate>
               
              <asp:ImageButton ImageUrl='<%# Eval("albumphoto") %>'  Height="170" Width="200" OnCommand="button_command" CommandName='<%# Eval("albumid") %>' ID="ImageButton2" runat="server" ToolTip="Open Album" ForeColor="#800029" OnClientClick="return confirm('Do you want to Open Album...?')" />
                &nbsp;&nbsp;     
                &nbsp;&nbsp;     
                &nbsp;  
               <asp:LinkButton ID="LinkButton1" runat="server" Text="ADD MORE PHOTO" OnCommand="button1_command"  CommandName='<%# Eval("albumid") %>' ForeColor="Black"></asp:LinkButton>
           </ItemTemplate>
            </asp:DataList>
        
        <asp:SqlDataSource ID="sqldatasource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>"        
            
                 SelectCommand="SELECT [albumid], [albumname], [albumphoto] FROM [albumphoto] WHERE username=@username" 
                 onselecting="sqldatasource_Selecting">
            <SelectParameters>
                <asp:SessionParameter Name="username" SessionField="username" />
            </SelectParameters>
        </asp:SqlDataSource>
       
    
        
</asp:Content>

