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

<%@ Page Language="VB" Debug="true" EnableSessionState="false" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.Oledb" %>

<script runat="server">

'++++++++++++++++++++++++++++++++++++++++++++
'Handle page load event
  Sub Page_Load(Sender As Object, E As EventArgs)  

      'Check if not postback
      If Not Page.IsPostBack Then   

           intPageSize.text = "10"
           intCIndex.text = "0"

           CheckCatIDVal()
           CategoryMenu_NewestAndPopular_Recipes()
           Custom_SortLinks()  
           Display_LetterLinks()
           Check_OrderByAscDesc()  
           GetRandom_RecipeID()
           RandomRecipe()
           LinkAndLabel_TextDisplay()         
           BindList()
        
      End If 
     
  End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
'Page level error handling - If the page encounter an error, redirect to the custom error page
   Protected Overrides Sub OnError(ByVal e As System.EventArgs)

     Server.Transfer("error.aspx")

   End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
'This sub will check the catid querystring value if it is in the range with the number of categories.
'This prevent from a fatal error. You can change > 49 depending on the number of categories you created. In this case we have 18 categories.

   Sub CheckCatIDVal()

     If Request.QueryString("tab") = 1 then
 
         If Request.QueryString("catid") <= 0 then

              Server.Transfer("error.aspx")

        ElseIf Request.QueryString("catid") > 49 then 

             Server.Transfer("error.aspx")

        End if

       If IsNumeric(Request.QueryString("catid")) = false then

           Server.Transfer("error.aspx")

       End If

   End If

  End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
 Sub LinkAndLabel_TextDisplay()

         'Label for side panel header text
         lblsortcat.text = "Sort Option:"  

         HyperLink1.NavigateUrl = "default.aspx"
         HyperLink1.Text = "Recipe Home"
         HyperLink1.ToolTip = "Back to recipe homepage"

 End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'+++++++++++++++++++++++++++++++++++++++++++++++
'Display the alphabetical letter listing depending what tab has been view
  Sub Display_LetterLinks()

     iTabnumber = request.querystring("tab")
     Dim i as Integer
     Dim cid as integer = request.querystring("catid")
     Dim isid as integer = request.querystring("sid")
    
 Select Case iTabnumber

   Case "1"

      lblalphaletter.Text = string.empty
      for i = 65 to 90	
  lblalphaletter.text = lblalphaletter.text & "<a href=""pageview.aspx?tab=" & iTabnumber & "&catid=" & cid & "&lb=" & chr(i) & chr(34) & " class=""letter"" title="& chr(i) & ">" & chr(i) &  "</a>&nbsp;&nbsp;"
      next

   Case "2"

      lblalphaletter.Text = string.empty
      for i = 65 to 90	
         lblalphaletter.text = lblalphaletter.text & "<a href=""pageview.aspx?tab=2&l=" & chr(i) & chr(34) & " class=""letter"" title="& chr(i) & ">" & chr(i) &  "</a>&nbsp;&nbsp;"
      next

   Case "3"
      
      lblalphaletter.Text = string.empty
      for i = 65 to 90	
  lblalphaletter.text = lblalphaletter.text & "<a href=""pageview.aspx?tab=" & iTabnumber & "&sid=" & isid & "&lc=" & chr(i) & chr(34) & " class=""letter"" title="& chr(i) & ">" & chr(i) &  "</a>&nbsp;&nbsp;"
      next

  End Select

 End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
'Display Panel Category menu, Newest and Most Popular recipes
 Sub CategoryMenu_NewestAndPopular_Recipes()
         
        Dim strSQLCategoryMenu, strSQLNewestRecipes, strSQLPopular as string

    Try

strSQLCategoryMenu = "SELECT *, (SELECT COUNT (*)  FROM Recipes WHERE Recipes.CAT_ID = RECIPE_CAT.CAT_ID AND LINK_APPROVED = 1) AS REC_COUNT FROM RECIPE_CAT ORDER BY CAT_TYPE ASC"
         
         objCommand = New OledbCommand(strSQLCategoryMenu, objConnection)

         Dim AdapterCategoryMenu as New OledbDataAdapter(objCommand)
         Dim dtsCategoryMenu as New DataSet()
         AdapterCategoryMenu.Fill(dtsCategoryMenu, "CAT_ID")

         CategoryName.DataSource = dtsCategoryMenu.Tables("CAT_ID").DefaultView
         CategoryName.DataBind()

  strSQLNewestRecipes = "SELECT Top 15 ID,Name,HITS,Category FROM Recipes Where LINK_APPROVED = 1 Order By Date DESC"

         objCommand = New OledbCommand(strSQLNewestRecipes, objConnection)

         Dim AdapterNewest as New OledbDataAdapter(objCommand)
         Dim dtsNewest as New DataSet()
         AdapterNewest.Fill(dtsNewest, "ID")

         RecipeNew.DataSource = dtsNewest.Tables("ID").DefaultView
         RecipeNew.DataBind()

    If Request.QueryString("tab") = "1"  Then

       CategoryID = Request.QueryString("catid")

