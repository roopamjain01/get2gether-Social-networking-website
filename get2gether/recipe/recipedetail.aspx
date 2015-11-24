<%--
'++++++++++++++++++++++++++++++++++++++++++++
'+Purpose: This ASP.NET application was developed by (Gagan Sahoo) of pearlsoft.com to help classic 
'+ASP coders and beginners to learn ASP.NET in VB without having to use or rely too much on Visual Studio.NET, and applying  the skills 
'+and tricks they've learned from classic ASP. The advantage of hand coding is the total control of the HTML,JavaScript and most of all CSS-P layout. This does not mean to completly eliminate/ignore the use of VS.NET. For a large enterprise project, VS.NET is the best tools to use. 
'+
'++++++++++++++++++++++++++++++++++++++++++++
--%>

<%@ Page Language="VB" Debug="true" EnableSessionState="false" EnableViewState="false" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Web.Mail" %>

<script runat="server">

'++++++++++++++++++++++++++++++++++++++++++++
 'Handle page load event
 Sub Page_Load(Sender As Object, E As EventArgs)

      If Not Page.IsPostBack Then   

           Display_Record()
           CatMenu_Comments_Related_StarRating_NewestPopular()
            AddHits()
           Display_LetterLinks()
           
            RandomRecipe()
            Get_TotalComments()

     End if
                
  End Sub
'++++++++++++++++++++++++++++++++++++++++++++
 




'++++++++++++++++++++++++++++++++++++++++++++
  'Display the alphabetical letter listing in the footer
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
'Display our records
 Sub Display_Record()

      Try

           'SQL display details and rating value
           strSQL = "SELECT * FROM Recipes WHERE LINK_APPROVED = 1 AND id=" & Request.QueryString("id")
    
            Dim objDataReader as OledbDataReader
            
            'Call Open database - connect to the database
            DBconnect()

            objConnection.Open()
            objDataReader  = objCommand.ExecuteReader()
    
            'Read data
            objDataReader.Read()

            intCatID = objDataReader("CAT_ID")
            totalcomments = objDataReader("TOTAL_COMMENTS")
    
            lblname.text = objDataReader("Name")
            lblauthor.Text = objDataReader("Author")
            lblhits.Text = objDataReader("Hits")
            lblcategorytop.Text = "Other&nbsp;" & objDataReader("Category") & "&nbsp;recipes you might be interested"
            lbldate.Text = objDataReader("Date")            
            lblIngredients.text = Replace(objDataReader("Ingredients"), Chr(13), "<br>")
            lblInstructions.text = Replace(objDataReader("Instructions"), Chr(13), "<br>")
            strRName = objDataReader("Name")
            strCName = objDataReader("Category")

            HyperLink2.NavigateUrl = "pageview.aspx?tab=1&catid=" & objDataReader("CAT_ID")
            HyperLink2.Tooltip = "Go to " & objDataReader("Category") & " recipe category"
            HyperLink2.Text = objDataReader("Category")
            HyperLink3.NavigateUrl = "pageview.aspx?tab=1&catid=" & objDataReader("CAT_ID")
            HyperLink3.Tooltip = "Go to " & objDataReader("Category") & " recipe category"
            HyperLink3.Text = objDataReader("Category")
            HyperLink4.NavigateUrl = "default.aspx"
            HyperLink4.Text = "Recipe Home"
            HyperLink4.ToolTip = "Back to recipe homepage"
 
            'Display popular text if recipe Hits greater than 1000
            Dim strPopular as integer
            strPopular = objDataReader("HITS")

            If strPopular > 2500 Then

                lblpopular.text = "Popular"
                thumbsup.ImageUrl = "images/thup.gif"

            Else

             thumbsup.visible = False

           End If

            'Display new image if recipe is a week old
            Dim strDate as Date
            Dim DateSince as string
            strDate = objDataReader("Date")
            DateSince = DateDiff("d", DateTime.Now, strDate) + 7

           if DateSince >= 0 Then

               newimage.ImageUrl = "images/new.gif"

               Else

               newimage.visible = False

           End If

             'Close the reader
             objDataReader.Close()

     Catch ex As Exception

            HttpContext.Current.Response.Write("<b>AN ERROR OCCURRED:</b><br>" & _
                               ex.StackTrace & "<br><br>" & ex.Message & "<br><br><p>Please <a href='mailto:webmaster@mydomain.com'>e-mail us</a> providing as much detail as possible including the error message, what page you were viewing and what you were trying to achieve.<p>")

            HttpContext.Current.Response.Flush()
            HttpContext.Current.Response.End()


     Finally

          'Close connection
          objConnection.Close() 

     End Try

 End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
