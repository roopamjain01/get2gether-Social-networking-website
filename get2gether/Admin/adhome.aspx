<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="adhome.aspx.cs" Inherits="Admin_adhome" EnableEventValidation="false"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    
    <table style="font-family: calibri" width="1000">
        <tr>
            <td width="100">
                Search User:</td>
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
    
    &nbsp;<hr />
    <br />
               

  <asp:ListView ID="ListView1" runat="server" >
            <ItemTemplate>
            <div>
             <table width="1000px">
               <tr>
                            <td style="width: 130px">
                                <asp:Image ImageUrl='<%# Eval("photo") %>'  Height="100" Width="120" ID="Image1" runat="server" />
                            </td>
                            <td style="width: 180px; font-family: calibri; font-size: large; text-transform: capitalize;">
                                <%# Eval("First_name") %>&nbsp;<%# Eval("Last_name") %></td>
                            <td style="width: 120px">
                                <asp:Button ID="Button1" runat="server" Text="View Profile" CommandName='<%# Eval("user_name")%>' OnCommand="Button1_command" Width="100" /> </td>
                              <td style="width: 120px">
                                  <asp:Button ID="Button3" runat="server" Text="View Message" CommandName='<%# Eval("user_name")%>' OnCommand="Button2_command" Width="100" />                         </td>
                              <td style="width: 120px">
                                  <asp:Button ID="Button4" runat="server" Text="View Post" CommandName='<%# Eval("user_name")%>' OnCommand="Button3_command" Width="100" />
                            </td>
                            <td style="width: 300px">
                                <asp:Button ID="Button5" runat="server" Text="Delete" CommandName='<%# Eval("user_name")%>' OnCommand="Button4_command" Width="100" OnClientClick="return confirm('Really want to delete user account...?')" />
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
                    <asp:NumericPagerField ButtonCount="10" />                               
                   </Fields>
                 </asp:DataPager>
                </div>
            </LayoutTemplate>
 </asp:ListView>
</asp:Content>

