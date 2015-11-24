<%@ Page Language="C#" AutoEventWireup="true" CodeFile="welcome.aspx.cs" Inherits="welcome" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
               <link href="../StyleSheet.css" rel="stylesheet" type="text/css" /> 
    </head>
<body>
    <form id="form1" runat="server">
      <div class="container">
      <table cellspacing="0" width="100%" cellpadding="0" 
              
              style="border: 1px solid #000000; font-family: calibri; font-style: normal" >
            <tr>
                <td align="left" width="50%" 
                    
                    
                    
                    
                    style="background-image: none; background-repeat: repeat-x; background-color: #000000;">
                <asp:Image ID="header_img" runat="server" Height="80px" 
                    ImageUrl="~/images/logo.png" Width="200px" />
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
            <td 
                    
                    
                    style="background-image: none; background-repeat: repeat-x; background-color: #337FC6;">
                &nbsp;
                <br />
                </td>
                </tr>
           
            <tr>
               <td>
                     <table cellpadding="0" cellspacing="0" width="1000px">
                         <tr>
                         <td style="padding: 2px 0px 0px 0px" height="150" valign="top" xml:lang="200">
                        
                             <Marquee behaviour="slide"  slidedelay="0" slideamount="200" scrollamount="10"; direction="right" onmouseover="this.stop();" onmouseout="this.start();" >
                         <%--   <asp:Image ID="Image1" runat="server" ImageUrl="~/images/ape.gif" width="180" height="160" alt="Draac Ape"></asp:Image> 
                            <asp:Image ID="Image4" runat="server" Width="200" Height="150" ImageUrl="~/images/welcome8.jpg"></asp:Image>
                            <asp:Image ID="Image6" runat="server" Width="200" Height="150" ImageUrl="~/images/welcome4.jpg"></asp:Image>
                            <asp:Image ID="Image7" runat="server" Width="200" Height="150" ImageUrl="~/images/welcome3.jpg"></asp:Image> 
                            <asp:Image ID="Image9" runat="server" Width="200" Height="150" ImageUrl="~/images/welcom7.jpg"></asp:Image>
                            <asp:Image ID="Image10" runat="server" Width="200" Height="150" ImageUrl="~/images/welcome.jpg"></asp:Image>
                           --%>
                            <asp:Image ID="Image5" runat="server" Width="200" Height="150" ImageUrl="~/images/welcome6.jpg"></asp:Image>
                         <%--   <asp:Image ID="Image4" runat="server" Width="200" Height="150" ImageUrl="~/images/welcome8.jpg"></asp:Image>
                            <asp:Image ID="Image2" runat="server" Width="200" Height="150" ImageUrl="~/images/welcom5.jpg"></asp:Image>                           
                            <asp:Image ID="Image1" runat="server" Width="200" Height="150" ImageUrl="~/images/welcome8.jpg"></asp:Image>
                            <asp:Image ID="Image6" runat="server" Width="200" Height="150" ImageUrl="~/images/welcome6.jpg"></asp:Image>
                         --%>    </Marquee>
                         
                             </td>
                         </tr>
                         <tr>
                             <td valign="top" width="1000" align="center" 
                                 
                                 style="border-top-style: solid; border-width: 1px; border-color: #000000; border-bottom-style: solid;">
  &nbsp;<asp:Image 
                                     ID="Image8" runat="server" Height="280px" 
                                     ImageUrl="~/images/acc_created_succ.PNG" Width="700px" />
                             </td>
                             
                         </tr>
                         <tr>
                             <td align="center" width="1000">
                                 <asp:ImageButton ID="ImageButton1" runat="server" 
                                     ImageUrl="~/images/letsgo.png" PostBackUrl="~/SiteMember/basicinfo1.aspx" 
                                     Width="300px" Height="95px" />
                             </td>
                         </tr>
                     </table>
                  </td>
            </tr>
           
            <tr class ="footer1">
               <td 
                    
                    
                    style="background-image: none; background-repeat: repeat-x; background-color: #337FC6; color: #FFFFFF;" >
            © Web-Site is devloped by : R Creations. : R Creations.</td>
           </tr>
    </table>
    </div>
    </form>
</body>
</html>
