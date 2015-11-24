<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember/design.master" AutoEventWireup="true" CodeFile="education.aspx.cs" Inherits="education" %>


<%@ Register src="editprofile.ascx" tagname="editprofile" tagprefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <style type="text/css">
        
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderLeft" Runat="Server">
 
    <table>
        <tr>
            <td>
                <asp:Image ID="Image2" runat="server" Height="135px" Width="150px" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Label" CssClass="lb"></asp:Label>
            &nbsp;<asp:Label ID="Label2" runat="server" Text="Label" CssClass="lb"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <br />
                <uc3:editprofile ID="editprofile1" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
 
                &nbsp;</td>
        </tr>
    </table>
 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderRight" Runat="Server">
    <table width="785px">
        <tr>
            <td width="250px" style="font-family: calibri; font-style: normal">Employer:</td>
            <td width="525px">
                <asp:TextBox ID="emp_txt" runat="server" Width="280px"></asp:TextBox>
            </td>
        </tr>
         <tr>
       <td colspan="2">
       <hr />
       </td>
       </tr>
    
        <tr>
            <td style="font-family: calibri; font-style: normal" width="250">College:</td>
            <td>
                <asp:TextBox ID="clg_txt" runat="server" Width="280px"></asp:TextBox>
            </td>
        </tr>
         <tr>
       <td colspan="2">
       <hr />
       </td>
       </tr>
    
   
        <tr>
            <td style="font-family: calibri; font-style: normal" width="250">
                High School:</td>
            <td>
                <asp:TextBox ID="sch_txt" runat="server" Width="280px"></asp:TextBox>
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
                onclick="savechanges_btn_Click" style="height: 26px" Font-Names="Calibri" 
                    Width="120px" />
            </td>
        </tr>
    </table>
</asp:Content>