strSQLPopular = "SELECT Top 15 ID,Name,HITS,Category FROM Recipes WHERE CAT_ID = " & Replace(CategoryID, "'", "''") & " AND LINK_APPROVED = 1 Order By HITS DESC"

    Else

 strSQLPopular = "SELECT Top 15 ID,Name,HITS,Category FROM Recipes Where LINK_APPROVED = 1 Order By HITS DESC"

    End if
      
         objCommand = New OledbCommand(strSQLPopular, objConnection)

         Dim AdapterPopular as New OledbDataAdapter(objCommand)
         Dim dtsPopular as New DataSet()
         AdapterPopular.Fill(dtsPopular, "ID")

         RecipeTop.DataSource = dtsPopular.Tables("ID").DefaultView
         RecipeTop.DataBind()

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
'Bind our Data - this is where we bind the data through the conditional structure SQL statements
  Sub BindList() 

     Try

         'Call custom sort and order parameter
         Sort_Order_Parameter()
  
         'Call SQL statements
         BindList_SQLStatements()

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
      
         'Call sub routines
         RecipeCat.DataBind()
         DisplayPageCount() 
         TopBreadCrumb_Text()
         HideUnhide_Pager_Panel()

    Catch ex As Exception

          HttpContext.Current.Response.Write("<b>AN ERROR OCCURRED:</b><br>" & _
          ex.StackTrace & "<br><br>" & ex.Message & "<br><br><p>Please <a href='mailto:webmaster@mydomain.com'>e-mail us</a> providing as much detail as possible including the error message, what page you were viewing and what you were trying to achieve.<p>")

            HttpContext.Current.Response.Flush()
            HttpContext.Current.Response.End()
      
   Finally

         'Close database connection
         objConnection.Close()

   End Try

 End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
'SQL Bind List statements
 Sub BindList_SQLStatements()

 iTabnumber = request.querystring("tab")
 
   Select Case iTabnumber

     Case "1"

        If Request.QueryString("lb") <> "" Then

           Dim Recletter as string
           Recletter = Request.QueryString("lb")

'SQL statement display recipe A-Z depending the letter
strSQL = "SELECT *, (RATING/ NO_RATES) AS RATES FROM Recipes WHERE LINK_APPROVED = 1 AND CAT_ID = " & Replace(CategoryID, "'", "''") & " AND Name LIKE '" & Replace(Recletter, "'", "''") & "%' ORDER BY " & Replace(recipesqlorderby, "'", "''") & "" 
         
        Else
         
'SQL statement display category
strSQL = "SELECT *, (RATING/NO_RATES) AS Rates FROM Recipes WHERE LINK_APPROVED = 1 AND CAT_ID = " & Replace(CategoryID, "'", "''") & " AND LINK_APPROVED = 1 ORDER BY " & Replace(recipesqlorderby, "'", "''") & "" 

        End if      

    Case "2"

         Dim Recletter as string
         Recletter = Request.QueryString("l")

'SQL statement display recipe A-Z depending the letter
strSQL = "SELECT *, (RATING/ NO_RATES) AS RATES FROM Recipes WHERE LINK_APPROVED = 1 AND Name LIKE '" & Replace(Recletter, "'", "''") & "%' ORDER BY " & Replace(recipesqlorderby, "'", "''") & "" 
         
    Case "3"

       If Request.QueryString("lc") <> "" Then

         Dim Recletter as string
         Recletter = Request.QueryString("lc")

'SQL statement display recipe A-Z depending the letter
strSQL = "SELECT *, (RATING/ NO_RATES) AS RATES FROM Recipes WHERE LINK_APPROVED = 1 AND Name LIKE '" & Replace(Recletter, "'", "''") & "%' ORDER BY " & Replace(recipesqlorderby, "'", "''") & "" 
         
         Else
         
'SQL statement display sort 50 most popular,rating,name asc and newest
strSQL = "SELECT TOP 50 *, (RATING/NO_RATES) AS Rates FROM Recipes Where LINK_APPROVED = 1 ORDER BY " & Replace(recipesqlorderby, "'", "''") & "" 

        End if
         
  End Select

 End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
