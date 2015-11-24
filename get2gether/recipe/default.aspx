<%--
'++++++++++++++++++++++++++++++++++++++++++++
'+ Programmer: Gagan Sahoo
'+ Website: Dexter Zafra, Norwalk, CA. USA
'+   
'+Purpose: This ASP.NET application was developed by (Gagan Sahoo) of Dexter Zafra, Norwalk, CA. USA to help classic 
'+ASP coders and beginners to learn ASP.NET in VB without having to use or rely too much on Visual Studio.NET, and applying  the skills 
'+and tricks they've learned from classic ASP. The advantage of hand coding is the total control of the HTML,JavaScript and most of all CSS-P layout. This does not mean to completly eliminate/ignore the use of VS.NET. For a large enterprise project, VS.NET is the best tools to use. 
'+
'++++++++++++++++++++++++++++++++++++++++++++
--%>

<%@ Page Language="VB" Debug="true" EnableSessionState="false" EnableViewState="false" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.OleDb" %>

<script runat="server">

'++++++++++++++++++++++++++++++++++++++++++++
  'Handle the page load event
  Sub Page_Load(Sender As Object, E As EventArgs)

     If Not Page.IsPostBack Then 

          MainCategory_NewestAndPopularRecipes()
          TotalRecipeCount()      
          Display_LetterLinks
          RandomRecipeNumber()
          RandomRecipe()
          RandomImage()

     End if
      
 End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
'Handle random image
 Sub RandomImage()

         Const NumberPics As Integer = 5
         Dim RandomImg As Random
         Dim intRandomPic As Integer
		
         RandomImg = New Random()
         intRandomPic = RandomImg.Next(1, NumberPics + 1)

         Myranimage.ImageUrl = "images/fo" & intRandomPic & ".gif"

         lblletter.Text = "Recipe A-Z:"

 End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
  'Display the alphabetical letter A-Z link
  Sub Display_LetterLinks()

      Dim i as Integer
      lblalphaletter.Text = string.empty

       for i = 65 to 90	
         lblalphaletter.text = lblalphaletter.text & "<a href=""pageview.aspx?tab=2&l=" & chr(i) & chr(34) & _
" class=""letter"" title="& chr(i) & ">" & chr(i) &  "</a>&nbsp;&nbsp;"
      next

 End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
 'Display Main Category,Newest and Most Popular recipes
 Sub MainCategory_NewestAndPopularRecipes()

        Dim strSQLCategory, strSQLNewest, strSQLPopular as string 

    Try
     
