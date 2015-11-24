<%--
'++++++++++++++++++++++++++++++++++++++++++++
--%>

<%@ Page Language="VB" Debug="true" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.Oledb" %>

<script runat="server">

'++++++++++++++++++++++++++++++++
'Handle page load event
  Sub Page_Load(Sender As Object, E As EventArgs)     

      If Not Page.IsPostBack Then

          intPageSize.text = "10"
          intCIndex.text = "0"
        
          CheckSearchString()
          CategoryMenu_NewestAndMostPopular_Recipes()
          SortCategoryLink()    
          Display_LetterLinks
          Check_OrderByAscDesc()   
          RandomRecipeNumber()
          RandomRecipe()
          DisplayLinkAndLabel()                       
          BindList()
        
     End If 
     
  End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
'Check the number of character entered in the search field
 Sub CheckSearchString()

         'If the search parameter is blank or the user enter less than 2 characters, then redirect to the error page
         Const intMinuiumSearchWordLength = 2
         Dim intSearchWordLength as string
         intSearchWordLength = Len(Request("find"))
	
         If intSearchWordLength <= intMinuiumSearchWordLength Then 
            Server.Transfer("error.aspx")		
         End If  

 End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
 Sub DisplayLinkAndLabel()

         lblletter.Text = "Recipe A-Z:"
         lblsortcat.text = "Sort Option:"    

         HyperLink1.NavigateUrl = "default.aspx"
         HyperLink1.Text = "Recipe Home"
         HyperLink1.ToolTip = "Back to recipe homepage"  

 End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
'Page level error handling - If the page encounter an error, redirect to the custom error page
  Protected Overrides Sub OnError(ByVal e As System.EventArgs)

    Server.Transfer("error.aspx")

  End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
'Display the alphabetical letter listing
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
'Display left Panel Categories, right panel Newest and Most Popular recipes
 Sub CategoryMenu_NewestAndMostPopular_Recipes()
         
 Dim strSQLCategoryMenu, strSQLNewestRecipes, strSQLMostPopular as string

         objConnection = New OledbConnection(strConnection)

strSQLCategoryMenu = "SELECT *, (SELECT COUNT (*)  FROM Recipes WHERE Recipes.CAT_ID = RECIPE_CAT.CAT_ID AND LINK_APPROVED = 1) AS REC_COUNT FROM RECIPE_CAT ORDER BY CAT_TYPE ASC"

         objCommand = New OledbCommand(strSQLCategoryMenu, objConnection)

         Dim AdapterCategoryMenu as New OledbDataAdapter(objCommand)
         Dim dtsCatMenu as New DataSet()
         AdapterCategoryMenu.Fill(dtsCatMenu, "CAT_ID")

         CategoryName.DataSource = dtsCatMenu.Tables("CAT_ID").DefaultView
         CategoryName.DataBind()

strSQLNewestRecipes = "SELECT Top 15 ID,Name,HITS,Category FROM Recipes Where LINK_APPROVED = 1 Order By Date DESC"

         objCommand = New OledbCommand(strSQLNewestRecipes, objConnection)

         Dim AdapterNewest as New OledbDataAdapter(objCommand)
         Dim dtsNewest as New DataSet()
         AdapterNewest.Fill(dtsNewest, "ID")

         RecipeNew.DataSource = dtsNewest.Tables("ID").DefaultView
         RecipeNew.DataBind()

strSQLMostPopular = "SELECT Top 15 ID,Name,HITS,Category FROM Recipes Where LINK_APPROVED = 1 Order By HITS DESC"
  
         objCommand = New OledbCommand(strSQLMostPopular, objConnection)

         Dim AdapterMostPopular as New OledbDataAdapter(objCommand)
         Dim dtsMostPopular as New DataSet()
         AdapterMostPopular.Fill(dtsMostPopular, "ID")

         RecipeTop.DataSource = dtsMostPopular.Tables("ID").DefaultView
         RecipeTop.DataBind()

         objConnection.Close()

 End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
