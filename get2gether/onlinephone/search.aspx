<%@ Page Title="" Language="C#" MasterPageFile="~/onlinephone/Site.master" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="style1">
        <tr>
            <td style="font-family: Calibri; font-size: large" width="120">
                <asp:Label ID="Label4" runat="server" Text="Enter Name :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox3" ErrorMessage="Enter Name..."></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="Button3" runat="server" Text="Search" onclick="Button3_Click" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="font-family: calibri; font-size: x-large; font-weight: bold; color: #0000FF; text-transform: capitalize;">
                <asp:Label ID="Label5" runat="server" Text="Label :"></asp:Label>
            </td>
            <td style="font-family: calibri; font-size: x-large; font-weight: bold; color: #0000FF">
                <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="font-family: calibri; font-size: x-large; font-weight: bold; color: #0000FF; text-transform: capitalize;" 
                colspan="2">
                <hr />
            </td>

        </tr>
        <tr>
            <td style="font-family: calibri; font-size: x-large; font-weight: lighter; color: #000000; text-transform: capitalize;" 
                colspan="2">
                <asp:ListView ID="ListView1" runat="server" DataSourceID="sqldatasource1" >
        <ItemTemplate>
            <div>
                <table width="100%">
                    <tr>
                        <td style="width: 200px; font-family: calibri; font-size: large; text-transform: capitalize;">
                            <%# Eval("NAME") %></td>
                        <td style="width: 800px; font-family: calibri; font-size: large; text-transform: capitalize;">
                          <%# Eval("NUMBER")%></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <hr />
                        </td>
                    </tr>
                </table>
            </div>
        </ItemTemplate>
        <LayoutTemplate>
            <div ID="itemPlaceholderContainer" runat="server" 
                    style="font-family: Calibri;">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="text-align: center;font-family: Calibri; color: #0000FF;">
                <asp:DataPager ID="DataPager1" runat="server" PageSize="5">
                    <Fields>
                        <asp:NumericPagerField ButtonCount="10" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" 
    ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>" 
    SelectCommand="SELECT * FROM [PHONE]"></asp:SqlDataSource>&nbsp;</td>

        </tr>
    </table>
</asp:Content>