'SQL statement for the Main Recipe Category
strSQLCategory = "SELECT *, (SELECT COUNT (*)  FROM Recipes WHERE Recipes.CAT_ID = RECIPE_CAT.CAT_ID AND LINK_APPROVED = 1) AS REC_COUNT FROM RECIPE_CAT ORDER BY CAT_TYPE ASC"

         objCommand = New OledbCommand(strSQLCategory, objConnection)

         Dim AdapterCategory as New OledbDataAdapter(objCommand)
         Dim dtsCat as New DataSet()
         AdapterCategory.Fill(dtsCat, "CAT_ID")

         lbltotalCat.Text = CStr(dtsCat.Tables(0).Rows.Count) & "&nbsp;categories"

         RecipeCat.DataSource = dtsCat.Tables("CAT_ID").DefaultView
         RecipeCat.DataBind()
      
         'SQL statement for the Newest Recipes
         strSQLNewest = "SELECT Top 15 ID,Name,HITS,Category FROM Recipes Where LINK_APPROVED = 1 Order By Date DESC"
   
         objCommand = New OledbCommand(strSQLNewest, objConnection)

         Dim AdapterNew as New OledbDataAdapter(objCommand)
         Dim dtsNew as New DataSet()
         AdapterNew.Fill(dtsNew, "ID")

         NewestRecipes.DataSource = dtsNew.Tables("ID").DefaultView
         NewestRecipes.DataBind()

         'SQL statement for the Most Popular Recipes
         strSQLPopular = "SELECT Top 15 ID,Name,HITS,Category FROM Recipes Where LINK_APPROVED = 1 Order By HITS DESC"

         objCommand = New OledbCommand(strSQLPopular, objConnection)

         Dim AdapterPopular as New OledbDataAdapter(objCommand)
         Dim dtsPopular as New DataSet()
         AdapterPopular.Fill(dtsPopular, "ID")

         TopRecipe.DataSource = dtsPopular.Tables("ID").DefaultView
         TopRecipe.DataBind()

     Catch ex As Exception

         'Catch error message and output it to the browser
         HttpContext.Current.Response.Write("<b>AN ERROR OCCURRED:</b>" & _
         "<br>" & ex.Message & "<br><br>" & ex.StackTrace & "")

         'Stop execution of the application and write the error message
         HttpContext.Current.Response.Flush()
         HttpContext.Current.Response.End()

     Finally

         'Close database connection
         objConnection.Close()

     End Try

 End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
  'Handle record count
  Sub TotalRecipeCount()

        Dim CmdCount As New OleDbCommand("Select Count(ID) From Recipes", New OleDbConnection(strConnection))
        CmdCount.Connection.Open()
        lbltotalRecipe.Text = "There are &nbsp;" & CmdCount.ExecuteScalar() & "&nbsp;recipes in&nbsp;"
        CmdCount.Connection.Close()

  End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
  'Pulls a Random number for selecting a random recipe
  Sub RandomRecipeNumber()

        'It connects to database
        strSQL = "SELECT ID FROM Recipes"

        Dim objDataReader as OledbDataReader

        'Call sql command
        SQL_Command()

        objConnection.Open()
        objDataReader  = objCommand.ExecuteReader()

        'Counts how many records are in the database
        Dim iRecordNumber = 0
        do while objDataReader.Read()=True
            iRecordNumber += 1
        loop

        objDataReader.Close()
        objConnection.Close()

        'Here's where random number is generated
        Randomize()
        do
            iRandomRecipe = (Int(RND() * iRecordNumber))
        loop until iRandomRecipe <> 0

  End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
  'Pulls and display random/featured recipe
  Sub RandomRecipe()

   Try

        strSQL = "SELECT ID,CAT_ID,Category,Name,Author,Date,HITS,RATING,NO_RATES, (RATING/NO_RATES) AS Rates FROM Recipes"

         Dim objDataReader as OledbDataReader
            
        'Call sql command
        SQL_Command()

        objConnection.Open()
        objDataReader  = objCommand.ExecuteReader()

        Dim i = 0

        'Go until a random position
        do while i<>iRandomRecipe
            objDataReader.Read()
            i += 1
        loop

        Dim strRanRating as Double
        Dim strRatingimg as Double

        'Display recipe
        lblRating2.Text = "Rating:"
        lblRancategory.text = "Category:" 
        lblranhitsdis.text = "Hits:"
        lblranhits.text = objDataReader("Hits")
        strRanRating = FormatNumber(objDataReader("Rates"), 1,  -2, -2, -2)
        lblranrating.Text = strRanRating
        strRatingimg = FormatNumber(objDataReader("Rates"), 1,  -2, -2, -2)

        ranrateimage.ImageUrl = "images/" & strRatingimg & ".gif"
        ranrateimage.AlternateText = "rating: " & "(" & strRanRating & ")"

        LinkRanName.NavigateUrl = "recipedetail.aspx?id=" & objDataReader("ID")
        LinkRanName.Text = objDataReader("Name")
        LinkRanName.ToolTip = "View" & " - " & objDataReader("Name") & " - " & "recipe"
        LinkRanCat.NavigateUrl = "pageview.aspx?tab=1&catid=" & objDataReader("CAT_ID")
        LinkRanCat.Text = objDataReader("Category")
        LinkRanCat.ToolTip = "Go to" & " - " & objDataReader("Category") & " - " & "&category"

        'Close reader
        objDataReader.Close()

   Catch ex As Exception

       'Do nothing - skip execution
      
   Finally

        objConnection.Close()

   End Try

  End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
'Here we create our command and take a couple of arguments 
'then pass the strSQL statement and the connection string to the command
 Sub SQL_Command()

     objCommand = New OledbCommand(strSQL, objConnection)

 End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'+++++++++++++++++++++++++++++++++++++++++++++++++
'Here we declare our module-level variables 
'These variables can be access through all the procedures in this module

    Private strDBLocation = DB_Path()
    Private strConnection as string = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBLocation
    Private objConnection = New OledbConnection(strConnection)
    Private objCommand
    Private strSQL as string
    Private iRandomRecipe as integer

'++++++++++++++++++++++++++++++++++++++++++++

</script>

<!--#include file="inc_databasepath.aspx"-->
<!--#include file="inc_header.aspx"-->

<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
 <tr>
    <td width="15%" valign="top" align="left">
<!--#include file="inc_navmenu.aspx"-->
<!--Begin 15 Newest Recipes-->
<div class="roundcont">
<div class="roundtop">
<img src="images/hleft.gif" height="5" width="5" alt="" class="corner">
<div class="dcnt"><span class="content3">Newest Recipes </span><a title="title="Newest recipes RSS/XML feed" href="newrecipexml.aspx" target="_blank"><img src="images/xmlbtn.gif" height="9" width="19" border="0" title="Newest recipes RSS/XML feed" alt="Newest recipes RSS/XML feed"></a></div> 
</div>
</div>
<div class="contentdisplay">
<div class="contentdis5">
<asp:DataList cssClass="hlink" id="NewestRecipes" RepeatColumns="1" runat="server">
   <ItemTemplate>
