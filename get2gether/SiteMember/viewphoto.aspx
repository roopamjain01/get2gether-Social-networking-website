<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember/design.master" AutoEventWireup="true" CodeFile="viewphoto.aspx.cs" Inherits="SiteMember_viewphoto" %>
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
        <div class="contentright">
        
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [photoid], [photo] FROM [photo] WHERE ([albumid] = @albumid)">
            <SelectParameters>
                <asp:QueryStringParameter Name="albumid" QueryStringField="albumid" 
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
         
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" Width="784px" 
                RepeatColumns="1">
        <ItemTemplate>
               
        <br />
        &nbsp; &nbsp; &nbsp;
            <asp:Image ID="Image1" ImageUrl='<%# Eval("photo") %>' Height="350px" Width="550px"  runat="server" BorderStyle="Outset" BorderWidth="2px" />
            <br />
            <br />
            
        </ItemTemplate>
    </asp:DataList>
    </div>
</asp:Content>

