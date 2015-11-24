<%--
'++++++++++++++++++++++++++++++++++++++++++++
--%>

<%@ Page Language="VB" Debug="true" EnableSessionState="false" EnableViewState="false" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Web.Mail" %>

<script runat="server">

'++++++++++++++++++++++++++++++++++++++++++++
  'Handle the page load event
  Sub Page_Load(Sender As Object, E As EventArgs)

    If Not Page.IsPostBack then

         CheckCatIDVal()
         TotalRecipeCount()
         NewestRecipes()
         MostPopular()
         Display_CategoryList()
         Adding_RecipeForm()
         RandomRecipeNumber()
         RandomRecipe()
         Security_RanNumber_Comment()
       
    End if

 End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
'Handle security code number
 Sub Security_RanNumber_Comment()

'           lblletter.Text = "Choose a cetegory below where your recipe belong" 
'
 '          Dim intLowerBound, intUpperBound As Integer
'
 '          'Pull in values from the text boxes
  '         intLowerBound = 0
   '        intUpperBound = 593658
'
           'Get the random number and display it in lblRanNumberCode
 '          lblRanNumberCode.Text = GetRandomNumberInRange(intLowerBound, intUpperBound)
  '         hd.value = GetRandomNumberInRange(intLowerBound, intUpperBound)


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

     If Request.QueryString("catid") <> "" then
 
         If Request.QueryString("catid") <= 0 then

              Server.Transfer("error.aspx")

        ElseIf Request.QueryString("catid") > 49 then 

             Server.Transfer("error.aspx")

        End if

       If IsNumeric(Request.QueryString("catid")) = false then

            Server.Transfer("error.aspx")

       End If

    End if

  End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
 'Display category name listing
  Sub Display_CategoryList()

        panel1.visible = true
        panel2.visible = false

        'Creates the SQL statement
strSQL = "SELECT *, (SELECT COUNT (*)  FROM Recipes WHERE Recipes.CAT_ID = RECIPE_CAT.CAT_ID AND LINK_APPROVED = 1) AS REC_COUNT FROM RECIPE_CAT ORDER BY CAT_TYPE ASC"
    
         'Call sql command
         SQL_Command()

         Dim RecipeAdapter as New OledbDataAdapter(objCommand)
         Dim dts as New DataSet()
         RecipeAdapter.Fill(dts, "CAT_ID")

         lbltotalCat.Text = CStr(dts.Tables(0).Rows.Count) & "&nbsp;categories"

         RecipeCat.DataSource = dts.Tables("CAT_ID").DefaultView
         RecipeCat.DataBind()

        objConnection.Close() 

  End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
  'Display insert/add recipe form
  Sub Adding_RecipeForm()

     if Request.QueryString("catid") <> "" then

        panel1.visible = false
        panel2.visible = true

        strSQL = "SELECT * FROM RECIPE_CAT WHERE CAT_ID =" & Request.QueryString("catid")

        Dim objDataReader as OledbDataReader
            
        'Call sql command
        SQL_Command()

        objConnection.Open()
        objDataReader  = objCommand.ExecuteReader()
    
        'Read data
        objDataReader.Read()

        strAddCatID = objDataReader("CAT_ID")
        strRAddCatName = objDataReader("CAT_TYPE")

         'Close database connection for the objDataReader
         objDataReader.Close()
         objConnection.Close() 

    end if

  End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
 'Handles insert recipe SQL routine on form submit
 Sub Insert_Recipe(sender As Object, e As System.EventArgs)

    If Me.IsValid then

        Dim strSQL as string

   Try
    
        objConnection = New OledbConnection(strConnection)
        objConnection.Open()    

