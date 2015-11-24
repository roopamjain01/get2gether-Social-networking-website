<%--
'++++++++++++++++++++++++++++++++++++++++++++
'+ Programmer: Gagan Sahoo
'+ Website: pearlsoft.com
'+   
'+Purpose: This ASP.NET application was developed by (Gagan Sahoo) of pearlsoft.com to help classic 
'+ASP coders and beginners to learn ASP.NET in VB without having to use or rely too much on Visual Studio.NET, and applying  the skills 
'+and tricks they've learned from classic ASP. The advantage of hand coding is the total control of the HTML,JavaScript and most of all CSS-P layout. This does not mean to completly eliminate/ignore the use of VS.NET. For a large enterprise project, VS.NET is the best tools to use. 
'+
'++++++++++++++++++++++++++++++++++++++++++++
--%>

<%@ Page Language="VB" Debug="true" EnableSessionState="false" EnableViewState="false" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.Oledb" %>

<script runat="server">

'++++++++++++++++++++++++++++++++++++++++++++
 'Handles page load events
  Sub Page_Load(Sender As Object, E As EventArgs)

      If Not Page.IsPostBack Then

           CheckRatingQueryVal()
           RatingCookie()
           InsertRating()

     End if
  
  End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
' Handle cookie rating
 Sub RatingCookie()

   Dim intRecID as integer
   intRecID = Request.QueryString("id")

   'Create cookie
   Response.Cookies("RecipeRating")("Recipe" & intRecID) = "True"
   Response.Cookies("RecipeRating").Expires = DateTime.Now.AddDays(7)

  'Check if the user has already rated the recipe then display an error message
  If Request.Cookies("RecipeRating")("Recipe" & intRecID) = "True" Then

  HttpContext.Current.Response.Write("<b>You have already rated this recipe.</b><br><br>Please hit your browser back button to go back to the previous page.")

  HttpContext.Current.Response.Flush()
  HttpContext.Current.Response.End()

  End If

 End Sub
'++++++++++++++++++++++++++++++++++++++++++++



'++++++++++++++++++++++++++++++++++++++++++++
'Check the rating parameter value
 Sub CheckRatingQueryVal()

   If Request.QueryString("id") = "" then

       Server.Transfer("error.aspx")

   End if

   If Request.QueryString("rateval") > 5 then

        Server.Transfer("error.aspx")

  ElseIf Request.QueryString("rateval") <= 0 then

       Server.Transfer("error.aspx")

  End if

 End Sub
'++++++++++++++++++++++++++++++++++++++++++++



'++++++++++++++++++++++++++++++++++++++++++++
'Insert the rating to the database
 Sub InsertRating()

   Dim urlredirect as string

 Try

'SQL insert rating   
strSQL = "Update Recipes  SET RATING = RATING + " & Replace(Request.QueryString("rateval"),"'","''") & ", NO_RATES = NO_RATES + 1 WHERE ID =" & Request.QueryString("id")
        
     DBconnect()

     objConnection.Open()
     objCommand.ExecuteNonQuery()

  Catch ex As Exception

          HttpContext.Current.Response.Write("<b>AN ERROR OCCURRED:</b><br>" & _
          ex.StackTrace & "<br><br>" & ex.Message & "<br><br><p>Please <a href='mailto:webmaster@mydomain.com'>e-mail us</a> providing as much detail as possible including the error message, what page you were viewing and what you were trying to achieve.<p>")

            HttpContext.Current.Response.Flush()
            HttpContext.Current.Response.End()
      
   Finally

    'Close the db connection
    objConnection.Close() 

   End try
           
     'Redirect to previous page after rating is complete
     urlredirect = "recipedetail.aspx?&id=" & Request.QueryString("id")
     Response.Redirect(urlredirect)

 End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
 'Database connection string - Open database
 Sub DBconnect()

     objConnection = New OledbConnection(strConnection)
     objCommand = New OledbCommand(strSQL, objConnection)

 End Sub
'++++++++++++++++++++++++++++++++++++++++++++



'++++++++++++++++++++++++++++++++++++++++++++
    Private strDBLocation = DB_Path()
    Private strConnection as string = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBLocation
    Private objConnection
    Private objCommand
    Private strSQL as string
'++++++++++++++++++++++++++++++++++++++++++++

</script>

<!--#include file="inc_databasepath.aspx"-->