'Bindlist Datasource
  Sub BindList()

         Dim intpageSize As Integer 
         Dim CategoryID as Integer
         Dim recipesqlorderby as string
         Dim action as string 
         Dim orderby as string
         Dim sortname as string
         Dim sqlorderby as string
         Dim strCaption as string
         Dim RcdCount As Integer
         Dim strSearchSQL as string
        
         CategoryID = Request.QueryString("l")

         action = Request.QueryString("action")
         action = "Date"
         orderby = "DESC"

       If Request.QueryString("sid") = "" Then
	    action = "Date"
            strCaption = "" 

        ElseIf Request.QueryString("sid") = "1" Then
            action = "NO_RATES"
            strCaption = "Sorted by: Highest Rated"

        ElseIf Request.QueryString("sid") = "2" Then
            action = "HITS"
            strCaption = "Sorted by: Most Popular"

        ElseIf Request.QueryString("sid") = "3" Then
            action = "Date"
            strCaption = "Sorted by: Newest"

        ElseIf Request.QueryString("sid") = "4" Then
	    action = "Name"
            strCaption = "Sorted by: Name ASC"
        
        ElseIf Request.QueryString("sid") > "4" Then
	    action = "Date"
            strCaption = ""             

   End If
   
  'If order ASC or DESC equals blank then grab the default value 
  'default value is set to Date field, else append from querystring OB = 1 ASC or 2 Desc
  If Request.QueryString("ob") <> "" Then
	orderby = Request.QueryString("ob")
  End If

   'Sort by whether Ascending or Descending
   If orderby = "1" Then
	orderby = "ASC"

    ElseIf orderby = "2" Then
	orderby = "DESC"

    ElseIf orderby > "2" Then
	orderby = "DESC"

    ElseIf orderby = "0" Then
	orderby = "DESC"

    ElseIf orderby < "0" Then
	orderby = "DESC"

  End If

         sqlorderby = " " & action & " " & orderby
         recipesqlorderby = "Date"
         if (sqlorderby <> "") then recipesqlorderby = sqlorderby
         
        
         'Search parameters
         if Request.QueryString("find") <> "" AND Request.QueryString("SDropName") <> "0" then
strSearchSQL = " WHERE CAT_ID =" & Request.QueryString("SDropName") & " AND Name LIKE '%" & Replace(Request.QueryString("find"),"'","''") & "%'"
             strSearchSQL += " OR Author LIKE '%" & Replace(Request.QueryString("find"),"'","''") & "%'"
             strSearchSQL += " OR Category LIKE '%" & Replace(Request.QueryString("find"),"'","''") & "%'"
         end iF

         if Request("chk1") = "1" Then
         'Search parameters
         if Request.QueryString("find") <> "" AND Request.QueryString("SDropName") <> "0" AND Request.QueryString("chk1") = "1" then
strSearchSQL = " WHERE CAT_ID =" & Request.QueryString("SDropName") & " AND Ingredients LIKE '%" & Replace(Request.QueryString("find"),"'","''") & "%'" 
             strSearchSQL += " OR Author LIKE '%" & Replace(Request.QueryString("find"),"'","''") & "%'"
             strSearchSQL += " OR Instructions LIKE '%" & Replace(Request.QueryString("find"),"'","''") & "%'"
             strSearchSQL += " OR Category LIKE '%" & Replace(Request.QueryString("find"),"'","''") & "%'"
         end iF
       end if


        if Request("chk2") = "2" Then
         'Search parameters
         if Request.QueryString("find") <> "" AND Request.QueryString("SDropName") <> "0" AND Request.QueryString("chk2") = "2" then
strSearchSQL = " WHERE CAT_ID =" & Request.QueryString("SDropName") & " AND Instructions LIKE '%" & Replace(Request.QueryString("find"),"'","''") & "%'" 
             strSearchSQL += " OR Author LIKE '%" & Replace(Request.QueryString("find"),"'","''") & "%'"
             strSearchSQL += " OR Category LIKE '%" & Replace(Request.QueryString("find"),"'","''") & "%'"
         end iF
       end if
    
         'Search parameters
         if Request.QueryString("find") <> "" AND Request.QueryString("SDropName") = "0" then
             strSearchSQL = " WHERE Name LIKE '%" & Replace(Request.QueryString("find"),"'","''") & "%'"
             strSearchSQL += " OR Author LIKE '%" & Replace(Request.QueryString("find"),"'","''") & "%'"
             strSearchSQL += " OR Category LIKE '%" & Replace(Request.QueryString("find"),"'","''") & "%'"
         end iF

        'Creates the SQL statement
