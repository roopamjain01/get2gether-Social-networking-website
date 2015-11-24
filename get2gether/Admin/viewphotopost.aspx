<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="viewphotopost.aspx.cs" Inherits="Admin_viewphotopost" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    &nbsp;
    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
        onclientclick="return confirm('Do you want to Delete All Photo post...?')" 
        Text="Delete All Photo Post" />
    <hr />
    <asp:DataList ID="DataList1" runat="server" 
        onselectedindexchanged="DataList1_SelectedIndexChanged">
        <HeaderTemplate>
            <table width="1000">
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td rowspan="7" width="120px" style="text-align: left; vertical-align: top">
                    <asp:Image ImageUrl='<%# Eval("photo") %>' Height="100px" Width="100px" ID="Image2" runat="server" />
                </td>
                <td colspan="2" style="font-family: calibri; font-size: large; font-weight: bold; color: #000000; width: 560px; text-transform: capitalize;">
                    <%# Eval("first_name") %>&nbsp;<%# Eval("Last_name") %></td>
            </tr>
            <tr>
                <td colspan="2" style="font-family: calibri; width: 783px; color: #0000CC;">
                Post:
                </td>
            </tr>
            <tr>
                <td colspan="2" style="font-family: Calibri; color: #000000; background-color: #BCD2FE;">
                    <%# Eval("post") %>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Image ID="Image1"  ImageUrl='<%# Eval("img") %>' Height="100px" Width="100px" runat="server"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="font-family: calibri; color:#0000CC">
                    Date: 
                <%# Eval("date") %>
                </td>
            </tr>
             <tr>
                <td width="1000px" colspan="2">
                    <hr />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="font-family: calibri; color:#0000CC">
                    <asp:Button ID="Button1" runat="server" Text="Delete" CommandName='<%#Eval("id")%>'  OnCommand="Button1_command" Width="100" />
                </td>
            </tr>
              <tr>
                <td width="1000px" colspan="3">
                    <hr />
                </td>
            </tr>
          
           
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:DataList>
</asp:Content>