'Get total comments value from the total comments field, and check the value if it is greater or equal than one
 Sub Get_TotalComments()
            
         If totalcomments >= 1 Then

              'Display the total comments value, and enabled the hyperlink

         Elseif totalcomments = 0 Then

             'Display the total comments value, and disabled the hyperlink

         End If

 End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
 'Display Category menu, Comments, Star rating, Related recipe, Newest and Most Popular recipes
 ' This process is to minimize the connection to the database
 Sub CatMenu_Comments_Related_StarRating_NewestPopular()
         
       Dim strSQLRelated, strSQLCategoryMenu, strSQLComments, strSQLNewestRecipes, strSQLMostPopular, strSQLGetStarRating as string

   Try

       'Here we create our connection string to connect to the database
       objConnection = New OledbConnection(strConnection)
        
strSQLRelated = "SELECT Top 10 ID, CAT_ID,Category,Name,HITS FROM Recipes WHERE LINK_APPROVED = 1 AND CAT_ID =" & Replace(intCatID, "'", "''") & "  ORDER BY ID ASC"

         objCommand = New OledbCommand(strSQLRelated, objConnection)

         Dim AdapterRelated as New OledbDataAdapter(objCommand)
         Dim dtsRelatedRecipe as New DataSet()
         AdapterRelated.Fill(dtsRelatedRecipe, "Name")

         RelatedRecipes.DataSource = dtsRelatedRecipe.Tables("Name").DefaultView
         RelatedRecipes.DataBind()

strSQLCategoryMenu = "SELECT *, (SELECT COUNT (*) FROM Recipes WHERE Recipes.CAT_ID = RECIPE_CAT.CAT_ID AND LINK_APPROVED = 1) AS REC_COUNT FROM RECIPE_CAT ORDER BY CAT_TYPE ASC"

        objCommand = New OledbCommand(strSQLCategoryMenu, objConnection)

         Dim AdapterCategoryMenu as New OledbDataAdapter(objCommand)
         Dim dtsCategoryMenu as New DataSet()
         AdapterCategoryMenu.Fill(dtsCategoryMenu, "CAT_ID")

         CategoryName.DataSource = dtsCategoryMenu.Tables("CAT_ID").DefaultView
         CategoryName.DataBind()

 strSQLComments = "SELECT * From COMMENTS_RECIPE Where ID=" & Request.QueryString("id") & " Order By Date Desc"

         objCommand = New OledbCommand(strSQLComments, objConnection)

         Dim AdapterDisplayComments as New OledbDataAdapter(objCommand)
         Dim dtsDisComments as New DataSet()
         AdapterDisplayComments.Fill(dtsDisComments, "ID")

         
 strSQLNewestRecipes = "SELECT Top 15 ID,Name,HITS,Category FROM Recipes Where LINK_APPROVED = 1 Order By Date DESC"

         objCommand = New OledbCommand(strSQLNewestRecipes, objConnection)

         Dim AdapterNewestRecipe as New OledbDataAdapter(objCommand)
         Dim dtsNewestRecipe as New DataSet()
         AdapterNewestRecipe.Fill(dtsNewestRecipe, "ID")

         NewestRecipes.DataSource = dtsNewestRecipe.Tables("ID").DefaultView
         NewestRecipes.DataBind()

