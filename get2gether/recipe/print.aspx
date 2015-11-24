<%@ Page Language="VB" Debug="true" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.Oledb" %>

<script runat="server">

 'Handle page load event
 Sub Page_Load(Sender As Object, E As EventArgs)
              

 'SQL display details and rating value
 strSQL = "SELECT * FROM Recipes WHERE LINK_APPROVED = 1 AND id=" & Request.QueryString("id")
    
            Dim objDataReader as OledbDataReader
            
            'Call Open database - connect to the database
            DBconnect()

            objConnection.Open()
            objDataReader  = objCommand.ExecuteReader()
    
            'Read data
            objDataReader.Read()

            lblingredientsdis.text = "Ingredients:"
            lblinstructionsdis.text = "Instructions:"
            lblname.text = "Recipe Name:&nbsp;" & objDataReader("Name")           
            lblIngredients.text = Replace(objDataReader("Ingredients"), Chr(13), "<br>")
            lblInstructions.text = Replace(objDataReader("Instructions"), Chr(13), "<br>")

           'Close database connection for the objDataReader
           objDataReader.Close()
           objConnection.Close() 

  End Sub


 'Database connection string - Open database
 Sub DBconnect()

     objConnection = New OledbConnection(strConnection)
     objCommand = New OledbCommand(strSQL, objConnection)

 End Sub

    'Declare public so it will accessible in all subs
    Public strDBLocation = DB_Path()
    Public strConnection as string = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBLocation
    Public objConnection
    Public objCommand
    Public strSQL as string

</script>

<!--#include file="inc_databasepath.aspx"-->      

<html>

<head><title>Printing Recipe</title>
<style type="text/css" media="screen">@import "cssreciaspx.css";</style>
</head>

<body>
<div style="margin: 50px;">
<table border="0" cellpadding="5" align="center" cellspacing="5" width="70%">
<tr>
    <td width="100%">
<asp:Label cssClass="content6" ID="lblname" runat="server" />
<br />
</td>
  </tr>
  <tr>
    <td width="100%">
<b><asp:Label cssClass="content6" runat="server" id="lblingredientsdis" /></b>
<br />
<asp:Label cssClass="content7" ID="lblIngredients" runat="server" />
</td>
  </tr>
  <tr>
    <td width="100%">
<asp:Label cssClass="content6" runat="server" id="lblinstructionsdis" />
<br />
<asp:Label cssClass="content7" ID="lblInstructions" runat="server" />
</td>
  </tr>
  <tr>
    <td width="100%">
<div stye="text-align: center;">
<a class="hlink" href="javascript:onClick=window.print()">Print Recipe</a>
</div>
</td>
  </tr>
</table>
</div>

</body>

</html>