'Display the top bread crumb links name and the record count
 Sub TopBreadCrumb_Text()

         'Display page name on the top page depending the tab #
         If request.querystring("tab") = "1" Then

             lblrcdcount.Text = "(" & intRcdCount.text & ")"
             lblcaption.text = strCaption 

         ElseIf request.querystring("tab") = "2" Then

              lblrcdcount.Text =  intRcdCount.text

             lblbreadcrumdtop.text = "Recipes starting with letter&nbsp;<b>" & request.querystring("l") & "</b>"
          
             lblcaption.text = strCaption 

         ElseIf request.querystring("tab") = "3" Then

             lblbreadcrumdtop.text = "Sorting Recipe"
             lblcaption.text = strCaption & "&nbsp; recipes"  

         End if

         If request.querystring("tab") = "3" AND request.querystring("lc") <> "" Then

             lblbreadcrumdtop.text = "Sorting Recipe"
             lblcaption.text = strCaption & "&nbsp;<b>50</b> recipes starting with letter&nbsp;<b>" & request.querystring("lc") & "</b>"

         End if

 End Sub
'++++++++++++++++++++++++++++++++++++++++++++



'++++++++++++++++++++++++++++++++++++++++++++
'Display the pager link if the records are more than 10, otherwise hide the pager link
 Sub HideUnhide_Pager_Panel()

        'Check if the page has more than 10 records, then display the pager links, else hide the pager link
        Dim strCatcounts as integer
        strCatcounts = intRcdCount.text

        If strCatcounts <= 10 Then

           Panel1.visible = False

        ElseIf strCatcounts > 10 Then

           Panel1.visible = True

       End If

 End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
'Get Custom Sort and order parameter
  Sub Sort_Order_Parameter()

         Dim action, orderby, sqlorderby as string

         CategoryID = Request.QueryString("catid")
      
         action = "Date"
         orderby = "DESC"

        If Request.QueryString("sid") = "" Then
	    action = "Date"
            strCaption = "" 

        ElseIf Request.QueryString("sid") = "1" Then
            action = "NO_RATES"
            strCaption = "Sorted by: <b>50</b> Highest Rated"

        ElseIf Request.QueryString("sid") = "2" Then
            action = "HITS"
            strCaption = "Sorted by: <b>50</b> Most Popular"

        ElseIf Request.QueryString("sid") = "3" Then
            action = "Date"
            strCaption = "Sorted by: <b>50</b> Newest"

        ElseIf Request.QueryString("sid") = "4" Then
	    action = "Name"
            strCaption = "Sorted by: Name"         

   End If
   
    'If order ASC or DESC equals blank then grab the default value 
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

     End If

      'Handles the custom sorting SQL statement
      sqlorderby = " " & action & " " & orderby
      recipesqlorderby = "Date"
      if (sqlorderby <> "") then recipesqlorderby = sqlorderby

  End Sub
'++++++++++++++++++++++++++++++++++++++++++++



'++++++++++++++++++++++++++++++++++++++++++++
'Conditionally Show an Item in a Bound List - Show popular text or new image depending the condition
  Sub RecipeCat_ItemDataBound(sender As Object, e As DataListItemEventArgs)

     'First, make sure we're not dealing with a Header or Footer row
     If e.Item.ItemType <> ListItemType.Header AND e.Item.ItemType <> ListItemType.Footer then

       'Show PopularLabel for items where Hits > 2500
       Dim PopularLabel As Label = CType(e.Item.FindControl("lblpopular"), Label)
       Dim strPopular as Integer = DataBinder.Eval(e.Item.DataItem, "Hits")
       Dim thumbsupimg As Image = CType(e.Item.FindControl("thumbsup"), Image)

          If strPopular > 2500 Then

             PopularLabel.visible = True
             PopularLabel.text = "Popular"
             thumbsupimg.ImageUrl = "images/thup.gif"

          Else

             thumbsupimg.visible = False

          End if

       'Show a newimage for items where items not older than 1 week
       Dim strDate as Date = DataBinder.Eval(e.Item.DataItem, "Date")
       Dim Newimage As Image = CType(e.Item.FindControl("newimg"), Image)

       Dim DateSince as string
       
          DateSince = DateDiff("d", DateTime.Now, strDate) + 7
             
            If DateSince >= 0 Then

                 Newimage.ImageUrl = "images/new.gif"   

            Else

                Newimage.visible = False
               
            End If

    End if


    iTabnumber = request.querystring("tab")

    Select Case iTabnumber

       Case "1"

         lblletter.Text = DataBinder.Eval(e.Item.DataItem, "Category") & "&nbsp;A-Z:"
         lblCategoryName.text = DataBinder.Eval(e.Item.DataItem, "Category") & "&nbsp;Category"
         lblCategoryNameFooter.text = "You are here in&nbsp;" & DataBinder.Eval(e.Item.DataItem, "Category") & "&nbsp;Category"

       Case "2"

         lblletter.Text = "All A-Z:"
         lblCategoryNameFooter.text = "You are here in All Recipes Alphabetical Listing"

       Case "3"

         lblletter.Text = "Sorted A-Z:"
         lblCategoryNameFooter.text = "You are here in Quick Sort"

     End select

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

      Dim itemp as Integer

      itemp = CInt(intRcdCount.text) Mod CInt(intPageSize.text)

        If itemp > 0 Then
          intCIndex.text = Cstr(CInt(intRcdCount.text) - itemp)
        Else
          intCIndex.text = Cstr(CInt(intRcdCount.text) - CInt(intPageSize.text))
       End If

       BindList()

 End Sub
