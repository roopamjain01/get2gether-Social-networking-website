<%@ Page Language="C#" AutoEventWireup="true" CodeFile="basicinfo1.aspx.cs" Inherits="SiteMember_basicinfo1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" /> 
    <style type="text/css">
        
        .style1
        {
            width: 1000px
        }
        
       </style>
  
</head>
<body>
    <form id="form1" runat="server">
    <div id="wrapper">
    <div class="container" style="border: 1px outset #000000">

    <table width="1000px" cellpadding="0px" cellspacing="0px">
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
            <td colspan="3">
                
                <table width="100%">
                    <tr>
                        <td align="center" width="20%">
                            &nbsp;</td>
                        <td align="right" width="80%">
                            &nbsp;</td>
                        <td align="right" width="80%">
                            &nbsp;</td>
                        <td align="right" width="80%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="left" style="font-family: calibri; font-style: normal" width="120">
                            Current City:</td>
                        <td width="70%">
                            <asp:TextBox ID="currcity" runat="server" Width="250px"></asp:TextBox>
                        </td>
                        <td width="70%">
                            &nbsp;</td>
                        <td width="70%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="left" style="font-family: calibri; font-style: normal" width="120">
                            Home Town:</td>
                        <td width="70%">
                            <asp:TextBox ID="htown" runat="server" Width="250px"></asp:TextBox>
                        </td>
                        <td width="70%">
                            &nbsp;</td>
                        <td width="70%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="font-family: calibri; font-style: normal" width="100%">
                            <hr />
                        </td>
                        <td style="font-family: calibri; font-style: normal" width="100%">
                            &nbsp;</td>
                        <td style="font-family: calibri; font-style: normal" width="100%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="left" style="font-family: calibri; font-style: normal" width="10%">
                            Interested In:</td>
                        <td width="70%">
                            <asp:TextBox ID="interest" runat="server" Width="250px"></asp:TextBox>
                        </td>
                        <td width="70%">
                            &nbsp;</td>
                        <td width="70%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="left" style="font-family: calibri; font-style: normal" width="10%">
                            Language:</td>
                        <td>
                            <asp:TextBox ID="lang" runat="server" Width="250px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="font-family: calibri; font-style: normal" width="100%">
                            <hr />
                        </td>
                        <td style="font-family: calibri; font-style: normal" width="100%">
                            &nbsp;</td>
                        <td style="font-family: calibri; font-style: normal" width="100%">
                            &nbsp;</td>
                    </tr>
                    <tr>
            <td width="150" style="font-family: calibri; text-transform: capitalize">
                Activities:</td>
            <td width="700px">
                <asp:TextBox ID="act_txt" runat="server" Width="250px"></asp:TextBox>
            </td>
            <td width="700px">
                &nbsp;</td>
            <td width="700px">
                &nbsp;</td>
                    </tr>
                    <tr>
            <td style="font-family: calibri; font-style: normal">
                Interest :</td>
            <td>
                <asp:TextBox ID="int_txt" runat="server" Width="250px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
                    </tr>
                    <tr>
            <td width="30%" style="font-family: calibri; font-style: normal" colspan="2">
                            <hr />
                        </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
                    </tr>
                    <tr>
            <td style="font-family: calibri; font-style: normal">
                Employer:</td>
            <td style="font-family: calibri; font-style: normal; width: 15%;">
                <asp:TextBox ID="emp_txt" runat="server" Width="250px"></asp:TextBox>
                        </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
                    </tr>
                    <tr>
            <td style="font-family: calibri; font-style: normal" class="style1">
                College:</td>
            <td width="30%" style="font-family: calibri; font-style: normal; width: 15%;">
                <asp:TextBox ID="clg_txt" runat="server" Width="250px"></asp:TextBox>
                        </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
                    </tr>
                    <tr>
            <td style="font-family: calibri; font-style: normal">
                High School:</td>
            <td width="30%" style="font-family: calibri; font-style: normal; width: 15%;">
                <asp:TextBox ID="sch_txt" runat="server" Width="250px"></asp:TextBox>
                        </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="font-family: calibri; font-style: normal" width="100%">
                            <hr />
                        </td>
                        <td style="font-family: calibri; font-style: normal" width="100%">
                            &nbsp;</td>
                        <td style="font-family: calibri; font-style: normal" width="100%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="font-family: calibri; font-style: normal" width="150px">
                            Relationship Status :</td>
                        <td style="font-family: calibri; font-style: normal">
                            <asp:DropDownList ID="relation_drop" runat="server" Width="150px">
                                <asp:ListItem>single</asp:ListItem>
                                <asp:ListItem>in a relationship</asp:ListItem>
                                <asp:ListItem>married</asp:ListItem>
                                <asp:ListItem>engaged</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td style="font-family: calibri; font-style: normal">
                            &nbsp;</td>
                        <td style="font-family: calibri; font-style: normal">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="font-family: calibri; font-style: normal" width="100%">
                            <hr />
                        </td>
                        <td style="font-family: calibri; font-style: normal" width="100%">
                            &nbsp;</td>
                        <td style="font-family: calibri; font-style: normal" width="100%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="left" style="font-family: calibri; font-style: normal" width="10%">
                            About Me</td>
                        <td>
                            <asp:TextBox ID="about" runat="server" Width="250px" TextMode="MultiLine"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="font-family: calibri; font-style: normal" width="100%">
                            <hr />
                        </td>
                        <td style="font-family: calibri; font-style: normal" width="100%">
                            &nbsp;</td>
                        <td style="font-family: calibri; font-style: normal" width="100%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="left" style="font-family: calibri; font-style: normal">
                            &nbsp;</td>
                        <td>
                            <asp:Button ID="savechanges_btn" runat="server" onclick="savechanges_btn_Click" 
                                style="height: 26px" Text="Next &gt;&gt;" Width="120px" />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
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
