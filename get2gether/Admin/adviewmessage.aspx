<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="adviewmessage.aspx.cs" Inherits="Admin_adviewmessage" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <br />
&nbsp;
    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" onclientclick="return confirm('Do you want to Delete All Message...? ')" 
        Text="Delete All Message" Width="150px" />
    <hr />
    <asp:DataList ID="DataList1" runat="server" 
        onselectedindexchanged="DataList1_SelectedIndexChanged">
        <HeaderTemplate>
            <table width="1000px">
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td rowspan="6" width="120px" style="text-align: left; vertical-align: top">
                    <asp:Image ImageUrl='<%# Eval("photo") %>' Height="100px" Width="100px" ID="Image2" runat="server" />
                </td>
                <td colspan="2" style="font-family: calibri; font-size: large; font-weight: bold; color: #000000; width: 560px; text-transform: capitalize;">
                    <%# Eval("first_name") %>&nbsp;<%# Eval("Last_name") %></td>
            </tr>
            <tr>
                <td colspan="2" style="font-family: calibri; width: 560px; color: #0000CC;">
                Message:
                </td>
            </tr>
            <tr>
                <td colspan="2" /style="font-family: Calibri; color: #000000; background-color: #BCD2FE;">
                    <%# Eval("message") %>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="font-family: calibri; color:#0000CC">
                    Date: 
                <%# Eval("senddate") %>
                </td>
            </tr>
            <tr>
                <td width="1000px" colspan="3">
                    <hr />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="font-family: calibri; color:#0000CC">
                    <asp:Button ID="Button1" runat="server" Text="Delete" CommandName='<%#Eval("id")%>'  OnCommand="Button1_command" Width="100" OnClientClick="return confirm('Really want to Delete Message...?')" />
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

