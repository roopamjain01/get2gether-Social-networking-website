<%@ Page Title="" Language="C#" MasterPageFile="~/onlinephone/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="onlinephone_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
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
    SelectCommand="SELECT * FROM [PHONE]"></asp:SqlDataSource>
    </asp:Content>

