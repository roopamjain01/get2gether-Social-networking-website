<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="adsetting.aspx.cs" Inherits="Admin_adsetting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <br />
    <asp:ImageButton ID="ImageButton1" runat="server" 
        ImageUrl="~/adimg/adchpass.png" PostBackUrl="~/Admin/adchpass.aspx" 
        Width="300px" />
    <br />
    <asp:ImageButton ID="ImageButton2" runat="server" 
        ImageUrl="~/adimg/adcrtacc.png" PostBackUrl="~/Admin/ad_logindetail.aspx" 
        Width="300px" />
    <br />
    <asp:ImageButton ID="ImageButton3" runat="server" 
        ImageUrl="~/adimg/dltadacc.png" Width="300px" 
        PostBackUrl="~/Admin/dladacc.aspx" />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>

