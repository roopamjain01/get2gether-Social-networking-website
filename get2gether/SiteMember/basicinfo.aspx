<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember/design.master" AutoEventWireup="true" CodeFile="basicinfo.aspx.cs" Inherits="basicinfo" %>


<%@ Register src="editprofile.ascx" tagname="editprofile" tagprefix="uc3" %>

<%@ Register src="editprofile.ascx" tagname="editprofile" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderLeft" Runat="Server">
    <table width="100%">
        <tr>
            <td>
                <asp:Image ID="Image1" runat="server" Height="135px" Width="150px" />
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
<div class="contentright" style="width: 785px">
    <table width="784">
        <tr >
            <td width="783" align="center">
                &nbsp;</td>
            <td  width="783" align="right">
                &nbsp;</td>
        </tr>
        <tr>
            <td  width="30%" align="left" style="font-family: calibri; font-style: normal">
                Current City:</td>
            <td  width="70%">
                <asp:TextBox ID="currcity" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td width="30%" align="left" style="font-family: calibri; font-style: normal">
                Home Town:</td>
            <td width="70%">
                <asp:TextBox ID="htown" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td  colspan="2"  width="100%" style="font-family: calibri; font-style: normal">
             <hr />   
            </td>
                  
        </tr>
             
      <tr>
        <td align="left" width="30%" style="font-family: calibri; font-style: normal">Interested In</td>
        <td width="70%">
            <asp:TextBox ID="interest" runat="server" Width="250px"></asp:TextBox>
          </td>
          </tr>
          <tr>
            <td  colspan="2"  width="100%" style="font-family: calibri; font-style: normal">
             <hr />   
            </td>
                  
        </tr>
      
     
     <tr>
        <td align="left" width="30%" style="font-family: calibri; font-style: normal">Language</td>
        <td>
            <asp:TextBox ID="lang" runat="server" Width="250px"></asp:TextBox>
         </td>
         </tr>
          <tr>
            <td  colspan="2"  width="100%" style="font-family: calibri; font-style: normal">
             <hr />   
     
            </td>
                  
        </tr>
           
     <tr>
        <td align="left" style="font-family: calibri; font-style: normal">About Me</td>
        <td>
            <asp:TextBox ID="about" runat="server" Width="250px"></asp:TextBox>
         </td>
         </tr>
          <tr>
            <td  colspan="2"  width="100%" style="font-family: calibri; font-style: normal">
             <hr />   
            </td>
                  
        </tr>
            
     <tr>
        <td align="left" style="font-family: calibri; font-style: normal">&nbsp;</td>
        <td>
            <asp:Button ID="savechanges_btn" runat="server" Text="Next &gt;&gt;" 
                onclick="savechanges_btn_Click" style="height: 26px" Width="120px" />
         </td>
    </tr>         
     <tr>
        <td align="center">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>         
    </table>
</div>
</asp:Content>

