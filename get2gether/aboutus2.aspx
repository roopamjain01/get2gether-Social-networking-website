<%@ Page Language="C#" AutoEventWireup="true" CodeFile="aboutus2.aspx.cs" Inherits="aboutus2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />   
  </head>
<body>
    <form id="form1" runat="server">
      <div>
<div class="container"width: 1000px;" style="width: 1000px">

    <table width="100%" cellpadding="0px" cellspacing="0px" 
        style="font-family: calibri; text-transform: capitalize;">
        <tr>
            <td width="1000" bgcolor="Black" colspan="3">
                <asp:Image ID="header_img" runat="server" Height="80px" 
                    ImageUrl="~/images/logo.png" Width="200px" />
                <br />
                <br />
                
            </td>
        </tr>
        <tr >
        
        <td bgcolor="#337FC6" colspan="3">
                <br />
                
            </td>
        </tr>
        
        <tr>
            <td colspan="3">
                
                <br />
&nbsp;&nbsp;
                
                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/login.aspx">Back to Login Page....</asp:LinkButton>
                <hr />
                <table width="1000">
                    <tr>
                        <td rowspan="1" valign="top" width="150">
                            <asp:Image ID="Image1" runat="server" Height="170px" ImageUrl="~/images/a1.PNG" 
                                Width="200px" />
                        </td>
                        <td width="1000">
                            <table width="850">
                                <tr>
                                    <td width="80">
                                        name:</td>
                                    <td width="750">
                                        roopam jain</td>
                                </tr>
                                <tr>
                                    <td>
                                        School:</td>
                                    <td>
                                        government girls senior secondary school salumber.</td>
                                </tr>
                                <tr>
                                    <td>
                                        college:</td>
                                    <td>
                                        techno india nJR institute of technology udaipur(raj).</td>
                                </tr>
                                <tr>
                                    <td>
                                        phone no:</td>
                                    <td>
                                        9468967574</td>
                                </tr>
                                <tr class="email">
                                    <td>
                                        e-mail:</td>
                                    <td>
                                        roopamjain01@gmail.com</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" width="1000">
                            <hr />
                        </td>
                    </tr>
                </table>
                <table width="1000">
                    <tr>
                        <td rowspan="1" valign="top" width="150">
                            <asp:Image ID="Image2" runat="server" Height="170px" ImageUrl="~/images/a2.PNG" 
                                Width="200px" />
                        </td>
                        <td>
                            <table width="850">
                                <tr>
                                    <td width="80">
                                        name:</td>
                                    <td width="750">
                                        Ronak dak</td>
                                </tr>
                                <tr>
                                    <td>
                                        School:</td>
                                    <td>
                                        cPS</td>
                                </tr>
                                <tr>
                                    <td>
                                        college:</td>
                                    <td>
                                        techno india nJR institute of technology udaipur(raj).</td>
                                </tr>
                                <tr>
                                    <td>
                                        phone no:</td>
                                    <td>
                                        9414726969</td>
                                </tr>
                                <tr class="email">
                                    <td>
                                        e-mail:</td>
                                    <td>
                                        ronakdak@gmail.com</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <br />
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
