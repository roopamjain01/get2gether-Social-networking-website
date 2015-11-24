<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="adviewpost.aspx.cs" Inherits="Admin_adviewpost" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <br />
&nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" Text="View Photo Post" 
        Font-Names="Calibri" PostBackUrl="~/Admin/viewphotopost.aspx" 
        Width="150px" Height="26px" />
    &nbsp;&nbsp;
    <asp:Button ID="Button2" runat="server" Height="26px" onclick="Button2_Click" 
        onclientclick="return confirm('Do you want to Delete all Post...?')" 
        Text="Delete All Post" Width="150px" />
    <br />
    
    
       <asp:DataList ID="DataList1" runat="server">

    <HeaderTemplate>
    <table width="1000">
    </HeaderTemplate>
    <ItemTemplate>
         <tr>
            <td width="1000px" colspan="3">
                <hr />
               
            </td>
            </tr>
          

         <tr>
            <td rowspan="6" width="120px" style="text-align: left; vertical-align: top">
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
            <td colspan="2" style="font-family: calibri; color:#0000CC">Date: 
                <%# Eval("date") %>
            </td>
         </tr>
           <tr>
                <td width="1000px" colspan="3">
                    <hr />
                </td>
            </tr>
            
         <tr>
                <td colspan="2" style="font-family: calibri; color:#0000CC">
                    <asp:Button ID="Button1" runat="server" Text="Delete" CommandName='<%#Eval("id")%>'  OnCommand="Button1_command" Width="100" OnClientClick="return confirm('Really want to Delete post...?')" />
                </td>
            </tr>
                 
    </ItemTemplate>
    <FooterTemplate>
    </table>
  
    </FooterTemplate>

    </asp:DataList>

 </asp:Content>