strSQL = "Insert Into Recipes (Name,Author,CAT_ID,Category,Ingredients,Instructions)" & _
" VALUES('" & replace(request("Name"),"'","''") & "', '" & replace(request("Author"),"'","''") & _
"', '" & replace(request("CAT_ID"),"'","''") & "', '" & replace(request("Category"),"'","''") & _
"', '" & replace(request("Ingredients"),"'","''") & "', '" & replace(request("Instructions"),"'","''") & "')"

        objCommand = New OledbCommand(strSQL,objConnection)
        objCommand.ExecuteNonQuery()
    
        objCommand = nothing
        objConnection.Close()
        objConnection = nothing

     Catch ex As Exception

            HttpContext.Current.Response.Write("<b>AN ERROR OCCURRED:</b><br>" & _
                               "<br>" &  ex.Message & "<p>Please providing as much detail as possible including the error message, what page you were viewing and what you were trying to achieve.<p>")

            HttpContext.Current.Response.Flush()
            HttpContext.Current.Response.End()

     End Try

         'Send  a notification email to the Webmaster
        ' EmailNotify()

        'Redirect to the thank you page after submission
        Server.Transfer("submitconfirm.aspx")

   end if

  End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
 Sub EmailNotify()

    Try

        'Email notification - Change the email (extremedexter_z2001@yahoo.com) 
        'to your domainemail or any email address you have.
        Dim mailnotify As SmtpMail
        Dim NotifyEmail As New MailMessage()
        NotifyEmail.To = "extremedexter_z2001@yahoo.com"
        NotifyEmail.From = "recipesubmissionnotify@myasp-net.com"
        NotifyEmail.Subject = "Myasp-net.net Recipe Submmision Notification"
        NotifyEmail.Body = "Hello Webmaster, Someone has submitted a recipe"
        NotifyEmail.BodyFormat = MailFormat.Text
        mailnotify.SmtpServer = "localhost" 
        mailnotify.Send(NotifyEmail)

  Catch ex As Exception

            HttpContext.Current.Response.Write("<b>AN ERROR OCCURRED:</b><br>" & _
                               "<br>" & ex.Message & "<br><br>Your web server is not configured to use email component for sending an email. Contact you system adminstrator.<br><br><p>Please <a href='mailto:webmaster@mydomain.com'>e-mail us</a> providing as much detail as possible including the error message, what page you were viewing and what you were trying to achieve.<p>")

            HttpContext.Current.Response.Flush()
            HttpContext.Current.Response.End()

     End Try


 End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
 'Sub Display 15 newest recipes
 Sub NewestRecipes()
         
strSQL = "SELECT Top 15 ID,Name,HITS,Category FROM Recipes Where LINK_APPROVED = 1 Order By Date DESC"

         'Call sql command
         SQL_Command()

         Dim RecipeAdapter as New OledbDataAdapter(objCommand)
         Dim dts as New DataSet()
         RecipeAdapter.Fill(dts, "ID")

         RecipeNew.DataSource = dts.Tables("ID").DefaultView
         RecipeNew.DataBind()
        
         'close database connection
         objConnection.Close() 

 End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
  'Count the total number of recipes
  Sub TotalRecipeCount()

        Dim CmdCount As New OleDbCommand("Select Count(ID) From Recipes", New OleDbConnection(strConnection))
        CmdCount.Connection.Open()
        lbltotalRecipe.Text = "There are &nbsp;" & CmdCount.ExecuteScalar() & "&nbsp;recipes in&nbsp;"
        CmdCount.Connection.Close()

  End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
 'Display 15 most popular recipes
 Sub MostPopular()
         
         strSQL = "SELECT Top 15 ID,Name,HITS,Category FROM Recipes Where LINK_APPROVED = 1 Order By HITS DESC"

         'Call sql command
         SQL_Command()

         Dim RecipeAdapter as New OledbDataAdapter(objCommand)
         Dim dts as New DataSet()
         RecipeAdapter.Fill(dts, "ID")

         RecipeTop.DataSource = dts.Tables("ID").DefaultView
         RecipeTop.DataBind()

         'close database connection
         objConnection.Close() 

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
  'Pulls and display random recipe records
  Sub RandomRecipe()

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
        LinkRanCat.NavigateUrl = "category.aspx?catid=" & objDataReader("CAT_ID")
        LinkRanCat.Text = objDataReader("Category")
        LinkRanCat.ToolTip = "Go to" & " - " & objDataReader("Category") & " - " & "&category"

        objDataReader.Close()
        objConnection.Close()

  End Sub
'++++++++++++++++++++++++++++++++++++++++++++




'++++++++++++++++++++++++++++++++++++++++++++
'Handle basic automatic form submission security code
'Note, this is a very basic protection and no guarantee it will stop the spam boot or automatic submission
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
    Private strRAddCatName as string
    Private strAddCatID as integer

'++++++++++++++++++++++++++++++++++++++++++++
    
</script>

<!--#include file="inc_databasepath.aspx"--> 
<!--#include file="inc_header.aspx"-->