strSQL = "SELECT *, (RATING/NO_RATES) AS Rates FROM Recipes" & strSearchSQL & " AND LINK_APPROVED = 1 ORDER BY " & Replace(recipesqlorderby, "'", "''") & "" 

         'Call sql command      
         SQL_Command()
       
         Dim RecipeAdapter as New OledbDataAdapter(objCommand)
         Dim dts as New DataSet()

         'Check if page is not postback, then display default
         If Not Page.IsPostBack Then
           RecipeAdapter.Fill(dts)
            intRcdCount.text = CStr(dts.Tables(0).Rows.Count)
           dts = Nothing
           dts = New DataSet()
         End If

         'Set our page size to 10 on defaultview
         Dim intPageSize2 as integer = 10
         Dim intCIndex2 as integer
         intCIndex2 = intCIndex.text

         RecipeAdapter.Fill(dts, Cint(intCIndex2), CInt(intPageSize2), "ID")

         RecipeCat.DataSource = dts.Tables(0).DefaultView         
         RecipeCat.DataBind()
         DisplayPageCount() 

         lblcaption.text = strCaption

       
     if Request.QueryString("find") <> "" AND Request.QueryString("SDropName") = "0" then

       lblrcdcount.text = "Your search for&nbsp;" & "(&nbsp;" & Request.QueryString("find") & "&nbsp;)&nbsp;in all categories return:&nbsp;" & intRcdCount.text & "&nbsp;records"

     End if

  
        if Request.QueryString("find") <> "" AND Request.QueryString("SDropName") <> "0" then

           strSQL = "SELECT CAT_TYPE FROM RECIPE_CAT WHERE CAT_ID =" & Request.QueryString("SDropName")
    
            Dim objDataReader as OledbDataReader
            
            'Call sql command
            SQL_Command()

            objConnection.Open()
            objDataReader  = objCommand.ExecuteReader()
    
            'Read data
            objDataReader.Read()

            lblrcdcount.text = "Your search for&nbsp;" & "(" & Request.QueryString("find") & ")" & "&nbsp;in&nbsp;" & objDataReader("CAT_TYPE") & "&nbsp;category return:&nbsp;" & intRcdCount.text & "&nbsp;records"

            'Close database connection for the objDataReader
            objDataReader.Close()
            objConnection.Close()

  end if 


        'Check if the page has more 10 records and display the paging links
         Dim strCatcounts as integer
         strCatcounts = intRcdCount.text

        If strCatcounts = 0 Then

           LinkMostPopular.Enabled = false
           LinkHighestRated.Enabled = false
           LinkNewest.Enabled = false
           LinkName.Enabled = false

           Panel1.visible = False

       lblrcdcount.Text = "<b>Sorry No Matches Found For Recipe:</b>&nbsp;(" & Request.QueryString("find") & ") Please try again."

        ElseIf strCatcounts <= 10 Then

           Panel1.visible = False

        ElseIf strCatcounts > 10 Then

           Panel1.visible = True

        End If
                
 End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
'Display record count,page number
  Sub DisplayPageCount()
     
       lblRecpage.Text = "Total Recipes:<b>&nbsp;" & intRcdCount.text
       lblRecpage.Text += "</b> - Showing Page:<b> "
       lblRecpage.Text += CStr(CInt(CInt(intCIndex.text) / CInt(intPageSize.text)+1))
       lblRecpage.Text += "</b> of <b>"

     If (CInt(intRcdCount.Text) Mod CInt(intPageSize.text)) > 0 Then
       lblRecpage.Text += CStr(CInt(CInt(intRcdCount.text) / CInt(intPageSize.text)+1))
     Else
       lblRecpage.Text += CStr(CInt(intRcdCount.text) / CInt(intPageSize.text))
     End If
       lblRecpage.Text += "</b>"

  End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
  'Jump to the first page - paging link
  Sub ShowFirst(ByVal s As Object, ByVal e As EventArgs)

       intCIndex.Text = "0"
       BindList()

  End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
  'Back to previous page - paging link
  Sub ShowPrevious(ByVal s As Object, ByVal e As EventArgs)

     intCIndex.text = Cstr(Cint(intCIndex.text) - CInt(intPageSize.text))

      If CInt(intCIndex.text) < 0 Then
        intCIndex.Text = "0"
      End If

     BindList()

  End Sub
'++++++++++++++++++++++++++++++++++++++++++++
  



