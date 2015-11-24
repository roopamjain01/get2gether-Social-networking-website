<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ad_logindetail.aspx.cs" Inherits="Admin_ad_logindetail" %>

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
     <div class="container" style="border: 1px outset #000000">
      <table cellspacing="0" width="1000px" cellpadding="0" frame="border" 
                  style="padding: 0px; margin: 0px" >
            <tr>
                <td align="left" width="1000px" colspan="2" style="background-color: #000000">
                    <asp:Image ID="Image1" runat="server" Height="80px" 
                        ImageUrl="~/images/logo.png" Width="200px" />
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td align="left" width="100%" colspan="2" bgcolor="#337FC6">
                    <br />
                </td>
            </tr>
  
            <tr>
               <td width="520px" 
                    
                    
                    style="padding: 0px; margin: 0px;" 
                    valign="top">
                   <asp:Image ID="Image6" runat="server" Height="400px" 
                       ImageUrl="~/adimg/Picture2.png" Width="520px" />
                </td>
               <td width="470px">
               <br />
               <div style="width: 450px" >
                              <table width="450" cellspacing="1" 
                                  cellpadding="0" 
                                  style="padding: 0px; margin: 0px 0px 0px 10px; border: 2px solid #99CCFF;">
                     <tr>
                        <td colspan="2" align="center" 
                             style="font-family: calibri; font-size: x-large; color: #0066FF">
                            Admin
                        Sign Up<br />
                            <asp:Image ID="Image2" runat="server" Height="65px" 
                                ImageUrl="~/images/whitelogo.png" Width="130px" />
&nbsp;&nbsp;&nbsp; <hr />
                        </td>
                     </tr>
                        <tr>
                            <td width="35%" style="font-family: calibri" id="logindetail">
                                &nbsp; First name:</td>
                            <td >
                                <asp:TextBox ID="fname" runat="server" Width="130px" CssClass="name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="fname" ErrorMessage="Enter Name" ForeColor="Red" 
                                    Font-Names="Calibri" ValidationGroup="logindetail"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="font-family: calibri" id="logindetail">
                                &nbsp;
                                Last name:</td>
                            <td >
                                <asp:TextBox ID="lname" runat="server" Width="130px" CssClass="name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="lname" ErrorMessage="Enter LastName" ForeColor="Red" 
                                    Font-Names="Calibri" ValidationGroup="logindetail"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                           <td style="font-family: calibri" id="logindetail">
                                &nbsp;
                                Username:
                           </td>
                           <td >
                                <asp:TextBox ID="username" runat="server" Width="130px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="username" ErrorMessage="Enter Username" ForeColor="Red" 
                                    Font-Names="Calibri" ValidationGroup="logindetail"></asp:RequiredFieldValidator>
                           </td>
                        </tr>
                        <tr>
                           <td style="font-family: calibri" id="logindetail">
                                &nbsp;
                                Password:
                           </td>
                           <td >
                                <asp:TextBox ID="password" runat="server" TextMode="Password" Width="130px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                    ControlToValidate="password" ErrorMessage="Enter Password" ForeColor="Red" 
                                    Font-Names="Calibri" ValidationGroup="logindetail"></asp:RequiredFieldValidator>
                            </td>
                       </tr>
                       <tr>
                          <td style="font-family: calibri" >
                              &nbsp;
                              Re-enter Password:
                          </td>
                          <td >
                                <asp:TextBox ID="pass2" runat="server" TextMode="Password" Width="130px"></asp:TextBox>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                    ControlToCompare="password" ControlToValidate="pass2" 
                                    ErrorMessage="Password Not Matched" ForeColor="Red" Font-Names="Calibri" 
                                    ValidationGroup="logindetail"></asp:CompareValidator>
                          </td>
                      </tr>
                      <tr>
                         <td style="font-family: calibri" >
                                &nbsp;
                                I am:
                         </td>
                         <td>
                                <asp:DropDownList ID="gender_drop_list" runat="server" Width="134px" CssClass="name" 
                                  >
                                    <asp:ListItem Value="female"></asp:ListItem>
                                    <asp:ListItem Value="male" Selected="True"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                    ControlToValidate="gender_drop_list" ErrorMessage="Select Gender" 
                                    ForeColor="Red" Font-Names="Calibri" ValidationGroup="logindetail"></asp:RequiredFieldValidator>
                         </td>
                     </tr>
                     <tr>
                        <td style="font-family: calibri" >
                            &nbsp;
                            Birthday:
                        </td>
                        <td >
                        
                            <asp:DropDownList ID="dd" runat="server" Width="50px">
                            </asp:DropDownList>
                            <asp:DropDownList ID="mm" runat="server" Width="50px">
                            </asp:DropDownList>
                            <asp:DropDownList ID="yy" runat="server" Width="100px">
                            </asp:DropDownList>
                              &nbsp;</td>
                    </tr>
                    <tr>
                       <td colspan="2" >
                       <hr />
                    </td>
                   </tr>
                   <tr>
                      <td >
                      </td>
                      <td>
                          <asp:ImageButton ID="submit" runat="server" 
                              ImageUrl="~/images/submit.png" Width="120px" onclick="submit_Click" 
                              ValidationGroup="logindetail" />
                          <br />
                      </td>
                  </tr>
                  <tr>
                     <td colspan="2" >
                                <asp:Label ID="Label1" runat="server" Text="Label" Font-Names="Calibri" 
                                    ForeColor="Red" Visible="False"></asp:Label>
                      </td>
                  </tr>
           </table>
           <table>
           <tr>
                     <td colspan="2">
                                <strong>
                                <br />
&nbsp;
                                <asp:LinkButton ID="LinkButton1" runat="server" Font-Names="Calibri" 
                                    ForeColor="#337FC6" PostBackUrl="~/Admin/adsetting.aspx">Back to Setting Page...</asp:LinkButton>
                                </strong>
                      </td>
                    
                  </tr>
                  </table>
                    </div>
       </td>
    </tr>
     <tr class ="footer1">
        <td bgcolor="#337FC6" style="color: #FFFFFF; font-family: CAlibri;" >
           &copy Web-Site is devloped by : R Creations.
        ns.
        </td>
        <td bgcolor="#337FC6" 
             style="color: #FFFFFF; font-family: CAlibri; text-align: right;" >
            <asp:HyperLink ID="HyperLink5" runat="server" Font-Names="Calibri" 
                ForeColor="White" NavigateUrl="~/home1.aspx">Help</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:HyperLink ID="HyperLink6" runat="server" Font-Names="Calibri" 
                ForeColor="White" NavigateUrl="~/aboutus2.aspx">About Us </asp:HyperLink>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;

        </td>
     </tr>
    </table>
    </div>
   
    </form>
</body>
</html>