<table border="0" cellpadding="0" cellspacing="0" width="100%">
 <tr>
    <td width="15%" valign="top" align="left">
<!--#include file="inc_navmenu.aspx"-->
<!--Begin 15 Newest Recipes-->
<div class="roundcont">
<div class="roundtop">
<img src="images/hleft.gif" height="5" width="5" alt="" class="corner">
<div class="dcnt"><span class="content3">Newest Recipes</span></div> 
</div>
</div>
<div class="contentdisplay">
<div class="contentdis5">
<asp:DataList cssClass="hlink" id="RecipeNew" RepeatColumns="1" runat="server">
   <ItemTemplate>
<div class="dcnt2">
<a class="dt" title="Category (<%# DataBinder.Eval(Container.DataItem, "Category") %>) - <%# DataBinder.Eval(Container.DataItem, "Name") %> recipe" href='<%# DataBinder.Eval(Container.DataItem, "ID", "recipedetail.aspx?id={0}") %>'>
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
<div style="margin-left: 10px; margin-right: 12px; background-color: #FFF9EC;" margin-top: 2px;">
&nbsp;&nbsp;<a class="dtcat" title="Back to recipe homepage" href="default.aspx">Home</a>&nbsp;<span class="bluearrow">»</span>&nbsp;<span class="content10">Submitting a Recipe</span> - <asp:Label cssClass="content2" runat="server" id="lbltotalRecipe" /><asp:Label cssClass="content2" runat="server" id="lbltotalCat" />
</div>
<!--Begin Category Name Listing-->
<asp:Panel id="panel1" runat="server">
<br />
<div style="padding: 2px; text-align: center; margin-left: 26px; margin-right: 26px;">
<span class="corange">How to submit a recipe?</span> <asp:Label cssClass="corange" runat="server" id="lblletter" />
</div>
</div>
<br />
<asp:DataList id="RecipeCat" RepeatColumns="3" RepeatDirection="Horizontal" runat="server">
      <ItemTemplate>
       <div style="margin-left: 60px; margin-top: 3px; margin-bottom: 3px; margin-right: 10px;">
<span class="bluearrow">&raquo;</span> <a class="catlink" title="Click this link to add a recipe in <%# DataBinder.Eval(Container.DataItem, "CAT_TYPE") %> category" href='<%# DataBinder.Eval(Container.DataItem, "CAT_ID", "submitrecipe.aspx?catid={0}") %>'><%# DataBinder.Eval(Container.DataItem, "CAT_TYPE") %></a> 
       </div>
      </ItemTemplate>
  </asp:DataList>
</asp:Panel>
<!--End Category Name Listing-->
<!--Begin Insert Recipe Form-->
<asp:Panel id="panel2" runat="server">
<table border="0" cellpadding="2" align="center" cellspacing="2" width="67%">
  <tr>
<td width="68%">
<div style="padding: 2px; text-align: left; margin-left: 1px; margin-right: 26px;">
<a class="dtcat" title="Back to Submit Recipe Listing" href="submitrecipe.aspx">Back to Submit Category Listing</a>
<br />
<span class="cred2">All fields are required</span> 
</div>
<fieldset><legend>Submitting a <%=strRAddCatName%> Recipe</legend>
 <div style="padding-top: 1px;">
<form runat="server" style="margin-top: 0px; margin-bottom: 0px;">
<table border="0" cellpadding="2" align="center" cellspacing="2" width="60%">
  <tr>
    <td width="26%"><span class="content2">Category:</span></td>
    <td width="74%">
<span class="cmaron"><%=strRAddCatName%></span>
<input type="hidden" id="Category" name="Category" class="textbox" size="15" value="<%=strRAddCatName%>">&nbsp;
<input type="hidden" id="CAT_ID" name="CAT_ID" class="textbox" size="2" value="<%=strAddCatID%>">
</td>
  </tr>
  <tr>
    <td width="26%"><span class="content2">Recipe Name:</span><span class="cred2">*</span></td>
    <td width="74%">
<input type="text" id="Name" name="Name" class="textbox" size="30" runat="server" onFocus="this.style.backgroundColor='#FFFCF9'" onBlur="this.style.backgroundColor='#ffffff'" />
      <asp:RequiredFieldValidator runat="server"
        id="Recipename" ControlToValidate="Name"
        cssClass="cred2" errormessage="* Recipe Name:<br />"
        display="Dynamic" />
