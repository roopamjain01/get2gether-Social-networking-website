<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember/design.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="SiteMember_home" %>


<%@ Register src="HomeMenu.ascx" tagname="HomeMenu" tagprefix="uc1" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderLeft" Runat="Server">
 <div>
 <table width="210px" cellpadding="0" cellspacing="0" frame="rhs">
    
     <tr>
     <td>
    <asp:ImageButton ID="ImageButton1" runat="server" 
        onclick="ImageButton1_Click" Height="135px" Width="150px" />

    <br />

<br />
   </td>
     </tr>   
    
<tr>
<td>
    <asp:Label ID="Label1" runat="server" Text="Label" CssClass="lb"></asp:Label>&nbsp;<asp:Label 
         ID="Label2" runat="server" Text="Label" CssClass="lb"></asp:Label>
     <br />
   
        </td>
     </tr>
       
 <tr>
 <td>
     <uc1:HomeMenu ID="HomeMenu1" runat="server" />
     
     </td>
     </tr>
     </table>
    </div>
    </asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderRight" Runat="Server">
       
    <table width="785">
        <tr>
            <td width="450">
                <br />
&nbsp;&nbsp;
                <asp:ImageButton ID="ImageButton2" runat="server" 
                    ImageUrl="~/images/saysomething.png" Width="150px" 
                    onclick="ImageButton2_Click" />
&nbsp;
                <asp:ImageButton ID="ImageButton3" runat="server" 
                    ImageUrl="~/images/sharephoto.png" Width="150px" 
                    onclick="ImageButton3_Click" PostBackUrl="~/SiteMember/postphoto.aspx" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" valign="top" width="450">
&nbsp;<asp:TextBox ID="TextBox1" runat="server" Height="50px" TextMode="MultiLine" 
                    Width="430px"></asp:TextBox>
            </td>
            <td valign="top">
                <asp:Button ID="Button1" runat="server" Font-Names="Calibri" Font-Size="Medium" 
                    Height="30px" Text="Post" Width="80px" onclick="Button1_Click" />
            </td>
        </tr>
        
        </table>
    
    
       <asp:DataList ID="DataList1" runat="server">

    <HeaderTemplate>
    <table width="783">
    </HeaderTemplate>
    <ItemTemplate>
         <tr>
            <td width="800px" colspan="3">
                <hr />
               
            </td>
            </tr>
          

         <tr>
            <td rowspan="5" width="120px" style="text-align: left; vertical-align: top">
                <asp:Image ImageUrl='<%# Eval("photo") %>' Height="100px" Width="130px" ID="Image2" runat="server" />
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
         
         
         
       
         
    </ItemTemplate>
    <FooterTemplate>
    </table>
  
    </FooterTemplate>

    </asp:DataList>

 </asp:Content>     
     
       
       
       
       
       
       
       
     
       
       
     
     
       
       
       
       
       
       
       
     
       
       
       
       