strSQLMostPopular = "SELECT Top 15 ID,Name,HITS,Category FROM Recipes Where LINK_APPROVED = 1 Order By HITS DESC"

        objCommand = New OledbCommand(strSQLMostPopular, objConnection)

         Dim AdapterMostPopular as New OledbDataAdapter(objCommand)
         Dim dtsMostPopular as New DataSet()
         AdapterMostPopular.Fill(dtsMostPopular, "ID")

         TopRecipes.DataSource = dtsMostPopular.Tables("ID").DefaultView
         TopRecipes.DataBind()

 strSQLGetStarRating = "SELECT *, (RATING/NO_RATES) AS Rates FROM Recipes WHERE LINK_APPROVED = 1 AND ID =" & Request.QueryString("id")
          
         objCommand = New OledbCommand(strSQLGetStarRating, objConnection)

         Dim AdapterStarRating as New OledbDataAdapter(objCommand)
         Dim dtsStarRating as New DataSet()
         AdapterStarRating.Fill(dtsStarRating, "ID")

         StarRating.DataSource = dtsStarRating.Tables("ID").DefaultView
         StarRating.DataBind()
    
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
  'Page level error handling - If page encounter an error, then redirect to the custom error page
  Protected Overrides Sub OnError(ByVal e As System.EventArgs)

     Server.Transfer("error.aspx")

  End Sub
'++++++++++++++++++++++++++++++++++++++++++++



'++++++++++++++++++++++++++++++++++++++++++++
  'Increment hits by 1 every time a page load
  Sub AddHits()               

            strSQL = "Update Recipes set HITS = HITS + 1  where id=" & Request.QueryString("id")

            'Call Open database - connect to the database
            DBconnect()

            objConnection.Open()
            objCommand.ExecuteNonQuery()
    
            'Close the db connection and free up memory
            DBclose()

  End Sub
'++++++++++++++++++++++++++++++++++++++++++++




 




'++++++++++++++++++++++++++++++++++++++++++++
  'Pulls and display random recipe records
  Sub RandomRecipe()

   Try

        strSQL = "SELECT ID,CAT_ID,Category,Name,Author,Date,HITS,RATING,NO_RATES, (RATING/NO_RATES) AS Rates FROM Recipes"

         Dim objDataReader as OledbDataReader
            
        'Call Open database - connect to the database
        DBconnect()

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
 'Database connection string - Open database
 Sub DBconnect()

     objConnection = New OledbConnection(strConnection)
     objCommand = New OledbCommand(strSQL, objConnection)

 End Sub
'++++++++++++++++++++++++++++++++++++++++++++



'++++++++++++++++++++++++++++++++++++++++++++
 'Close the db connection and free up memory
 Sub DBclose()

    objCommand = nothing
    objConnection.Close()
    objConnection = nothing

 End Sub
'++++++++++++++++++++++++++++++++++++++++++++


'++++++++++++++++++++++++++++++++++++++++++++
'Handle basic automatic form submission security code
'Note: this is a very basic protection and no guarantee it will stop the spam boot or automatic submission
  Function GetRandomNumberInRange(intLowerBound As Integer, intUpperBound As Integer)
    
      Dim RandomGenerator As Random
      Dim intRandomNumber As Integer
		
      'Create and init the randon number generator
      RandomGenerator = New Random()

      'Get the next random number
      intRandomNumber = RandomGenerator.Next(intLowerBound, intUpperBound + 1)

      'Return the random # as the function's return value
      GetRandomNumberInRange = intRandomNumber

  End Function
'++++++++++++++++++++++++++++++++++++++++++++



'+++++++++++++++++++++++++++++++++++++++++++++++++
'Here we declare our module-level variables 
'These variables can be access through all the procedures in this module

    Private strDBLocation = DB_Path()
    Private strConnection as string = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBLocation
    Private objConnection
    Private objCommand
    Private strSQL as string
    Private iRandomRecipe as integer
    Private strRName as string
    Private strCName as string
    Private intCatID as integer
    Private totalcomments as integer
    Private strRecURL as string

