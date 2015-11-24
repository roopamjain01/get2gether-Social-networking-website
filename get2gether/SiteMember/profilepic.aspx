<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember/design.master" AutoEventWireup="true" CodeFile="profilepic.aspx.cs" Inherits="profilepic" %>


<%@ Register src="editprofile.ascx" tagname="editprofile" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderLeft" Runat="Server">

<tabel width="100%">
<tr>
<td>
</td>
</tr>
</tabel>

  

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
    
        <table>
            <tr>
                <td width="150">
                    <asp:Image ID="Image1" runat="server" Height="130px" Width="140px" 
                        ImageUrl="~/ProfilePic/avatar.jpg" />
                </td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <asp:Button ID="upload_btn" runat="server" onclick="upload_btn_Click" 
                        Text="Upload" />
                    <br />
                    <br />
                </td>
            </tr>
            <tr class="contentright">
                <td width="150">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                        Text="Next &gt;&gt;" Width="120px" />
                </td>
            </tr>
        </table>

</asp:Content>

