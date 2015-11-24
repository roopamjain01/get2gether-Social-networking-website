<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="dladacc.aspx.cs" Inherits="Admin_dladacc"  EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <table style="font-family: calibri" width="1000">
        <tr>
            <td width="100">
                Search admin:</td>
            <td width="250">
                <asp:TextBox ID="TextBox1" runat="server" Width="250px"></asp:TextBox>
            </td>
            <td width="650">
                <asp:ImageButton ID="ImageButton2" runat="server" 
                    ImageUrl="~/images/Picture1.png" 
                    Height="25px" onclick="ImageButton2_Click" />
            </td>
        </tr>
    </table>
               

  <asp:ListView ID="ListView1" runat="server" >
            <ItemTemplate>
            <div>
             <table width="1000px">
               <tr>
                            <td style="width: 180px; font-family: calibri; font-size: large; text-transform: capitalize;">
                                <%# Eval("First_name") %>&nbsp;<%# Eval("Last_name") %></td>
                            <td style="width: 820px">
                                <asp:Button ID="Button1" runat="server" Text="Delete" CommandName='<%# Eval("user_name")%>' OnCommand="Button1_command" Width="100" OnClientClick="return confirm('Really want to delete Admin account...?')" />
                            </td>
  
  
                        </tr>
                       <tr>
                       <td colspan="6">
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
                    <asp:NumericPagerField ButtonCount="2" />                               
                   </Fields>
                 </asp:DataPager>
                </div>
            </LayoutTemplate>
 </asp:ListView>
    <br />
</asp:Content>