'++++++++++++++++++++++++++++++++++++++++++++
  'Go to next page - paging link
  Sub ShowNext(ByVal s As Object, ByVal e As EventArgs)

    If CInt(intCIndex.text) + 1 < CInt(intRcdCount.text) Then
      intCIndex.text = CStr(CInt(intCIndex.text) + CInt(intPageSize.text))
    End If

    BindList()

 End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
  'Jump to last page - paging link
  Sub ShowLast(ByVal s As Object, ByVal e As EventArgs)

      Dim tmpInt as Integer

      tmpInt = CInt(intRcdCount.text) Mod CInt(intPageSize.text)

        If tmpInt > 0 Then
          intCIndex.text = Cstr(CInt(intRcdCount.text) - tmpInt)
        Else
          intCIndex.text = Cstr(CInt(intRcdCount.text) - CInt(intPageSize.text))
       End If

       BindList()

 End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
 'Display sort category links
 Sub SortCategoryLink()

        Dim strSid as integer = Request.QueryString("sid")
        Dim strfind as string = Request.QueryString("find")
        Dim strScat as integer = Request.QueryString("SDropName")
        strOB = Request.QueryString("ob")


        If strSid = "2" Then
           LinkMostPopular.NavigateUrl = "search.aspx?find=" & strfind & "&SDropName=" & strScat & "&sid=" & 2 & "&ob=" & 1
           LinkMostPopular.Text = "Most Popular"
           LinkMostPopular.ToolTip = "Sort by Most Popular Recipes ASC"                 
        Else 
           LinkMostPopular.NavigateUrl = "search.aspx?find=" & strfind & "&SDropName=" & strScat & "&sid=" & 2 & "&ob=" & 2
           LinkMostPopular.Text = "Most Popular"
           LinkMostPopular.ToolTip = "Sort by Most Popular Recipes DESC"

          If strSid <> 2 Then

              ArrowImage2.visible = False

           End if

       End if


        If strSid = "2" AND strOB = "1" Then

           LinkMostPopular.NavigateUrl = "search.aspx?find=" & strfind & "&SDropName=" & strScat & "&sid=" & 2 & "&ob=" & 2
           LinkMostPopular.Text = "Most Popular"
           LinkMostPopular.ToolTip = "Sort Category by Most Popular Recipes DESC"
           ArrowImage2.ImageUrl = "images/arrow_down3.gif"

           End If

           If strSid = "2" AND strOB = "2" Then

              ArrowImage2.ImageUrl = "images/arrow_up3.gif"

        End If


        If strSid = "1" Then
           LinkHighestRated.NavigateUrl = "search.aspx?find=" & strfind & "&SDropName=" & strScat & "&sid=" & 1 & "&ob=" & 1
           LinkHighestRated.Text = "Highest Rated"
           LinkHighestRated.ToolTip = "Sort Category by Highest Rated Recipes ASC"
        Else 
           LinkHighestRated.NavigateUrl = "search.aspx?find=" & strfind & "&SDropName=" & strScat & "&sid=" & 1 & "&ob=" & 2
           LinkHighestRated.Text = "Highest Rated"
           LinkHighestRated.ToolTip = "Sort Category by Highest Rated Recipes DESC"

           If strSid <> 1 Then

           ArrowImage.visible = False

           End if

      End if

          
        If strSid = "1" AND strOB = "1" Then

          LinkHighestRated.NavigateUrl = "search.aspx?find=" & strfind & "&SDropName=" & strScat & "&sid=" & 1 & "&ob=" & 2
          LinkHighestRated.Text = "Highest Rated"
          LinkHighestRated.ToolTip = "Sort Category by Highest Rated Recipes DESC"
          ArrowImage.ImageUrl = "images/arrow_down3.gif"

        End If

           If strSid = "1" AND strOB = "2" Then

              ArrowImage.ImageUrl = "images/arrow_up3.gif"

        End If

        
        If strSid = "3" Then
           LinkNewest.NavigateUrl = "search.aspx?find=" & strfind & "&SDropName=" & strScat & "&sid=" & 3 & "&ob=" & 1
           LinkNewest.Text = "Newest"
           LinkNewest.ToolTip = "Sort Category by Newest Recipes ASC"
        Else 
           LinkNewest.NavigateUrl = "search.aspx?find=" & strfind & "&SDropName=" & strScat & "&sid=" & 3 & "&ob=" & 2
           LinkNewest.Text = "Newest"
           LinkNewest.ToolTip = "Sort Category by Newest Recipes DESC"

           If strSid <> 3 Then

           ArrowImage3.visible = false

           End if

      End if

          
        If strSid = "3" AND strOB = "1" Then

              LinkNewest.NavigateUrl = "search.aspx?find=" & strfind & "&SDropName=" & strScat & "&sid=" & 3 & "&ob=" & 2
              LinkNewest.Text = "Newest"
              LinkNewest.ToolTip = "Sort Category by Newest Recipes DESC"
              ArrowImage3.ImageUrl = "images/arrow_down3.gif"

           End If

           If strSid = "3" AND strOB = "2" Then

              ArrowImage3.ImageUrl = "images/arrow_up3.gif"

        End If


      If strSid = "4" Then
           LinkName.NavigateUrl = "search.aspx?find=" & strfind & "&SDropName=" & strScat & "&sid=" & 4 & "&ob=" & 1
           LinkName.Text = "Name"
           LinkName.ToolTip = "Sort Category by Recipe Name ASC"
        Else 
           LinkName.NavigateUrl = "search.aspx?find=" & strfind & "&SDropName=" & strScat & "&sid=" & 4 & "&ob=" & 2
           LinkName.Text = "Name"
           LinkName.ToolTip = "Sort Category by Recipe Name DESC"

           If strSid <> 4 Then

           ArrowImage4.visible = False

           End if

      End if

          
        If strSid = "4" AND strOB = "1" Then

              LinkName.NavigateUrl = "search.aspx?find=" & strfind & "&SDropName=" & strScat & "&sid=" & 4 & "&ob=" & 2
              LinkName.Text = "Name"
              LinkName.ToolTip = "Sort Category by Recipe Name DESC"
              ArrowImage4.ImageUrl = "images/arrow_down3.gif"

           End If

           If strSid = "4" AND strOB = "2" Then

              ArrowImage4.ImageUrl = "images/arrow_up3.gif"

        End If

 End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
