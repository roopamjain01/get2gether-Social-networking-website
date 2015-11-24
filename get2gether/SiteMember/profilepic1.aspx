<%@ Page Language="C#" AutoEventWireup="true" CodeFile="profilepic1.aspx.cs" Inherits="SiteMember_profilepic1" %>

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
    <div class="container" style="border: 1px outset #000000">

    <table width="100%" cellpadding="0px" cellspacing="0px">
        <tr>
            <td width="1000" bgcolor="Black" colspan="3">
                <asp:Image ID="header_img" runat="server" Height="80px" 
                    ImageUrl="~/images/logo.png" Width="200px" />
                <br />
                <br />
                
            </td>
        </tr>
        <tr class="container" >
        
        <td bgcolor="#337FC6" colspan="3">
                <br />
                
            </td>
        </tr>
        
        <tr>
            <td colspan="3" width="150">
                
                <table width="1000px">
                    <tr>
                        <td colspan="1" style="font-family: calibri; font-style: normal" width="150">
                            <asp:Image ID="Image1" runat="server" Height="130px" 
                                ImageUrl="~/ProfilePic/avatar.jpg" Width="140px" />
                        </td>
                        <td width="860">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:FileUpload ID="FileUpload1" runat="server" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="upload_btn" runat="server" onclick="upload_btn_Click" 
                                Text="Upload" Width="100px" />
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td width="100px">
                            &nbsp;</td>
                        <td>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:Button ID="savechanges_btn" runat="server" Text="View Profile" 
                onclick="savechanges_btn_Click" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;</td>
                    </tr>
                </table>
                
            </td>
        </tr>
        <tr class ="footer1">
               <td style="background-image: none; background-repeat: repeat-x; background-color: #337FC6; color: #FFFFFF; font-family: CAlibri;" 
                   width="850" >
                &copy  Web-Site is devloped by : R Creations.</td>
               <td style="background-image: none; background-repeat: repeat-x; background-color: #337FC6; color: #FFFFFF; font-family: CAlibri;" 
                   width="100" >
                    <asp:HyperLink ID="HyperLink3" runat="server" ForeColor="White" 
                       NavigateUrl="~/home1.aspx">     Help     </asp:HyperLink>

                   </td>
               <td style="background-image: none; background-repeat: repeat-x; background-color: #337FC6; color: #FFFFFF; font-family: CAlibri;" 
                   width="100" >
                    <asp:HyperLink ID="HyperLink4" runat="server" ForeColor="White" 
                       NavigateUrl="~/aboutus2.aspx">About Us</asp:HyperLink>
   </td>
           </tr>

        

    </table>
</div>
    </div>
    </form>
</body>
</html>