'++++++++++++++++++++++++++++++++++++++++++++

</script>

<!--#include file="inc_databasepath.aspx"--> 
<!--#include file="inc_header.aspx"--> 

<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td width="16%" valign="top" align="left" rowspan="2">
<!--#include file="inc_navmenu.aspx"-->
<!--Begin Display Category Menu-->
<div class="roundcont">
<div class="roundtop">
<img src="images/hleft.gif" height="5" width="5" alt="" class="corner">
<div class="dcnt"><span class="content3">Categories</span></div> 
</div>
</div>
<div class="contentdisplay">
<div class="contentdis5">
<asp:DataList cssClass="hlink" id="CategoryName" runat="server">
   <ItemTemplate>
<div class="dcnt2">
<span class="ora1">&raquo;</span> <a class="dt" title="Go to <%# DataBinder.Eval(Container.DataItem, "CAT_TYPE") %> category" href='<%# DataBinder.Eval(Container.DataItem, "CAT_ID", "pageview.aspx?tab=1&catid={0}") %>'><%# DataBinder.Eval(Container.DataItem, "CAT_TYPE") %></a> <span class="catcntsml">(<%# DataBinder.Eval(Container.DataItem, "REC_COUNT") %>)</span>
</div>
   </ItemTemplate>
  </asp:DataList>
</div>
</div>	
<!--End Display Category Menu-->
</td>
    <td width="68%" valign="top" align="left">
<!--#include file="inc_searchtab.aspx"-->
<div style="text-align: left; margin-left: 10px; margin-right: 12px; background-color: #FFF9EC;"  margin-bottom: 10px;">&nbsp;
                        <asp:HyperLink id="HyperLink4" cssClass="dtcat" runat="server" />
                       <span class="bluearrow">»</span>
                     <asp:HyperLink id="HyperLink3" cssClass="dtcat" runat="server" />
                   <span class="bluearrow">»</span>&nbsp;<span class="content10"><%=strRName%></span>
                  </div>
<div style="padding: 2px; text-align: center; margin-bottom: 14px; margin-top: 12px; margin-left: 6px; margin-right: 6px;">
   <asp:Label cssClass="corange" runat="server" id="lblletter" />
   <asp:Label id="lblalphaletter" font-name="verdana" font-size="9" runat="server" />
