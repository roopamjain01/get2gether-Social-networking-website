<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember/design.master" AutoEventWireup="true" CodeFile="activity.aspx.cs" Inherits="activity" %>


<%@ Register src="editprofile.ascx" tagname="editprofile" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderLeft" Runat="Server">
    <table width="210px">
        <tr>
            <td>
               <asp:Image ID="Image2" runat="server" Height="135px" Width="150px" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Label" Font-Bold="True" 
                    Font-Names="Calibri" Font-Size="Larger" CssClass="lb"></asp:Label>
            &nbsp;<asp:Label ID="Label2" runat="server" CssClass="lb" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>              

                <uc1:editprofile ID="editprofile1" runat="server" />
                <br />
            </td>
        </tr>
    </table>

    

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderRight" Runat="Server">
<div style="width: 780px">
    <table  width="785px"style="font-family: Calibri; font-style: normal">
        <tr>
            <td width="30%">
                Activities</td>
            <td>
                <asp:TextBox ID="act_txt" runat="server" Width="280px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <hr />
            </td>
        </tr>
        <tr>
            <td width="30%" style="font-family: calibri; font-style: normal">
                Interest :</td>
            <td>
                <asp:TextBox ID="int_txt" runat="server" Width="280px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <hr />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
            <asp:Button ID="savechanges_btn" runat="server" Text="Next &gt;&gt;" 
                onclick="savechanges_btn_Click" Width="120px" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    </div>
</asp:Content>