'Display label order by ASC or Desc
  Sub Check_OrderByAscDesc()

     strOB = Request.QueryString("ob")

     If strOB = "1" Then

        lblOrderBy.text = "&nbsp;Order By Ascending"
        ArrowImage5.ImageUrl = "images/arrow_down3.gif"
        ArrowImage6.visible = false

     ElseIf strOB = "2" Then

        lblOrderBy.text = "&nbsp;Order By Descending"
        ArrowImage6.ImageUrl = "images/arrow_up3.gif"
        ArrowImage5.visible = false

     End if

     If Request.QueryString("ob") = "" Then

         ArrowImage5.visible = false
         ArrowImage6.visible = false

     End if

  End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
  'Pulls a Random number for selecting a random recipe
  Sub RandomRecipeNumber()

        'Connect to database
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
 'Pulls aand dsiplay random recipe records
 Sub RandomRecipe()

strSQL = "SELECT ID,CAT_ID,Category,Name,Author,Date,HITS,RATING,NO_RATES, (RATING/NO_RATES) AS Rates FROM Recipes"

         Dim objDataReader as OledbDataReader
            
        'Call Open database - connect to the database
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

        'Display recipe
        lblRating2.Text = "Rating:"
        lblRancategory.text = "Category:" 
        lblranhitsdis.text = "Hits:"
        lblranhits.text = objDataReader("Hits")
        strRanRating = FormatNumber(objDataReader("Rates"), 1,  -2, -2, -2)
        lblranrating.Text = "(" & strRanRating & ")"
        strRatingimg = FormatNumber(objDataReader("Rates"), 1,  -2, -2, -2)

        LinkRanName.NavigateUrl = "recipedetail.aspx?id=" & objDataReader("ID")
        LinkRanName.Text = objDataReader("Name")
        LinkRanName.ToolTip = "View" & " - " & objDataReader("Name") & " - " & "recipe"
        LinkRanCat.NavigateUrl = "pageview.aspx?tab=1&catid=" & objDataReader("CAT_ID")
        LinkRanCat.Text = objDataReader("Category")
        LinkRanCat.ToolTip = "Go to" & " - " & objDataReader("Category") & " - " & "&category"

        objDataReader.Close()
        objConnection.Close()

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
    Private strRatingimg as Integer
    Private iRandomRecipe as integer
    Private strOB as integer

'++++++++++++++++++++++++++++++++++++++++++++

</script>

<!--#include file="inc_databasepath.aspx"-->
<!--#include file="inc_header.aspx"-->

<table cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td width="16%" valign="top">
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
    <td width="68%" valign="top">