</div>
<!--Begin header User option-->
<div style="margin-left: 10px; margin-right: 10px;">
<div class="divheaddetail">
<img src="images/tlcorner.gif" alt="" align="top">
<img src="images/save_icon.gif" align="absmiddle" alt="Save/Add <%=strRName%> recipe to your favorite"> 
<a class="dt" title="Save/Add <%=strRName%> recipe to favorite" href="JavaScript:window.external.AddFavorite('http://www.myasp-net.com/recipedetail.aspx?id=<%=Request.QueryString("id")%>', '<%=strRName%>')">Save to favorite</a>&nbsp;&nbsp;
<img src="images/discuss_icon.gif" align="absmiddle" alt="Discuss <%=strRName%> recipe"> 
<a class="dt" title="Discuss <%=strRName%> recipe" href="#DIS">Write a comment</a>&nbsp;&nbsp;
<img src="images/print_icon.gif" align="absmiddle" alt="Print <%=strRName%> recipe"> 
<a class="dt" title="Print <%=strRName%> recipe" href="#" onClick="window.open('print.aspx?id=<%=Request.QueryString("id")%>','','width=650,height=500,scrollbars=yes,resizable=yes,status=no'); return false;">Print this recipe</a>&nbsp;&nbsp;
<img src="images/email_icon.gif" align="absmiddle" alt="Email <%=strRName%> recipe to friend"> 
<a class="dt" title="Email <%=strRName%> recipe to friend" href="#" onClick="window.open('emailrecipe.aspx?id=<%=Request.QueryString("id")%>&amp;n=<%=strRName%>&amp;c=<%=strCName%>','','width=400,height=400,status=no'); return false;">Email this recipe</a>
</div>
<!--End header User option-->
<div style="background-color: #fcfcfc; margin-top: 4px;">
&nbsp;&nbsp;<asp:Label cssClass="cmaron4" runat="server" id="lblname" /> <asp:Label runat="server" id="lblpopular" class="hot" /> <asp:Image id="newimage" runat="server" AlternateText = "New image" /><asp:Image id="thumbsup" runat="server" AlternateText = "Thumsb up" />
</div>
<div style="background-color: #fcfcfc;">
&nbsp;&nbsp;<asp:Label cssClass="content2" runat="server" id="lblcategorydis" /> 
<asp:HyperLink id="HyperLink2" cssClass="dt" runat="server" />
</div>
<div style="background-color: #fcfcfc;">
&nbsp;&nbsp;<asp:Label cssClass="content2" runat="server" id="lblauthordis"/> 
<asp:Label runat="server" id="lblauthor" class="content2" />
</div>
<div style="background-color: #fcfcfc;">
&nbsp;&nbsp;<asp:Label cssClass="content2" runat="server" id="lbldatedis" />
<asp:Label runat="server" id="lbldate" class="content2" />
</div>
<div style="background-color: #fcfcfc;">
&nbsp;&nbsp;<asp:Label cssClass="content2" runat="server" id="lblhitsdis" />
<asp:Label runat="server" id="lblhits" class="cmaron3" />
</div>
<div style="background-color: #fcfcfc; margin-bottom: 12px;">
<asp:DataList cssClass="hlink" id="StarRating" RepeatColumns="1" runat="server">
   <ItemTemplate>