'++++++++++++++++++++++++++++++++++++++++++++



'++++++++++++++++++++++++++++++++++++++++++++
'Display sort option links - tons of conditional statement in this sub
  Sub Custom_SortLinks()


    iTabnumber = request.querystring("tab")

    Select case iTabnumber

        Case "1"

                Tab1_CustomSortLinks()

        Case "2"

                Tab2_CustomSortLinks()

        Case "3"

               Tab3_CustomSortLinks()

    End Select
     
 End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
 Sub Tab1_CustomSortLinks()

      Dim strRecletter As String
      Dim strLb As String
      Dim strRflag as integer
      strRflag = Request.QueryString("r")
      strRecletter = Request.QueryString("l")
      strSid = Request.QueryString("sid")
      strOB = Request.QueryString("ob")
      CategoryID = Request.QueryString("catid")
      strLb = Request.QueryString("lb")

            LinkReset.NavigateUrl = "pageview.aspx?tab=1&catid=" & CategoryID
            LinkReset.Text = "Reset"
            LinkReset.ToolTip = "Back to Category default view"

            'Here we check what field are we going to sort, this depends the strSid value
            If strSid = "2" Then
              LinkMostPopular.NavigateUrl = "pageview.aspx?tab=1&catid=" & CategoryID & "&lb=" & strLb & "&sid=" & 2 & "&ob=" & 1 & "&r=" & 1
              LinkMostPopular.Text = "Most Popular"
              LinkMostPopular.ToolTip = "Sort Category by Most Popular Recipes ASC"
            Else
              LinkMostPopular.NavigateUrl = "pageview.aspx?tab=1&catid=" & CategoryID & "&lb=" & strLb & "&sid=" & 2 & "&ob=" & 2 & "&r=" & 2
              LinkMostPopular.Text = "Most Popular"
              LinkMostPopular.ToolTip = "Sort Category by Most Popular Recipes DESC"

                'Check the strSid value and hide arrow up and arrow down image
                If strSid <> 2 Then

                    ArrowImage2.visible = False

                End If

            End If

            'Check if both values are true, and change the url depending on the values
            If strSid = "2" And strOB = "1" Then

             LinkMostPopular.NavigateUrl = "pageview.aspx?tab=1&catid=" & CategoryID & "&lb=" & strLb & "&sid=" & 2 & "&ob=" & 2 & "&r=" & 2
             LinkMostPopular.Text = "Most Popular"
             LinkMostPopular.ToolTip = "Sort Category by Most Popular Recipes DESC"
             ArrowImage2.ImageUrl = "images/arrow_up3.gif"

            End If

            If strSid = "2" And strOB = "2" Then

                ArrowImage2.ImageUrl = "images/arrow_down3.gif"

            End If

             'We check if we are dealing with alphabet letter sorting
            If strLb <> "" AND strRflag = "1" Then

             LinkMostPopular.NavigateUrl = "pageview.aspx?tab=1&catid=" & CategoryID & "&lb=" & strLb & "&sid=" & 2 & "&ob=" & 2 & "&r=" & 2
                LinkMostPopular.Text = "Most Popular"
                LinkMostPopular.ToolTip = "Sort by Most Popular Recipes DESC"
                ArrowImage2.ImageUrl = "images/arrow_up3.gif"

            Elseif strLb <> "" AND strRflag = "2" Then

             LinkMostPopular.NavigateUrl = "pageview.aspx?tab=1&catid=" & CategoryID & "&lb=" & strLb & "&sid=" & 2 & "&ob=" & 1 & "&r=" & 1
                LinkMostPopular.Text = "Most Popular"
                LinkMostPopular.ToolTip = "Sort by Most Popular Recipes ASC"
                ArrowImage2.ImageUrl = "images/arrow_down3.gif"

            ElseIf  strLb <> "" Then

                LinkMostPopular.NavigateUrl = "pageview.aspx?tab=1&catid=" & CategoryID & "&lb=" & strLb & "&sid=" & 2 & "&ob=" & 2 & "&r=" & 2
                LinkMostPopular.Text = "Most Popular"
                LinkMostPopular.ToolTip = "Sort Category by Most Popular Recipes DESC"
                'ArrowImage2.ImageUrl = "images/arrow_down3.gif"

            End If


            If strSid = "1" Then
              LinkHighestRated.NavigateUrl = "pageview.aspx?tab=1&catid=" & CategoryID & "&lb=" & strLb & "&sid=" & 1 & "&ob=" & 1 & "&r=" & 1
              LinkHighestRated.Text = "Highest Rated"
              LinkHighestRated.ToolTip = "Sort Category by Highest Rated Recipes ASC"
            Else
              LinkHighestRated.NavigateUrl = "pageview.aspx?tab=1&catid=" & CategoryID & "&lb=" & strLb & "&sid=" & 1 & "&ob=" & 2 & "&r=" & 2
              LinkHighestRated.Text = "Highest Rated"
              LinkHighestRated.ToolTip = "Sort Category by Highest Rated Recipes DESC"

                If strSid <> 1 Then

                    ArrowImage.visible = False

                End If

            End If


            If strSid = "1" And strOB = "1" Then

              LinkHighestRated.NavigateUrl = "pageview.aspx?tab=1&catid=" & CategoryID & "&lb=" & strLb &"&sid=" & 1 & "&ob=" & 2 & "&r=" & 2
              LinkHighestRated.Text = "Highest Rated"
              LinkHighestRated.ToolTip = "Sort Category by Highest Rated Recipes DESC"
                ArrowImage.ImageUrl = "images/arrow_up3.gif"

            End If

            If strSid = "1" And strOB = "2" Then

                ArrowImage.ImageUrl = "images/arrow_down3.gif"

            End If


            If strSid = "3" Then
                LinkNewest.NavigateUrl = "pageview.aspx?tab=1&catid=" & CategoryID & "&lb=" & strLb & "&sid=" & 3 & "&ob=" & 1 & "&r=" & 1
                LinkNewest.Text = "Newest"
                LinkNewest.ToolTip = "Sort Category by Newest Recipes ASC"
            Else
                LinkNewest.NavigateUrl = "pageview.aspx?tab=1&catid=" & CategoryID & "&lb=" & strLb & "&sid=" & 3 & "&ob=" & 2 & "&r=" & 2
                LinkNewest.Text = "Newest"
                LinkNewest.ToolTip = "Sort Category by Newest Recipes DESC"

                If strSid <> 3 Then

                    ArrowImage3.visible = False

                End If

            End If


            If strSid = "3" And strOB = "1" Then

                LinkNewest.NavigateUrl = "pageview.aspx?tab=1&catid=" & CategoryID & "&lb=" & strLb & "&sid=" & 3 & "&ob=" & 2 & "&r=" & 2
                LinkNewest.Text = "Newest"
                LinkNewest.ToolTip = "Sort Category by Newest Recipes DESC"
                ArrowImage3.ImageUrl = "images/arrow_up3.gif"

            End If

            If strSid = "3" And strOB = "2" Then

                ArrowImage3.ImageUrl = "images/arrow_down3.gif"

            End If


            If strSid = "4" Then
                LinkName.NavigateUrl = "pageview.aspx?tab=1&catid=" & CategoryID & "&lb=" & strLb & "&sid=" & 4 & "&ob=" & 1 & "&r=" & 1
                LinkName.Text = "Name"
                LinkName.ToolTip = "Sort Category by Recipe Name ASC"
            Else
                LinkName.NavigateUrl = "pageview.aspx?tab=1&catid=" & CategoryID & "&lb=" & strLb & "&sid=" & 4 & "&ob=" & 2 & "&r=" & 2
                LinkName.Text = "Name"
                LinkName.ToolTip = "Sort Category by Recipe Name DESC"

                If strSid <> 4 Then

                    ArrowImage4.visible = False

                End If

            End If


            If strSid = "4" And strOB = "1" Then

                LinkName.NavigateUrl = "pageview.aspx?tab=1&catid=" & CategoryID & "&sid=" & 4 & "&ob=" & 2 & "&r=" & 2
                LinkName.Text = "Name"
                LinkName.ToolTip = "Sort Category by Recipe Name DESC"
                ArrowImage4.ImageUrl = "images/arrow_up3.gif"

            End If

            If strSid = "4" And strOB = "2" Then

                ArrowImage4.ImageUrl = "images/arrow_down3.gif"

            End If

 End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
 Sub Tab2_CustomSortLinks()

      Dim strRecletter As String
      Dim strRflag as integer
      strRecletter = Request.QueryString("l")
      strSid = Request.QueryString("sid")
      strOB = Request.QueryString("ob")

            LinkReset.visible = False

            If strSid = "2" Then
                LinkMostPopular.NavigateUrl = "pageview.aspx?tab=2&l=" & strRecletter & "&sid=" & 2 & "&ob=" & 1
                LinkMostPopular.Text = "Most Popular"
                LinkMostPopular.ToolTip = "Sort by Most Popular Recipes ASC"
            Else
                LinkMostPopular.NavigateUrl = "pageview.aspx?tab=2&l=" & strRecletter & "&sid=" & 2 & "&ob=" & 2
                LinkMostPopular.Text = "Most Popular"
                LinkMostPopular.ToolTip = "Sort by Most Popular Recipes DESC"

                If strSid <> 2 Then

                    ArrowImage2.visible = False

                End If

            End If


            If strSid = "2" And strOB = "1" Then

                LinkMostPopular.NavigateUrl = "pageview.aspx?tab=2&l=" & strRecletter & "&sid=" & 2 & "&ob=" & 2
                LinkMostPopular.Text = "Most Popular"
                LinkMostPopular.ToolTip = "Sort by Most Popular Recipes DESC"
                ArrowImage2.ImageUrl = "images/arrow_up3.gif"

            End If

            If strSid = "2" And strOB = "2" Then

                ArrowImage2.ImageUrl = "images/arrow_down3.gif"

            End If


            If strSid = "1" Then
                LinkHighestRated.NavigateUrl = "pageview.aspx?tab=2&l=" & strRecletter & "&sid=" & 1 & "&ob=" & 1
                LinkHighestRated.Text = "Highest Rated"
                LinkHighestRated.ToolTip = "Sort by Highest Rated Recipes ASC"
            Else
                LinkHighestRated.NavigateUrl = "pageview.aspx?tab=2&l=" & strRecletter & "&sid=" & 1 & "&ob=" & 2
                LinkHighestRated.Text = "Highest Rated"
                LinkHighestRated.ToolTip = "Sort by Highest Rated Recipes DESC"

                If strSid <> 1 Then

                    ArrowImage.visible = False

                End If

            End If


            If strSid = "1" And strOB = "1" Then

                LinkHighestRated.NavigateUrl = "pageview.aspx?tab=2&l=" & strRecletter & "&sid=" & 1 & "&ob=" & 2
                LinkHighestRated.Text = "Highest Rated"
                LinkHighestRated.ToolTip = "Sort by Highest Rated Recipes DESC"
                ArrowImage.ImageUrl = "images/arrow_up3.gif"

            End If

            If strSid = "1" And strOB = "2" Then

                ArrowImage.ImageUrl = "images/arrow_down3.gif"

            End If


            If strSid = "3" Then
                LinkNewest.NavigateUrl = "pageview.aspx?tab=2&l=" & strRecletter & "&sid=" & 3 & "&ob=" & 1
                LinkNewest.Text = "Newest"
                LinkNewest.ToolTip = "Sort by Newest Recipes ASC"
            Else
                LinkNewest.NavigateUrl = "pageview.aspx?tab=2&l=" & strRecletter & "&sid=" & 3 & "&ob=" & 2
                LinkNewest.Text = "Newest"
                LinkNewest.ToolTip = "Sort by Newest Recipes DESC"

                If strSid <> 3 Then

                    ArrowImage3.visible = False

                End If

            End If


            If strSid = "3" And strOB = "1" Then

                LinkNewest.NavigateUrl = "pageview.aspx?tab=2&l=" & strRecletter & "&sid=" & 3 & "&ob=" & 2
                LinkNewest.Text = "Newest"
                LinkNewest.ToolTip = "Sort by Newest Recipes DESC"
                ArrowImage3.ImageUrl = "images/arrow_up3.gif"

            End If

            If strSid = "3" And strOB = "2" Then

                ArrowImage3.ImageUrl = "images/arrow_down3.gif"

            End If


            If strSid = "4" Then
                LinkName.NavigateUrl = "pageview.aspx?tab=2&l=" & strRecletter & "&sid=" & 4 & "&ob=" & 1
                LinkName.Text = "Name"
                LinkName.ToolTip = "Sort by Recipe Name ASC"
            Else
                LinkName.NavigateUrl = "pageview.aspx?tab=2&l=" & strRecletter & "&sid=" & 4 & "&ob=" & 2
                LinkName.Text = "Name"
                LinkName.ToolTip = "Sort by Recipe Name DESC"

                If strSid <> 4 Then

                    ArrowImage4.visible = False

                End If

            End If


            If strSid = "4" And strOB = "1" Then

                LinkName.NavigateUrl = "pageview.aspx?tab=2&l=" & strRecletter & "&sid=" & 4 & "&ob=" & 2
                LinkName.Text = "Name"
                LinkName.ToolTip = "Sort by Recipe Name DESC"
                ArrowImage4.ImageUrl = "images/arrow_down3.gif"

            End If

            If strSid = "4" And strOB = "2" Then

                ArrowImage4.ImageUrl = "images/arrow_up3.gif"

            End If

 End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
 Sub Tab3_CustomSortLinks()

      strSid = Request.QueryString("sid")
      strOB = Request.QueryString("ob")

            ArrowImage.visible = False
            ArrowImage2.visible = False
            LinkReset.visible = False

            If strOB = "1" Then
                LinkName.NavigateUrl = "pageview.aspx?tab=3&sid=" & strSid & "&ob=" & 1
                LinkName.Text = "Ascending"
                LinkName.ToolTip = "Sort by Ascending"
                ArrowImage3.ImageUrl = "images/arrow_up3.gif"
            Else
                LinkName.NavigateUrl = "pageview.aspx?tab=3&sid=" & strSid & "&ob=" & 1
                LinkName.Text = "Ascending"
                LinkName.ToolTip = "Sort by Ascending"
                ArrowImage3.ImageUrl = "images/arrow_up3.gif"

            End If

            If strOB = "2" Then

                LinkNewest.NavigateUrl = "pageview.aspx?tab=3&sid=" & strSid & "&ob=" & 2
                LinkNewest.Text = "Descending"
                LinkNewest.ToolTip = "Sort by Descending"
                ArrowImage4.ImageUrl = "images/arrow_down3.gif"
            Else

                LinkNewest.NavigateUrl = "pageview.aspx?tab=3&sid=" & strSid & "&ob=" & 2
                LinkNewest.Text = "Descending"
                LinkNewest.ToolTip = "Sort by Descending"
                ArrowImage4.ImageUrl = "images/arrow_down3.gif"

            End If

 End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
