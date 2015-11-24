<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember/design.master" AutoEventWireup="true" CodeFile="setting.aspx.cs" Inherits="SiteMember_setting" %>

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
    <br />
    <br />
    <br />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderRight" Runat="Server">
    <asp:ImageButton ID="ImageButton2" runat="server" 
        ImageUrl="~/images/chngpass.jpg.png" PostBackUrl="~/SiteMember/cpassword.aspx" 
        Width="250px" />
    <asp:ImageButton ID="ImageButton3" runat="server" 
        ImageUrl="~/images/deletefriend.jpg.png" Width="250px" 
        PostBackUrl="~/SiteMember/Delfriend.aspx"/>
    <br />
    <asp:ImageButton ID="ImageButton4" runat="server" 
        ImageUrl="~/images/edit album.jpg.png" Width="250px" 
        PostBackUrl="~/SiteMember/delfullalbum.aspx" />
    <asp:ImageButton ID="ImageButton5" runat="server" 
        ImageUrl="~/images/profileedit.png" PostBackUrl="~/SiteMember/basicinfo.aspx" 
        Width="250px" />
    <br />
    <asp:ImageButton ID="ImageButton6" runat="server" Height="63px" 
        ImageUrl="~/images/deletepost.png" Width="246px" 
        PostBackUrl="~/SiteMember/deletehomepost.aspx" />
</asp:Content>