&nbsp;&nbsp;<span class="content2">Rating:</span><img src="images/<%# FormatNumber((DataBinder.Eval(Container.DataItem, "Rates")), 1,  -2, -2, -2) %>.gif" style="vertical-align: middle;" alt="Rating <%# FormatNumber((DataBinder.Eval(Container.DataItem, "Rates")), 1, -2, -2, -2) %>"><span class="content2">(<span class="cmaron3"><%# FormatNumber((DataBinder.Eval(Container.DataItem, "Rates")), 1, -2, -2, -2) %></span>) by <span class="cmaron3"><%# DataBinder.Eval(Container.DataItem, "NO_RATES") %></span> users</span>
    </ItemTemplate>
  </asp:DataList>
</div>
<div style="margin: 6px;">
 <fieldset><legend>Ingredients:</legend>
 <div style="padding-top: 12px; padding-right: 12px;">
  <asp:Label cssClass="drecipe" ID="lblIngredients" runat="server" />
 </div>
</fieldset>
</div>
<div style="margin: 6px;">
 <fieldset><legend>Instructions:</legend>
  <div style="padding-top: 12px; padding-right: 12px;">
  <asp:Label cssClass="drecipe" ID="lblInstructions" runat="server" />
 </div>
</fieldset>
</div>
<form runat="server" style="margin-top: 0px; margin-bottom: 0px;">
<div style="margin-left: 22px; margin-top: 10px; margin-bottom: 15px;">
<span style="background-color: #F4F9FF; padding: 1px;"><asp:Label cssClass="content2" BackColor="#F4F9FF" runat="server" id="lblyourratingdis" /></span>
<ul class='srating'>
  <li><a href='#' onclick="javascript:top.document.location.href='rate.aspx?id=<%=request.querystring("id")%>&amp;rateval=1';" title='Rate recipe: Not sure - 1 star' class='onestar'>1</a></li>
  <li><a href='#' onclick="javascript:top.document.location.href='rate.aspx?id=<%=request.querystring("id")%>&amp;rateval=2';" title='Rate recipe: Fair - 2 stars' class='twostars'>2</a></li>
  <li><a href='#' onclick="javascript:top.document.location.href='rate.aspx?id=<%=request.querystring("id")%>&amp;rateval=3';" title='Rate recipe: Interesting - 3 stars' class='threestars'>3</a></li>
  <li><a href='#' onclick="javascript:top.document.location.href='rate.aspx?id=<%=request.querystring("id")%>&amp;rateval=4';" title='Rate recipe: Very good - 4 stars' class='fourstars'>4</a></li>
  <li><a href='#' onclick="javascript:top.document.location.href='rate.aspx?id=<%=request.querystring("id")%>&amp;rateval=5';" title='Rate recipe: Excellent - 5 stars' class='fivestars'>5</a></li>
</ul>
 </div>
<div style="margin-left: 6px; margin-right: 6px;  margin-bottom: 22px;">
<fieldset><legend><asp:Label runat="server" id="lblcategorytop" /></legend>
<div style="margin-top: 6px;">
   <asp:DataList cssClass="hlink" id="RelatedRecipes" RepeatColumns="1" runat="server">
   <ItemTemplate>
<span class="ora2">&raquo;</span>
<a class="dt" title="Category (<%# DataBinder.Eval(Container.DataItem, "Category") %>) - Hits (<%# DataBinder.Eval(Container.DataItem, "Hits") %>)" href='<%# DataBinder.Eval(Container.DataItem, "ID", "recipedetail.aspx?id={0}") %>'>
<%# DataBinder.Eval(Container.DataItem, "Name") %></a>
      </ItemTemplate>
  </asp:DataList>
</div>
</fieldset>
</div>
</div>
</td>
    <td width="16%" valign="top" align="left" rowspan="2">
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
<asp:DataList cssClass="hlink" id="TopRecipes" RepeatColumns="1" runat="server">
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
  </tr>
  <tr>
    <td width="68%" valign="top" align="left">
<div style="margin-left: 20px; margin-right: 20px;">
<!--Begin Display Comments-->
<%-- 
<table border="0" cellpadding="0" cellspacing="0" align="center" width="85%">
  <tr>
    <td width="100%" height="18" BgColor="#F4F9FF"><asp:Label id="ReadComments" cssClass="content6" runat="server" /></td>
  </tr>
  <tr>
    <td width="100%">
<asp:DataList width="100%" id="RecComments" RepeatColumns="1" runat="server">
      <ItemTemplate>
    <div class="divwrap2">
<div class="divbd2">
<b>Author:</b>&nbsp;<%# DataBinder.Eval(Container.DataItem, "AUTHOR") %>
<br />
<b>Email:</b>&nbsp;<%# DataBinder.Eval(Container.DataItem, "EMAIL") %>
<br />
<b>Date:</b>&nbsp; <%# FormatDateTime(DataBinder.Eval(Container.DataItem, "DATE"),vbShortDate) %>
<br />
<b>Comment:</b>
<br /> 
<%# Replace(DataBinder.Eval(Container.DataItem, "COMMENTS"), Chr(13), "<br>") %>
     </div>
   </div>
 </ItemTemplate>
</asp:DataList>
</td>
  </tr>
</table>
<!--End Display Comments-->
<!--Begin Comment Field-->
<div style="margin-left: 40px; margin-right: 40px;">
<fieldset><legend><a style="text-decoration: none; color: #336699;" name="DIS"><asp:Label runat="server" id="lblname2" /></legend>
<table border="0" align="center" cellpadding="2" cellspacing="2" width="60%">
  <tr>
    <td width="100%" colspan="2"></a>
<br />
<asp:Label cssClass="cred3" runat="server" id="lblallfieldsrequired" /></td>
  </tr>
  <tr>
    <td width="21%" class="content2"><asp:Label cssClass="content2" runat="server" id="lblyournamedis" /><span class="cred2">*</span></td>
    <td width="79%">
<input type="text" id="AUTHOR" name="AUTHOR" Class="textbox" runat="server" size="20" maxlenght="20" onFocus="this.style.backgroundColor='#FFF9EC'" onBlur="this.style.backgroundColor='#ffffff'" />
<asp:RequiredFieldValidator runat="server"
      id="reqName" ControlToValidate="AUTHOR"
      cssClass="cred2"
      ErrorMessage = "Enter your name!"
      display="Dynamic" />
</td>
  </tr>
  <tr>
    <td width="21%" class="content2"><asp:Label cssClass="content2" runat="server" id="lblyouremaildis" /><span class="cred2">*</span></td>
    <td width="79%">
<input type="text" id="EMAIL" name="EMAIL"" Class="textbox" runat="server" size="30" maxlenght="30" onFocus="this.style.backgroundColor='#FFF9EC'" onBlur="this.style.backgroundColor='#ffffff'" />
 <asp:RequiredFieldValidator runat="server"
      id="reqEmail" ControlToValidate="EMAIL"
      cssClass="cred2"
      ErrorMessage = "Enter your email!"
      display="Dynamic">
 </asp:RequiredFieldValidator>
 <asp:RegularExpressionValidator id="RegularExpressionValidator1" runat="server"
            ControlToValidate="EMAIL"
            ValidationExpression="^[\w-]+@[\w-]+\.(com|net|org|edu|mil)$"
            Display="Static"
            cssClass="cred2">
 Enter a valid e-mail
 </asp:RegularExpressionValidator>
</td>
  </tr>
  <tr>
    <td width="21%" valign="top" class="content2"><asp:Label cssClass="content2" runat="server" id="lblcommentsdis" /><span class="cred2">*</span>
<br />
<br />
<span class="catcntsml">Only 200 char allowed</span>
</td>
    <td width="79%"><textarea id="COMMENTS" name="COMMENTS" Class="textbox" cols="55" rows="7" onKeyDown="textCounter(this.form.COMMENTS,this.form.remLen,200);" onKeyUp="textCounter(this.form.COMMENTS,this.form.remLen,200);" onFocus="this.style.backgroundColor='#FFF9EC'" onBlur="this.style.backgroundColor='#ffffff'"  runat="server" /> 
<input class="textbox" type="text" name="remLen" size="3" maxlength="3" value="200" readonly> <span class="catcntsml">Char count</span>
<br />
<asp:RequiredFieldValidator runat="server"
      id="reqComments" ControlToValidate="COMMENTS"
      cssClass="cred2"
      ErrorMessage = "Enter a comment!"
      display="Dynamic" />
<asp:Label cssClass="cred2" runat="server" id="lblcomcharlimit" visible="false" />
<input type="hidden" value="<%=Request.QueryString("id")%>" ID="ID" name="ID">
<input type="text" class="textbox" ID="hd" name="hd" runat="server" style="visibility:hidden;">
<br />
<span class="content2">Security Code:</span>
<asp:Label id="lblRanNumberCode" BorderStyle="None" Font-Name="Verdana" ForeColor="#000000" Font-Size="12" Font-Bold="true" runat="server" />
<br /><span class="content2">Enter Security Code:<span class="cred2">*</span></span>
<input type="text" class="textbox" id="textEnterRanNumber" name="textEnterRanNumber" size="8" maxlength="8" runat="server" onFocus="this.style.backgroundColor='#FFF9EC'" onBlur="this.style.backgroundColor='#ffffff'" /> 
<asp:CompareValidator id="valCompare" runat="server"
    ControlToValidate="hd" ControlToCompare="textEnterRanNumber"
    ErrorMessage="<br>* You did not enter the code or the code you entered did not match."
    Display="dynamic" 
    cssClass="cred2" />
<br />
<asp:Button runat="server" Text="Submit" id="AddComments" class="submit" onclick="Add_Comment"/>
      </td>
    </tr>
   </table>
</fieldset>
</div>

--%>
<!--End Comment Field-->
</form>
</div>
</td>
  </tr>
</table>
<div style="height: 45px;"></div>
<!--#include file="inc_footer.aspx"-->