</td>
  </tr>
  <tr>
    <td width="1%"><span class="content2">Author:</span><span class="cred2">*</span></td>
    <td width="102%">
<input type="text" id="Author" name="Author" size="25" class="textbox" runat="server" onFocus="this.style.backgroundColor='#FFFCF9'" onBlur="this.style.backgroundColor='#ffffff'" />
      <asp:RequiredFieldValidator runat="server"
        id="authorname" ControlToValidate="Author"
        cssClass="cred2" errormessage="* Author:<br />"
        display="Dynamic" />
</td>
  </tr>
  <tr>
    <td width="26%" valign="top"><span class="content2">Ingredients:</span><span class="cred2">*</span></td>
    <td width="74%">
<textarea runat="server" id="Ingredients" class="textbox" textmode="multiline" cols="70" rows="14" onFocus="this.style.backgroundColor='#FFFCF9'" onBlur="this.style.backgroundColor='#ffffff'" />
      <asp:RequiredFieldValidator runat="server"
        id="RecIngred" ControlToValidate="Ingredients"
        cssClass="cred2" errormessage="* Ingredients:<br />"
        display="Dynamic" />
</td>
  </tr>
  <tr>
    <td width="26%" valign="top"><span class="content2">Instructions:</span><span class="cred2">*</span></td>
    <td width="74%">
<textarea runat="server" id="Instructions" class="textbox" textmode="multiline" cols="70" rows="14" onFocus="this.style.backgroundColor='#FFFCF9'" onBlur="this.style.backgroundColor='#ffffff'" />
      <asp:RequiredFieldValidator runat="server"
        id="RecInstruc" ControlToValidate="Instructions"
        cssClass="cred2" errormessage="* Instructions:<br />"
        display="Dynamic" />
</td>
  </tr>
  <tr>
    <td width="26%"></td>
    <td width="74%">
<input type="text" class="textbox" ID="hd" name="hd" runat="server" style="visibility:hidden;">
<br />





<asp:Button runat="server" Text="Submit" id="Gosubmit" class="submit" onclick="Insert_Recipe"/>
</td>
  </tr>
</table>
</form>
 </div>
</fieldset>
</td>
  </tr>
</table>
</asp:Panel>
<!--End Insert Recipe Form-->
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
<img src="images/bluearrow.gif" alt="">
<asp:HyperLink id="LinkRanName" cssClass="dtcat" runat="server" />
<br />
<asp:Label cssClass="content8" runat="server" id="lblRancategory" /> <asp:HyperLink id="LinkRanCat" cssClass="dt2" runat="server" />
<br />
<asp:Label cssClass="content8" runat="server" id="lblranhitsdis" /> <asp:Label cssClass="content8" runat="server" id="lblranhits" />
<br />
<asp:Label cssClass="content8" runat="server" id="lblRating2" /> <img src="images/<%=strRatingimg%>.gif" style="vertical-align: middle;" alt="rating: <%=strRatingimg%>"> <asp:Label cssClass="content8" runat="server" id="lblranrating" />
</div>
</div>	
<!--End Random Recipe-->
<br />
<!--Begin 15 Most Popular-->
    <div class="roundcont">
<div class="roundtop">
<img src="images/hleft.gif" height="5" width="5" alt="" class="corner">
<div class="dcnt"><span class="content3">Most Popular</span></div> 
</div>
</div>
<div class="contentdisplay">
<div class="contentdis5">
<asp:DataList cssClass="hlink" id="RecipeTop" RepeatColumns="1" runat="server">
   <ItemTemplate>
<div class="dcnt2">
<a class="dt" title="Category (<%# DataBinder.Eval(Container.DataItem, "Category") %>) - <%# DataBinder.Eval(Container.DataItem, "Name") %> recipe" href='<%# DataBinder.Eval(Container.DataItem, "ID", "recipedetail.aspx?id={0}") %>'>
<%# DataBinder.Eval(Container.DataItem, "Name") %></a>
</div>
      </ItemTemplate>
  </asp:DataList>
</div>
</div>
<!--End 15 Most Popular-->

</td>
  </tr>
</table>
<div style="margin-top: 80px;"></div>
<!--#include file="inc_footer.aspx"-->
