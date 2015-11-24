﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember/design.master" AutoEventWireup="true" CodeFile="viewprofile.aspx.cs" Inherits="SiteMember_viewprofile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderLeft" Runat="Server">
    <asp:Image ID="Image2" runat="server" Height="135px" Width="150px" />
    <br />
    <br />
    <br />
    <asp:LinkButton ID="LinkButton2" runat="server" Font-Names="Calibri" 
        onclick="LinkButton2_Click">View Photos</asp:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderRight" Runat="Server">

<table width="785px" style="font-family: calibri; text-transform: capitalize">
        <tr>
            <td width ="200px">
                NAME :-</td>
            <td width="500px">
                <asp:Label ID="name_lbl" runat="server" Text="Label"></asp:Label>&nbsp;<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td width="200px">
                CURRENT CITY :-</td>
            <td>
                <asp:Label ID="cc_lbl" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                HOME TOWN :-</td>
            <td>
                <asp:Label ID="ht_lbl" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td width="250px">
                GENDER :-</td>
            <td class="style2">
                <asp:Label ID="gen_lbl" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td width="200px">
                BIRTHDAY :-</td>
            <td>
                <asp:Label ID="dd_lbl" runat="server" Text="Label"></asp:Label>
&nbsp;<asp:Label ID="mm_lbl" runat="server" Text="Label"></asp:Label>
&nbsp;<asp:Label ID="yy_lbl" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3">
                INTERESTED IN :-</td>
            <td class="style3">
                <asp:Label ID="int_lbl" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td width="250px">
                LANGUAGE :-</td>
            <td>
                <asp:Label ID="lng_lbl" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td width="200px">
                RELATIONSHIP STATUS:-</td>
            <td>
                <asp:Label ID="rel_lbl" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
        <td colspan=2>
            <hr />
        </td>
        </tr>
        
        <tr>
            <td width="250">
                EMPLOYER :-</td>
            <td width="500px">
                <asp:Label ID="emp_lbl" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td width="250px">
                COLLEGE :-</td>
            <td>
                <asp:Label ID="clg_lbl" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td width="250px">
                HIGH SCHOOL :-</td>
            <td>
                <asp:Label ID="hs_lbl" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
        <td colspan=2>
            <hr />
        </td>
        </tr>
        
        <tr>
            <td width="250px">
                MUSIC :-</td>
            <td>
                <asp:Label ID="music_lbl" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td width="250px">
                BOOKS :-</td>
            <td>
                <asp:Label ID="books_lbl" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td width="250px">
                MOVIES :-</td>
            <td id="l">
                <asp:Label ID="movies_lbl" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td width="200px">
                TELEVISION :-</td>
            <td>
                <asp:Label ID="tele_lbl" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td width="200px">
                GAMES :-</td>
            <td>
                <asp:Label ID="game_lbl" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
        <td colspan=2>
            <hr />
        </td>
        </tr>
        
        <tr>
            <td width="250px">
                ACTIVITIES :-</td>
            <td>
                <asp:Label ID="activity_lbl" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td width="250px">
                INTEREST :-</td>
            <td>
                <asp:Label ID="interest_lbl" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
        <td colspan=2>
            <hr />
        </td>
        </tr>
        
        <tr>
            <td width="250px">
                EMAIL :-</td>
            <td>
                <asp:Label ID="email_lbl" runat="server" Text="Label" CssClass="email"></asp:Label>
            </td>
        </tr>
        <tr>
            <td width="250px">
                PHONE :-</td>
            <td>
                <asp:Label ID="ph_lbl" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td width="250px">
                ADDRESS :-</td>
            <td>
                <asp:Label ID="add_lbl" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td width="250px">
                CITY :-</td>
            <td>
                <asp:Label ID="city_lbl" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
    </table>

</asp:Content>