<div class="dcnt2">
<a class="dt" title="Category (<%# DataBinder.Eval(Container.DataItem, "Category") %>) - Hits (<%# DataBinder.Eval(Container.DataItem, "Hits") %>)" href='<%# DataBinder.Eval(Container.DataItem, "ID", "recipedetail.aspx?id={0}") %>'>
<%# DataBinder.Eval(Container.DataItem, "Name") %></a>
</div>
      </ItemTemplate>
  </asp:DataList>
</div>
</div>
<!--End 15 Newest Recipes-->
    </td>
    <td width="70%" valign="top">
<!--#include file="inc_searchtab.aspx"-->
<div style="padding: 2px; text-align: left; margin-left: 40px; margin-bottom: 15px; margin-top: 16px; margin-right: 40px;">
<asp:Image id="Myranimage" runat="server"
 Width = 107 Height = 74
 AlternateText = "Recipe Random Image" Style="float:left;"
/>
<span class="content2">
You need a new dish in a hurry? Stumped by how to make that something special? We can help with your busy lifestyle. Take a look around and review our hundreds of free recipes or submit one of your own favorites.
</span>
</div>
<br />
<br />
<div style="padding: 2px; text-align: center; margin-left: 26px; margin-bottom: 12px; margin-right: 26px;">
<asp:Label cssClass="corange" runat="server" id="lblletter" />
<asp:Label id="lblalphaletter" font-name="verdana" font-size="9" runat="server" />
</div>
<div style="text-align: center; padding-top: 3px;"><asp:Label cssClass="content2" runat="server" id="lbltotalRecipe" /><asp:Label cssClass="content2" runat="server" id="lbltotalCat" />
</div>
<br />
<div style="text-align: center;  padding-bottom: 5px;"><span class="corange">Categories</span></div>
<asp:DataList id="RecipeCat" RepeatColumns="3" RepeatDirection="Horizontal" runat="server">
      <ItemTemplate>
     <div style="margin-left: 60px; margin-top: 3px; margin-bottom: 3px; margin-right: 10px;">  
<span class="bluearrow">&raquo;</span> <a class="catlink" title="<%# DataBinder.Eval(Container.DataItem, "CAT_TYPE") %> recipe" href='<%# DataBinder.Eval(Container.DataItem, "CAT_ID", "pageview.aspx?tab=1&catid={0}") %>'><%# DataBinder.Eval(Container.DataItem, "CAT_TYPE") %></a> <span class="catcount"><i>(<%# DataBinder.Eval(Container.DataItem, "REC_COUNT") %>)</i></span>
       </div>
      </ItemTemplate>
  </asp:DataList>
    </td>
    <td width="15%" valign="top" align="left">
<!--Begin Random Recipe-->
   <div class="roundcont">
<div class="roundtop">
<img src="images/hleft.gif" height="5" width="5" alt="" class="corner">
<div class="dcnt"><span class="content3">Featured Recipe</span></div> 
</div>
</div>
<div class="contentdisplay">
<div class="contentdis5">
<span class="bluearrow">&raquo;</span>
<asp:HyperLink id="LinkRanName" cssClass="dtcat" runat="server" />
<br />
<asp:Label cssClass="content8" runat="server" id="lblRancategory" /> <asp:HyperLink id="LinkRanCat" cssClass="dt2" runat="server" />
<br />
<asp:Label cssClass="content8" runat="server" id="lblranhitsdis" /> <asp:Label cssClass="cmaron2" runat="server" id="lblranhits" />
<br />
<asp:Label cssClass="content8" runat="server" id="lblRating2" /><asp:Image id="ranrateimage" runat="server" />(<asp:Label cssClass="cmaron2" runat="server" id="lblranrating" />)
</div>
</div>	
<!--End Random Recipe-->
<br />
<!--Begin 15 Most Popular-->
   <div class="roundcont">
<div class="roundtop">
<img src="images/hleft.gif" height="5" width="5" alt="" class="corner">
<div class="dcnt"><span class="content3">Most Popular </span><a title="title="Top recipes RSS/XML feed" href="toprecipexml.aspx" target="_blank"><img src="images/xmlbtn.gif" height="9" width="19" border="0" title="Top recipes RSS/XML feed" alt="Top recipes RSS/XML feed"></a></div> 
</div>
</div>
<div class="contentdisplay">
<div class="contentdis5">
<asp:DataList cssClass="hlink" id="TopRecipe" RepeatColumns="1" runat="server">
   <ItemTemplate>
<div class="dcnt2">
<a class="dt" title="Category (<%# DataBinder.Eval(Container.DataItem, "Category") %>) - Hits (<%# DataBinder.Eval(Container.DataItem, "Hits") %>)" href='<%# DataBinder.Eval(Container.DataItem, "ID", "recipedetail.aspx?id={0}") %>'>
<%# DataBinder.Eval(Container.DataItem, "Name") %></a>
</div>
      </ItemTemplate>
  </asp:DataList>
</div>
</div>
<!--End 15 Most Popular-->
<br />

</td>
  </tr>
</table>
<div style="margin-top: 20px;"></div>
<!--#include file="inc_footer.aspx"-->
