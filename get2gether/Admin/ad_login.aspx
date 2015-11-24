<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ad_login.aspx.cs" Inherits="Admin_ad_login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <title></title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />   
  
    <style type="text/css">
        
    </style>
 
</head>
<body>
    <form id="form1" runat="server">
    
     <div id="wrapper">
<div class="container" style="border: 1px solid #000000">

    <table width="100%" cellpadding="0px" cellspacing="0px">
        <tr>
            <td colspan="2" width="1000" bgcolor="Black">
                <asp:Image ID="header_img" runat="server" Height="80px" 
                    ImageUrl="~/images/logo.png" Width="200px" />
                <br />
                <br />
                
            </td>
        </tr>
        <tr class="container" >
        
        <td colspan="2" bgcolor="#337FC6">
                <br />
                
            </td>
        </tr>
        
        <tr>
        
            <td width="650px" 
                valign="top">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Image ID="Image6" runat="server" Height="380px" 
                    ImageUrl="~/adimg/g2g1.jpg" Width="500px" />
            </td>
            <td width="350">
                <div style="margin: 15px 10px 10px 10px; border: 2px solid #99CCFF; width: 295px; " 
                    id="pass_div">
                    
                    <table width="295" cellpadding="1" cellspacing="0">
                    
                        <tr>
                            <td align="center" width="295">
                                <asp:Image ID="Image5" runat="server" Height="60px" 
                                    ImageUrl="~/adimg/adlogin.jpg" Width="130px" />
                            </td>
                        </tr>
                        <tr>
                            <td style="font-style: normal; text-decoration: blink; font-family: Calibri">
                                Username :</td>
                        </tr>
                        <tr>
                            <td >
                                <asp:TextBox ID="user_txt" runat="server" Width="250px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfv1" runat="server" 
                                    ControlToValidate="user_txt" ErrorMessage="*" ForeColor="Red" 
                                    ValidationGroup="pass_div"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="font-family: calibri">
                                <br />
                                Password :</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="password_txt" runat="server" Width="250px" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfv2" runat="server" 
                                    ControlToValidate="password_txt" ErrorMessage="*" ForeColor="Red" 
                                    ValidationGroup="pass_div"></asp:RequiredFieldValidator>
                                <br />
                                 <br />
                            </td>
                        </tr>
                        <tr>
                            <td >
                <asp:Label ID="Label1" runat="server" BorderStyle="None" 
                    ForeColor="#CC3300" Width="250px" Font-Bold="True" Font-Italic="False" 
                    Font-Names="Calibri" Font-Size="Large" Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:ImageButton ID="signin_btn" runat="server" Height="40px" 
                                    ImageUrl="~/images/signin.png" Width="90px" onclick="signin_Click" 
                                    ValidationGroup="pass_div" />
                            </td>
                        </tr>
                    </table>
                    
                    <br />
                </div>
            </td>
        </tr>
          <tr class ="footer1">
               <td style="background-image: none; background-repeat: repeat-x; background-color: #337FC6; color: #FFFFFF; font-family: CAlibri;" 
                   width="680px" >
                   © Web-Site is devloped by : R Creations.</td>
               <td style="background-image: none; background-repeat: repeat-x; background-color: #337FC6; color: #FFFFFF; font-family: CAlibri; text-align: left;" 
                   width="315px" >
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:HyperLink ID="HyperLink7" runat="server" Font-Names="Calibri" ForeColor="White" 
                        NavigateUrl="~/login.aspx">User Login</asp:HyperLink>                    
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                    
                    <asp:HyperLink ID="HyperLink5" runat="server" Font-Names="Calibri" 
                        ForeColor="White" NavigateUrl="~/home1.aspx">Help</asp:HyperLink>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:HyperLink ID="HyperLink6" runat="server" Font-Names="Calibri" 
                        ForeColor="White" NavigateUrl="~/aboutus2.aspx">About Us</asp:HyperLink>

                   &nbsp;

                   </td>
           </tr>
        

    </table>
</div>
</div>
    </form>
</body>
</html>