<!--#include file="inc_searchtab.aspx"-->
<div style="margin-left: 10px; margin-right: 12px; background-color: #FFF9EC;" margin-top: 2px;">
&nbsp;&nbsp;<asp:HyperLink tooltip="Back to recipe homepage" id="HyperLink1" cssClass="dtcat" runat="server" />&nbsp;<span class="bluearrow">»</span>&nbsp;<span class="content2"><asp:Label cssClass="content2" ID="lblrcdcount" runat="server" /> <asp:Label cssClass="content2" ID="lblcaption" runat="server" /> <asp:Label id="lblOrderBy" cssClass="content2" runat="server" /> <asp:Image id="ArrowImage5" runat="server" /><asp:Image id="ArrowImage6" runat="server" />
<asp:Label ID="lblnorecord" cssClass="content2" runat="server" />  </span>
</div>
<div style="padding: 2px; text-align: center; margin-bottom: 14px; margin-top: 12px; margin-left: 26px; margin-right: 26px;">
<asp:Label cssClass="corange" runat="server" id="lblletter" />
<asp:Label id="lblalphaletter" font-name="verdana" font-size="9" runat="server" />
</div>
<div style="margin-left: 5px; margin-right: 5px;">
<!--Begin sort category links-->
<div class="divsort">
<img src="images/tlcorner.gif" alt="" class="cor2" align="top">
<div style="text-align: left; padding-left: 6px; height: 18px;">
<asp:Label class="sortcat" runat="server" id="lblsortcat" />
<asp:HyperLink id="LinkMostPopular" cssClass="dt" runat="server" /> <asp:Image id="ArrowImage2" runat="server" /> |
<asp:HyperLink id="LinkHighestRated" cssClass="dt" runat="server" /> <asp:Image id="ArrowImage" runat="server" /> |
<asp:HyperLink id="LinkNewest" cssClass="dt" runat="server" /> <asp:Image id="ArrowImage3" runat="server"  /> |
<asp:HyperLink id="LinkName" cssClass="dt" runat="server" /> <asp:Image id="ArrowImage4" runat="server" /> | <asp:HyperLink id="LinkReset" cssClass="dt" runat="server" />
</div>
</div>
<!--End sort category links-->
<!--Begin display recipes center content-->
<asp:DataList width="98%" id="RecipeCat" RepeatColumns="1" runat="server">
      <ItemTemplate>
    <div class="divwrap">
       <div class="divhd">