'Display label order by ASC or Desc
  Sub Check_OrderByAscDesc()

     strOB = Request.QueryString("ob")

     Select case strOB

        Case "1"

           lblOrderBy.text = "&nbsp;Order By Ascending"
           ArrowImage5.ImageUrl = "images/arrow_down3.gif"
           ArrowImage6.visible = false

        Case "2"

           lblOrderBy.text = "&nbsp;Order By Descending"
           ArrowImage6.ImageUrl = "images/arrow_up3.gif"
           ArrowImage5.visible = false

     End Select

     If Request.QueryString("ob") = "" Then

         ArrowImage5.visible = false
         ArrowImage6.visible = false

     End if

      Dim strLb as string
      strLb = Request.QueryString("lb")

     If strLb <> "" Then

        lblSortedLetter.text = "starting with letter&nbsp;<b>" & strLb & "</b>&nbsp;"

     End if

  End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
'Pulls a Random number for selecting a random recipe
  Sub GetRandom_RecipeID()

         If Request.QueryString("tab") = "1" Then

        strSQL = "SELECT CAT_ID FROM Recipes WHERE CAT_ID = " & Request.QueryString("catid") 

         Else

         strSQL = "SELECT ID FROM Recipes"

         End If

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

        'Close database connection 
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
'Display the random recipe
 Sub RandomRecipe()

   Try

     If Request.QueryString("tab") = "1" Then

