<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home1.aspx.cs" Inherits="home1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />   
  
    <style type="text/css">
        
    p.MsoNormal
	{margin-top:0cm;
	margin-right:0cm;
	margin-bottom:10.0pt;
	margin-left:0cm;
	text-align:justify;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	}
p.MsoListParagraphCxSpFirst
	{margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	margin-bottom:.0001pt;
	text-align:justify;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	}
p.MsoListParagraphCxSpMiddle
	{margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	margin-bottom:.0001pt;
	text-align:justify;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	}
p.MsoListParagraphCxSpLast
	{margin-top:0cm;
	margin-right:0cm;
	margin-bottom:10.0pt;
	margin-left:36.0pt;
	text-align:justify;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	}
        
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
        
        <td bgcolor="#337FC6" class="style1" colspan="3">
                <br />
                
            </td>
        </tr>
        
        <tr>
            <td colspan="3">
                
                <br />
&nbsp;&nbsp;&nbsp;
                
                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/login.aspx">Back to Login Page...</asp:LinkButton>
                &nbsp;&nbsp;&nbsp;
                <br />
                <br />
                <p class="MsoNormal">
                    <b style="mso-bidi-font-weight:normal">
                    <span style="font-size:18.0pt;mso-bidi-font-size:11.0pt">&nbsp;&nbsp;&nbsp; <u>
                    Get2Gether Help:<o:p></o:p></u></span></b></p>
                <p class="MsoListParagraphCxSpFirst" 
                    style="text-indent:-18.0pt;mso-list:l1 level1 lfo1">
                    <![if !supportLists]>
                    <span style="mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin">
                    <span style="mso-list:Ignore">1.<span 
                        style="font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </span></span></span><![endif]>Create your account using Join Us.</p>
                <p class="MsoListParagraphCxSpMiddle" 
                    style="text-indent:-18.0pt;mso-list:l1 level1 lfo1">
                    <![if !supportLists]>
                    <span style="mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin">
                    <span style="mso-list:Ignore">2.<span 
                        style="font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </span>
                    <span style="font-style: normal; font-variant: normal; font-weight: normal; line-height: normal;">
                    Fill your relevent details and SignUp to Join Get2Gether.</span></span></span><![endif]>
                </p>
                <p class="MsoListParagraphCxSpMiddle" 
                    style="text-indent:-18.0pt;mso-list:l1 level1 lfo1">
                    <![if !supportLists]>
                    <span style="mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin">
                    <span style="mso-list:Ignore">3.<span 
                        style="font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </span></span></span><![endif]>Then fill your personal information to initialize 
                    your account.</p>
                <p class="MsoListParagraphCxSpMiddle" 
                    style="text-indent:-18.0pt;mso-list:l1 level1 lfo1">
                    <![if !supportLists]>
                    <span style="mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin">
                    <span style="mso-list:Ignore">4.<span 
                        style="font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </span></span></span><![endif]>Fill the details and click next button to save.</p>
                <p class="MsoListParagraphCxSpMiddle" 
                    style="text-indent:-18.0pt;mso-list:l1 level1 lfo1">
                    <![if !supportLists]>
                    <span style="mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin">
                    <span style="mso-list:Ignore">5.<span 
                        style="font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </span></span></span><![endif]>We recommend to keep your image size less or 
                    equal to 2.5MB.</p>
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
</div></div>
    
    
    
 
    </form>
</body>
</html>
