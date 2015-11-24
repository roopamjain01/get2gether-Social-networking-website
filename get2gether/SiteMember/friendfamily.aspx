<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember/design.master" AutoEventWireup="true" CodeFile="friendfamily.aspx.cs" Inherits="friendfamily" %>

<%@ Register src="editprofile.ascx" tagname="editprofile" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderLeft" Runat="Server">
    <table width="100%">
        <tr>
            <td>
                <asp:Image ID="Image2" runat="server" Height="135px" Width="150px" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Label" Font-Bold="True" 
                    CssClass="lb"></asp:Label>
            &nbsp;<asp:Label ID="Label2" runat="server" CssClass="lb" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <uc1:editprofile ID="editprofile1" runat="server" />
                <br />
                <br />
            </td>
        </tr>
    </table>
  </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderRight" Runat="Server">
    <table width="745px">
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td width="20%" style="font-family: calibri; font-style: normal">
                Relationship Status :</td>
            <td style="font-family: calibri; font-style: normal">
                <asp:DropDownList ID="relation_drop" runat="server">
                    <asp:ListItem>single</asp:ListItem>
                    <asp:ListItem>in a relationship</asp:ListItem>
                    <asp:ListItem>married</asp:ListItem>
                    <asp:ListItem>engaged</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="font-family: calibri; font-style: normal">
                <hr />
            </td>
        </tr>
    </table>
    <table width ="745px">
        <tr>
            <td style="font-family: calibri; font-style: normal">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="savechanges_btn" runat="server" Text="Next &gt;&gt;" 
                onclick="savechanges_btn_Click" style="height: 26px" Width="120px" />
            </td>
        </tr>
    </table>
</asp:Content>

