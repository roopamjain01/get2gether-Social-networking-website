<%@ Page Language="C#" AutoEventWireup="true" CodeFile="study.aspx.cs" Inherits="deep_study" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />   
  
    <style type="text/css">
        
        .style1
        {
            text-decoration: none;
        }
        .style2
        {
            text-transform: capitalize;
            text-decoration: none;
        }
        
    </style>
 
</head>
<body class="container">
    <form id="form1" runat="server">
    <div class="container" style="border: 1px solid #000000">
    
        <table width="1000">
            <tr>
                <td width="60">
    
        <asp:Image ID="Image2" runat="server" ImageUrl="~/deep/img/asp.net.PNG" Width="100px" />
                </td>
                <td>
                    <a class="style1" href="https:/www.w3schools.com/aspnet/default.asp" 
                        style="color: #000000">ASP.NET</a></td>
            </tr>
            <tr>
                <td width="60">
    
                    <br />
    
        <asp:Image ID="Image1" runat="server" ImageUrl="~/deep/img/w3.jpg" Width="100px" />
                </td>
                <td style="color: #000000">
                    <a class="style1" href="https:/www.w3school.com" style="color: #000000">W3 Schools Link</a></td>
            </tr>
            <tr>
                <td width="60">
    
        <asp:Image ID="Image3" runat="server" ImageUrl="~/deep/img/rs.PNG" Height="100px" 
                        Width="100px" />
                </td>
                <td style="color: #000000">
                    <a class="style1" href="https:/www.flipkart.com/R+S+Agarwal" 
                        style="color: #000000">RS AGGARWAL</a></td>
            </tr>
            <tr>
                <td width="60">
    
        <asp:Image ID="Image4" runat="server" ImageUrl="~/deep/img/java.jpg" Width="100px" />
                </td>
                <td style="color: #000000">
                    <a class="style2" href="https:/www.tutorialspoint.com/java/index.htm" 
                        style="color: #000000">java tutorial</a></td>
            </tr>
            <tr>
                <td width="60">
    
        <asp:Image ID="Image5" runat="server" ImageUrl="~/deep/img/php.jpg" Width="100px" />
                </td>
                <td style="color: #000000">
                    <a class="style1" href="https:/www.w3schools.com/php/" style="color: #000000">
                    PHP tutorial</a></td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