strSQL = "SELECT ID,CAT_ID,Category,Name,Author,Date,HITS,RATING,NO_RATES, (RATING/NO_RATES) AS Rates FROM Recipes WHERE CAT_ID = " & Request.QueryString("catid") 

      Else
         
         strSQL = "SELECT ID,CAT_ID,Category,Name,Author,Date,HITS,RATING,NO_RATES, (RATING/NO_RATES) AS Rates FROM Recipes"

    End If

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

        lblRating2.Text = "Rating:"
        lblRancategory.text = "Category:" 
        lblranhitsdis.text = "Hits:"
        lblranhits.text = objDataReader("Hits")
        strRanRating = FormatNumber(objDataReader("Rates"), 1,  -2, -2, -2)
        lblranrating.Text = strRanRating
        strRatingimg = FormatNumber(objDataReader("Rates"), 1,  -2, -2, -2)

        'Display the random recipe star rating image
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
    Private CategoryID as integer
    Private sortname as string
    Private recipesqlorderby as string
    Private strCaption as string 
    Private strSearchSQL as string
    Private strSid as integer
    Private strOB as integer
    Private iTabnumber as integer

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
&nbsp;&nbsp;<asp:HyperLink tooltip="Back to recipe homepage" id="HyperLink1" cssClass="dtcat" runat="server" />&nbsp;<span class="bluearrow">»</span>&nbsp;<asp:Label cssClass="content10" runat="server" id="lblCategoryName" /> <span class="content2"><asp:Label cssClass="content2" ID="lblrcdcount" runat="server" /></span> <asp:Label cssClass="content10" runat="server" id="lblbreadcrumdtop" /> <asp:Label cssClass="content2" ID="lblcaption" runat="server" /> <asp:Label id="lblSortedLetter" cssClass="content2" runat="server" /> <asp:Label id="lblOrderBy" cssClass="content2" runat="server" /> <asp:Image id="ArrowImage5" runat="server" /><asp:Image id="ArrowImage6" runat="server" />
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
<asp:DataList width="98%" id="RecipeCat" OnItemDataBound="RecipeCat_ItemDataBound" RepeatColumns="1" runat="server">
<ItemTemplate>
<div class="divwrap">