<span class="bluearrow">»</span>
<a class="dtcat" title="View <%# DataBinder.Eval(Container.DataItem, "Name") %> recipe" href='<%# DataBinder.Eval(Container.DataItem, "ID", "recipedetail.aspx?id={0}") %>'><%# DataBinder.Eval(Container.DataItem, "Name") %></a> 
</div> 
<div class="divbd">
Category:&nbsp;<a class="dt" title="Go to <%# DataBinder.Eval(Container.DataItem, "Category") %> category" href='<%# DataBinder.Eval(Container.DataItem, "CAT_ID", "pageview.aspx?tab=1&catid={0}") %>'><%# DataBinder.Eval(Container.DataItem, "Category") %></a>
<br />
Submitted by:&nbsp;<%# DataBinder.Eval(Container.DataItem, "Author") %>
<br />
Rating:<img src="images/<%# FormatNumber((DataBinder.Eval(Container.DataItem, "Rates")), 1,  -2, -2, -2) %>.gif" style="vertical-align: middle;" alt="Rating <%# FormatNumber((DataBinder.Eval(Container.DataItem, "Rates")), 1, -2, -2, -2) %>">(<%# FormatNumber((DataBinder.Eval(Container.DataItem, "Rates")), 1, -2, -2, -2) %>) by <%# DataBinder.Eval(Container.DataItem, "NO_RATES") %> users
<br />
Added: <%# FormatDateTime(DataBinder.Eval(Container.DataItem, "Date"),vbShortDate) %>
<br />
Hits: <%# DataBinder.Eval(Container.DataItem, "HITS") %>
    </div>
</div>
<div style="margin: 15px;"></div>
      </ItemTemplate>
  </asp:DataList>
<!--Begin Record count,page count and paging link-->
<div style="margin-left: 1px;">
<form runat="server" style="margin-top: 0px; margin-bottom: 0px;">
<table border="0" cellpadding="0" cellspacing="0" align="center" width="98%">
  <tr>
  <td align="left" bgcolor="#E8F1FF" width="2%" height="23" background="images/lcircle.gif">
&nbsp;
</td>
    <td align="left" bgcolor="#E8F1FF" height="23" width="48%">
<asp:label ID="lblRecpage"
  Runat="server"
  cssClass="content2" />
<asp:label ID="intCIndex"
  Visible="False"
  Runat="server" 
cssClass="content2" />
<asp:label ID="intPageSize"
  Visible="False"
  Runat="server"
  cssClass="content2" />
<asp:label ID="intRcdCount"
  Visible="False"
  Runat="server" 
  cssClass="content2" />
</td>
    <td align="right" bgcolor="#E8F1FF" height="23" width="44%">
<asp:Panel ID="Panel1" runat="server">
<span class="content2">
<a title="Back to Previous Page" href="category.aspx#this"
  ID="PreviousPage"
  onserverclick="ShowPrevious"
  runat="server"
  class="dt">&laquo; Previous</a>&nbsp;|&nbsp;
<a title="Jump to First Page" href="category.aspx#this"
  ID="FirstPage"
  onserverclick="ShowFirst"
  runat="server" 
  class="dt">&laquo; First</a>&nbsp;|&nbsp;
<a title="Jump to Last Page" href="category.aspx#this"
  ID="LastPage"
  onserverclick="ShowLast"
  runat="server"
  class="dt">Last &raquo;</a>&nbsp;|&nbsp;
<a title="Jump to Next Page" href="category.aspx#this"
  ID="NextPage"
  onserverclick="ShowNext"
  runat="server"
  class="dt">Next &raquo;</a>&nbsp;&nbsp;&nbsp;
</span>
</asp:Panel>
</td>
    <td align="right" valign=top height="23" width="2%">
<div style="background: #E8F1FF url(images/rcircle.gif) no-repeat right; display: block; height: 23px;"></div>
</td>
  </tr>
</table>
</form>
</div>
<!--End Record count,page count and paging link-->
</div>
</td>
    <td width="16%" valign="top">
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
<asp:Label cssClass="content8" runat="server" id="lblRating2" /> <img src="images/<%=strRatingimg%>.gif" style="vertical-align: middle;" alt="rating: <%=strRatingimg%>"> <asp:Label cssClass="content8" runat="server" id="lblranrating" />
</div>
</div>
<!--End Random Recipe-->
<br />
<!--15 Most Popular Recipe-->
<div class="roundcont">
<div class="roundtop">
<img src="images/hleft.gif" height="5" width="5" alt="" class="corner">
<div class="dcnt"><span class="content3">Most Popular </span><a title="title="Top recipes RSS/XML feed" href="toprecipexml.aspx" target="_blank"><img src="images/xmlbtn.gif" height="9" width="19" border="0" title="Top recipes RSS/XML feed" alt="Top recipes RSS/XML feed"></a></div> 
</div>
</div>
<div class="contentdisplay">
<div class="contentdis5">
<asp:DataList cssClass="hlink" id="RecipeTop" RepeatColumns="1" runat="server">
   <ItemTemplate>
<div class="dcnt2">
<a class="dt" title="Category (<%# DataBinder.Eval(Container.DataItem, "Category") %>) - Hits (<%# DataBinder.Eval(Container.DataItem, "Hits") %>)" href='<%# DataBinder.Eval(Container.DataItem, "ID", "recipedetail.aspx?id={0}") %>'>
<%# DataBinder.Eval(Container.DataItem, "Name") %></a>
</div>
    </ItemTemplate>
  </asp:DataList>
</div>
</div>	
<!--End 15 Most Popular Recipe-->
<br />
<!--Begin 15 Newest Recipes-->
  <div class="roundcont">
<div class="roundtop">
<img src="images/hleft.gif" height="5" width="5" alt="" class="corner">
<div class="dcnt"><span class="content3">Newest Recipes</span><a title="title="Newest recipes RSS/XML feed" href="newrecipexml.aspx" target="_blank"><img src="images/xmlbtn.gif" height="9" width="19" border="0" title="Newest recipes RSS/XML feed" alt="Newest recipes RSS/XML feed"></a></div> 
</div>
</div>
<div class="contentdisplay">
<div class="contentdis5">
<asp:DataList cssClass="hlink" id="RecipeNew" RepeatColumns="1" runat="server">
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
</table>
<br />
<!--#include file="inc_footer.aspx"-->
