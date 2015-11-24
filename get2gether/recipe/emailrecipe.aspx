<%--
'+Purpose: This ASP.NET application was developed by (Gagan Sahoo) of pearlsoft.com to help classic 
'+ASP coders and beginners to learn ASP.NET in VB without having to use or rely too much on Visual Studio.NET, and applying  the skills 
'+and tricks they've learned from classic ASP. The advantage of hand coding is the total control of the HTML,JavaScript and most of all CSS-P layout. This does not mean to completly eliminate/ignore the use of VS.NET. For a large enterprise project, VS.NET is the best tools to use. 
'+
'++++++++++++++++++++++++++++++++++++++++++++
--%>

<%@ Page Language="VB" Debug="true" EnableSessionState="false" EnableViewState="false" %>
<%@ Import Namespace="System.Web.Mail" %>

<script language="VB" runat="server">

'++++++++++++++++++++++++++++++++++++++++++++
  Sub Page_Load(Source As Object, E As EventArgs)

    If Not Page.IsPostBack Then
      
            Dim strUrl As String = "http://pearlsoft.com/recipedetail.aspx?id=" & Request.QueryString("id")
      Dim strName as string = Request.QueryString("n")
      Dim strCat as string = Request.QueryString("c")
      Dim strBody As String

      strBody = "Hi," & vbCrLf & vbCrLf _
            & "I thought you might be interested in this recipe I found at www.mydomain.com:" & vbCrLf _
            & "Recipe Name: " & strName & vbCrLf _
            & "Category: " & strCat & vbCrLf _
            & vbCrLf _
            & strUrl & vbCrLf

      txtMessage.Text = strBody
    End If

  End Sub
'++++++++++++++++++++++++++++++++++++++++++++


'++++++++++++++++++++++++++++++++++++++++++++
  Sub btnSendMsg_OnClick(Source As Object, E As EventArgs)

  Try

    Dim Messagesnd As New MailMessage
    Dim sndingmail As SmtpMail
    Dim strHello as string

    If Page.IsValid() Then
      
      strHello = "Hello " & toname.text & "," & vbCrLf & vbCrLf _

      Messagesnd.From    = txtFromEmail.Text
      Messagesnd.To      = txtToEmail.Text
                Messagesnd.Bcc = "gbsahoo@yahoo.com"
      Messagesnd.Subject = txtFromName.Text & " has emailed you " & Request.QueryString("n") & " recipe"
      Messagesnd.Body    = strHello & txtMessage.Text & vbCrLf _
        & "This message was sent from: " _
        & Request.ServerVariables("SERVER_NAME") & "." _
        & vbCrLf & vbCrLf _
        & "You received this from :" & txtFromName.Text & " - " & txtFromEmail.Text & "."

      'SMTP server's name,localhost or ip address!
      sndingmail.SmtpServer = "localhost"
      sndingmail.Send(Messagesnd)

      Panel1.Visible = False

      lblsentmsg.Text = "Your message has been sent to " _
	    & txtToEmail.Text & "."
    End If

  Catch ex As Exception

            HttpContext.Current.Response.Write("<b>AN ERROR OCCURRED:</b><br>" & _
                               "<br>" & ex.Message & "<br><br>Your web server is not configured to use email component for sending an email. Contact you system adminstrator.<br><br><p>Please <a href='mailto:webmaster@mydomain.com'>e-mail us</a> providing as much detail as possible including the error message, what page you were viewing and what you were trying to achieve.<p>")

            HttpContext.Current.Response.Flush()
            HttpContext.Current.Response.End()

     End Try

  End Sub
'++++++++++++++++++++++++++++++++++++++++++++

</script>


<html>
<head>
<title>Sending Recipe To a Friend</title>
<style type="text/css" media="screen">@import "css/cssreciaspx.css";</style>
</head>
<body>
<asp:Panel ID="Panel1" runat="server">
<form runat="server">
<table align="center" cellspacing="0" cellpadding="0" width="40%">
<tr><td>
<br />
<div align="center"><h2>Sending <%=Request.QueryString("n")%> Recipe to a Friend</h2></div>
<table border="0" cellspacing="1" cellpadding="1" width="100%">
  <tr>
    <td valign="top" align="right" class="content6"><b>Your Name:</b></td>
    <td>
      <asp:TextBox id="txtFromName" size="25" cssClass="textbox" runat="server" />
      <asp:RequiredFieldValidator runat="server"
        id="validNameRequired" ControlToValidate="txtFromName"
        cssClass="cred2" errormessage="* Name:<br />"
        display="Dynamic" />
    </td>
  </tr>
  <tr>
    <td valign="top" align="right" class="content6"><b>Your Email:</b></td>
    <td>
      <asp:TextBox id="txtFromEmail" size="25" cssClass="textbox" runat="server" />
      <asp:RequiredFieldValidator runat="server"
        id="validFromEmailRequired" ControlToValidate="txtFromEmail"
        cssClass="cred2" errormessage="* Email:<br />"
        display="Dynamic" />
      <asp:RegularExpressionValidator runat="server"
        id="validFromEmailRegExp" ControlToValidate="txtFromEmail"
        ValidationExpression="^[\w-]+@[\w-]+\.(com|net|org|edu|mil)$"
        cssClass="cred2" errormessage="Not Valid"
        Display="Dynamic" />    
    </td>
  </tr>
<tr>
    <td valign="top" align="right" class="content6"><b>Friend's Name:</b></td>
    <td>
      <asp:TextBox id="toname" size="25" cssClass="textbox" runat="server" />
      <asp:RequiredFieldValidator runat="server"
        id="validFriendNameRequired" ControlToValidate="toname"
        cssClass="cred2" errormessage="* Name:<br />"
        display="Dynamic" />
    </td>
  </tr>
  <tr>
    <td valign="top" align="right" class="content6"><b>Friend's Email:</b></td>
    <td>
      <asp:TextBox id="txtToEmail" size="25" cssClass="textbox" runat="server" />
      <asp:RequiredFieldValidator runat="server"
        id="validToEmailRequired" ControlToValidate="txtToEmail"
        cssClass="cred2" errormessage="* Email:<br />"
        display="Dynamic" />
      <asp:RegularExpressionValidator runat="server"
        id="validToEmailRegExp" ControlToValidate="txtToEmail"
        ValidationExpression="^[\w-]+@[\w-]+\.(com|net|org|edu|mil)$"
        cssClass="cred2" errormessage="Not Valid:"
        Display="Dynamic" />  
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <asp:TextBox id="txtMessage" cssClass="textbox" Cols="50" TextMode="MultiLine"
        Rows="9" ReadOnly="True" runat="server" />
      <br />
    <asp:Button id="btnSend" cssClass="submit" Text="Send Recipe"
      OnClick="btnSendMsg_OnClick" runat="server" />
    </td>
  </tr>
</table>
</td></tr>
</table>
</form>
</asp:Panel>
<div style="text-align: center;" class="content2"><asp:HyperLink runat="server" NavigateUrl="JavaScript:onClick= window.close()" class="content2">Close Window</asp:HyperLink></div>
<br />
<br />
<asp:Label cssClass="content2" id="lblsentmsg" runat="server" />
</body>
</html>