<div class="divhd">
<span class="bluearrow">»</span>
<a class="dtcat" title="View <%# DataBinder.Eval(Container.DataItem, "Name") %> recipe" href='<%# DataBinder.Eval(Container.DataItem, "ID", "recipedetail.aspx?id={0}") %>'><%# DataBinder.Eval(Container.DataItem, "Name") %></a> 
<asp:Label ID="lblpopular" cssClass="hot" runat="server" /> 
<asp:Image ID="newimg" runat="server" />
<asp:Image id="thumbsup" runat="server" AlternateText = "Thumsb up" />
</div> 

<div class="divbd"> 
Category:&nbsp;<a class="dt" title="Go to <%# DataBinder.Eval(Container.DataItem, "Category") %> category" href='<%# DataBinder.Eval(Container.DataItem, "CAT_ID", "pageview.aspx?tab=1&catid={0}") %>'><%# DataBinder.Eval(Container.DataItem, "Category") %></a>
<br/>
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
<asp:label ID="lblRecpage"  Runat="server"  cssClass="content2" />
<asp:label ID="intCIndex"  Visible="False"  Runat="server" cssClass="content2" />
<asp:label ID="intPageSize"  Visible="False"  Runat="server"  cssClass="content2" />
<asp:label ID="intRcdCount"  Visible="False"  Runat="server"   cssClass="content2" />
</td>

