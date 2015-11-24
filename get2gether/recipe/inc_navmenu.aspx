<!--Begin Navigation Menu-->
<div id="b2">
  <ul>
    <div class="roundtop">
<img src="images/hleft.gif" height="5" width="5" alt="" class="corner">
<div class="dcnt"><span class="content3">Main Menu</span></div> 
</div>
    <%if request.querystring("tab") <> "" or request.querystring("id") <> ""then %>
    <li><a title="Recipe homepage" href="default.aspx">Home</a></li>
    <li><a title="View 50 Newest Recipes" href="pageview.aspx?tab=3&sid=3">Newest Recipes</a></li>
    <li><a title="View 50 Most Popular Recipes" href="pageview.aspx?tab=3&sid=2">Most Popular Recipes</a></li>
    <li><a title="View 50 Highest Rated Recipes" href="pageview.aspx?tab=3&sid=1">Highest Rated Recipes</a></li>
     <li><a title="Submit a recipe" href="submitrecipe.aspx">Submit a Recipe</a></li>
    <%else%>
    <li><a title="View 50 Newest Recipes" href="pageview.aspx?tab=3&sid=3">Newest Recipes</a></li>
    <li><a title="View 50 Most Popular Recipes" href="pageview.aspx?tab=3&sid=2">Most Popular Recipes</a></li>
    <li><a title="View 50 Highest Rated Recipes" href="pageview.aspx?tab=3&sid=1">Highest Rated Recipes</a></li>
    <li><a title="Submit a recipe" href="submitrecipe.aspx">Submit a Recipe</a></li>
   <%end if%>
 </ul>
</div>
<!--End Navigation Menu-->
<div style="clear: both;"></div>
