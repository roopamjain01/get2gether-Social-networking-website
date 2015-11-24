<%@ Page Language="C#" AutoEventWireup="true" CodeFile="art1.aspx.cs" Inherits="SiteMember_art1" %>

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
            <td colspan="3" style="font-family: Calibri; text-transform: capitalize">
                
                <table>
                    <tr>
                        <td width="120">
                            Music:</td>
                        <td width="900px">
             <asp:TextBox ID="music_txt" runat="server" Width="280px"></asp:TextBox>
             
                        </td>
                    </tr>
                   
                <table>
                    <tr>
                        <td width="120">
                            Books:</td>
                        <td width="900px">
             <asp:TextBox ID="book_txt" runat="server" Width="280px"></asp:TextBox>
            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Movies:</td>
                        <td>
             <asp:TextBox ID="movie_txt" runat="server" Width="280px"></asp:TextBox>
             
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Television:</td>
                        <td>
             <asp:TextBox ID="tele_txt" runat="server" Width="280px"></asp:TextBox>
            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Games:</td>
                        <td>
             <asp:TextBox ID="game_txt" runat="server" Width="280px"></asp:TextBox>
             
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <hr />
                        </td>
                    </tr>
                    <tr>
                    <td>Email:</td>
                    <td>
                <asp:TextBox ID="email_txt" runat="server" Width="280px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="email_txt" ErrorMessage="Enter in Proper Format" 
                    Font-Names="Calibri" ForeColor="Red" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                      </tr>
                    <tr>
                    <td>Phone:</td>
                    <td>
                <asp:TextBox ID="ph_txt" runat="server" Width="280px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="ph_txt" ErrorMessage="Enter 10 Digit Number" 
                    Font-Names="Calibri" ForeColor="Red" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    </tr>
                    <tr>
                    <td>address:</td>
                    <td>
                <asp:TextBox ID="add_txt" runat="server" Width="280px"></asp:TextBox>
                        </td>
                    </tr>
                    </tr>
                    <tr>
                    <td>city:</td>
                    <td>
                <asp:TextBox ID="city_txt" runat="server" Width="280px"></asp:TextBox>
                        </td>
                    </tr>
                    </tr>
                    <tr>
                    <td colspan="2">
                            <hr />
                        </td>
                    </tr>
                  
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="savechanges_btn" runat="server" Text="Next &gt;&gt;" 
                onclick="savechanges_btn_Click" style="height: 26px" Width="120px" />
                        </td>
                    </tr>
                  
                    <tr>
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