<td align="right" bgcolor="#E8F1FF" height="23" width="44%">
<asp:Panel ID="Panel1" runat="server">
<span class="content2">
<a title="Back to Previous Page" href="category.aspx#this"  ID="PreviousPage"  onserverclick="ShowPrevious"  runat="server"  class="dt">&laquo; Previous</a>&nbsp;|&nbsp;
<a title="Jump to First Page" href="category.aspx#this"  ID="FirstPage"  onserverclick="ShowFirst"  runat="server"   class="dt">&laquo; First</a>&nbsp;|&nbsp;
<a title="Jump to Last Page" href="category.aspx#this"  ID="LastPage"  onserverclick="ShowLast"  runat="server"  class="dt">Last &raquo;</a>&nbsp;|&nbsp;
<a title="Jump to Next Page" href="category.aspx#this"  ID="NextPage"  onserverclick="ShowNext"  runat="server"  class="dt">Next &raquo;</a>&nbsp;&nbsp;&nbsp;
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
<br />

<div style="text-align: center;">
<asp:Label id="lblCategoryNameFooter" cssClass="content2" runat="server" /></div>
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
<asp:Label cssClass="content8" runat="server" id="lblRancategory" /> 
<asp:HyperLink id="LinkRanCat" cssClass="dt" runat="server" />
<br />
<asp:Label cssClass="content8" runat="server" id="lblranhitsdis" /> 
<asp:Label cssClass="cmaron2" runat="server" id="lblranhits" />
<br />
<asp:Label cssClass="content8" runat="server" id="lblRating2" /> 
<asp:Image id="ranrateimage" runat="server" /> (<asp:Label cssClass="cmaron2" runat="server" id="lblranrating" />)
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
