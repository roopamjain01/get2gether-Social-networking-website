<!--Begin Search Tabs Panel-->
<div style="padding-left: 10px; padding-right: 12px; text-align: left;">
<ul id="tbnav">
   <li><a title="Basic recipe search" href="#basic"><div style="padding-top: 3px;">Basic Search</div></a></li>
   <li><a title="Advanced recipe search" href="#advanced"><div style="padding-top: 3px;">Adv Search</div></a></li>
</ul>
<div id="basic" class="tbcont">
<!--Begin basic search form-->
<form method="get" onsubmit="javascript:return doSubmit(this);" action="search.aspx" style="margin-top: 4px; margin-bottom: 0;">
<img src="images/search.gif" border="0" alt="Search recipe" align="absmiddle">
<input type="text" name="find" id="find" class="textbox" size="20" value="Find it here..." onfocus="if(this.value=='Find it here...')value='';" onblur="if(this.value=='')value='Find it here...';"> 
<select class="cselect" name="SDropName" size="1" id="SDropName">
	<option value="0">All Categories</option>
	<option value="27">Afghan</option>
	<option value="35">African</option>
	<option value="36">American Indian</option>
	<option value="41">Arabian</option>
	<option value="34">Australian</option>
	<option value="1">Barbque</option>
	<option value="2">Beef</option>
	<option value="3">Breads</option>
	<option value="42">British</option>
	<option value="4">Cakes Desserts</option>
	<option value="5">Candy</option>
	<option value="6">Cassoroles</option>
	<option value="31">Chinese</option>
	<option value="48">Cookies</option>
	<option value="47">Desserts</option>
	<option value="7">Dips</option>
	<option value="8">Drinks</option>
	<option value="45">Dutch</option>
	<option value="32">Filipino</option>
	<option value="9">Fish</option>
	<option value="43">French</option>
	<option value="11">German</option>
	<option value="40">Greek</option>
	<option value="33">Indian</option>
	<option value="37">Irish Recipes</option>
	<option value="39">Italian</option>
	<option value="38">Jambalaya</option>
	<option value="30">Japanese</option>
	<option value="28">Jewish</option>
	<option value="29">Korean</option>
	<option value="12">Lamb</option>
	<option value="13">Mexican</option>
	<option value="26">Misc Unsorted</option>
	<option value="14">Oriental</option>
	<option value="46">Pakistan</option>
	<option value="15">PanCakes</option>
	<option value="16">Pies</option>
	<option value="17">Pork</option>
	<option value="10">Poultry</option>
	<option value="18">Puddings</option>
	<option value="19">Russian</option>
	<option value="20">Salads</option>
	<option value="49">Sandwich</option>
	<option value="21">Sauces</option>
	<option value="22">SeaFoods</option>
	<option value="23">Soups</option>
	<option value="24">Syrups</option>
	<option value="44">Thai</option>
	<option value="25">Vegetables</option>
</select> 
 <input type="submit" class="submit" ID="submit" name="submit" value="Search">
 </form>
<!--End basic search form-->
</div>
<div id="advanced" class="tbcont">
<!--Begin advanced search form-->
<form method="get" action="search.aspx" style="margin-top: 4px; margin-bottom: 0;">
<img src="images/search.gif" border="0" alt="Search recipe" align="absmiddle">
 <input type="text" onfocus="clearDefault(this); this.style.backgroundColor='#FFFCF9'" onBlur="this.style.backgroundColor='#ffffff'" ID="find" Name="find" class="textbox" size="20" value="Search"> 
<select class="cselect" name="SDropName" size="1" id="SDropName">
	<option value="27">Afghan</option>
	<option value="35">African</option>
	<option value="36">American Indian</option>
	<option value="41">Arabian</option>
	<option value="34">Australian</option>
	<option value="1">Barbque</option>
	<option value="2">Beef</option>
	<option value="3">Breads</option>
	<option value="42">British</option>
	<option value="4">Cakes Desserts</option>
	<option value="5">Candy</option>
	<option value="6">Cassoroles</option>
	<option value="31">Chinese</option>
	<option value="48">Cookies</option>
	<option value="47">Desserts</option>
	<option value="7">Dips</option>
	<option value="8">Drinks</option>
	<option value="45">Dutch</option>
	<option value="32">Filipino</option>
	<option value="9">Fish</option>
	<option value="43">French</option>
	<option value="11">German</option>
	<option value="40">Greek</option>
	<option value="33">Indian</option>
	<option value="37">Irish Recipes</option>
	<option value="39">Italian</option>
	<option value="38">Jambalaya</option>
	<option value="30">Japanese</option>
	<option value="28">Jewish</option>
	<option value="29">Korean</option>
	<option value="12">Lamb</option>
	<option value="13">Mexican</option>
	<option value="26">Misc Unsorted</option>
	<option value="14">Oriental</option>
	<option value="46">Pakistan</option>
	<option value="15">PanCakes</option>
	<option value="16">Pies</option>
	<option value="17">Pork</option>
	<option value="10">Poultry</option>
	<option value="18">Puddings</option>
	<option value="19">Russian</option>
	<option value="20">Salads</option>
	<option value="49">Sandwich</option>
	<option value="21">Sauces</option>
	<option value="22">SeaFoods</option>
	<option value="23">Soups</option>
	<option value="24">Syrups</option>
	<option value="44">Thai</option>
	<option value="25">Vegetables</option>
</select> 
<input type="checkbox" name="chk1" id="chk1" value="1"><span class="catcntsml">Main Ingredients</span>
<input type="checkbox" name="chk2" id="chk2" value="2"><span class="catcntsml">Instructions</span>
 <input type="submit" class="submit" ID="submit" name="submit" value="Search">
 </form>
<!--End advanced search form-->
</div>
</div>
<!--End Search Tabs Panel-->
