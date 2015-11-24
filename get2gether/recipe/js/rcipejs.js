//By: Gagan sahoo : pearlsoft.com

//Handle popup window
function Start(page) {
OpenWin = this.open(page,'CtrlWindow', 'width=650,height=500,toolbar=no,menubar=no,location=no,scrollbars=yes,resizable=yes')
}
function openWindow(url) {
  popupWin = window.open(url,'new_page','width=400,height=400')
}

//Handle textarea comment and URL description character count 
function textCounter(field, countfield, maxlimit) 
  {
     if (field.value.length > maxlimit) 
         field.value = field.value.substring(0, maxlimit);
     else 
         countfield.value = maxlimit - field.value.length;
}

//Handle ckeck keyword for search
function doSubmit(obj) 
 {

   if (obj.find.value != '' && obj.find.value != 'Find it here...') 
       {
          var keywords = obj.find.value.split(' ');
          var validKeyword = 0;

             for(key in keywords) 
                  {
	        keyword = keywords[key];
	        keyword = keyword.replace(/^\\s+|\\s+$/g,'');

	            if (keyword.length >= 3) 
                              {
		        validKeyword += 1;
		     }
	     }
			
                        if (validKeyword <= 0) 
                             {
		       alert('Your keywords used must contain at least 3 characters!\n\nPlease try again...');
		       return false;
		    } 
                              else 
                              {
		       return true;
		    }

      } 
      else 
      {
         alert('You must enter at least ONE keyword!\n\nPlease try again...');
          return false;
      }
}

// begin tab switch search script
var currentTab,currentLink;
var tabHighlightClass='tabon'; 

function initTabs()
{
	var navElement='tbnav';
	var navElementTabbedId='tbnavmain';	
	var backToMenu=/#top/;

	var n,as,id,i,cid,linklength,lastlink,re;
	if(document.getElementById && document.createTextNode)
	{
		cid=window.location.toString().match(/#(\w.+)/);
		if (cid && cid[1])
		{
			cid=cid[1];
		}
		var n=document.getElementById(navElement);
		n.id=navElementTabbedId;
		n=document.getElementById(navElementTabbedId)
		var as=n.getElementsByTagName('a');
		for (i=0;i<as.length;i++)
		{
			as[i].onclick=function(){showTab(this);return false}
			//as[i].onkeypress=function(){showTab(this);return false}
			id=as[i].href.match(/#(\w.+)/)[1];
			if(!cid && i==0)
			{
				currentTab=id;
				currentLink=as[i];
			} else if(id==cid)
			{
				currentTab=id;
				currentLink=as[i];
			}
			if(document.getElementById(id))
			{
				linklength=document.getElementById(id).getElementsByTagName('a').length;
				if(linklength>0)
				{
					lastlink=document.getElementById(id).getElementsByTagName('a')[linklength-1]
					if(backToMenu.test(lastlink.href))
					{
						lastlink.parentNode.removeChild(lastlink);
					}
				}
				document.getElementById(id).style.display='none';
			}
			if(cid){window.location.hash='top';}
		}		


		if(document.getElementById(currentTab))
		{
			document.getElementById(currentTab).style.display='block';
		}
		re=new RegExp('\\b'+tabHighlightClass+'\\b');
		if(!re.test(currentLink.className))
		{
			currentLink.className=currentLink.className+' '+tabHighlightClass
		}
	}
}  

function showTab(o)
{
	var id;
	if(currentTab)
	{
		if(document.getElementById(currentTab))
		{
			document.getElementById(currentTab).style.display='none';
		}
		currentLink.className=currentLink.className.replace(tabHighlightClass,'')
	}
	var id=o.href.match(/#(\w.+)/)[1];
	currentTab=id;
	currentLink=o;
	if(document.getElementById(id))
	{
		document.getElementById(id).style.display='block';
	}
	var re=new RegExp('\\b'+tabHighlightClass+'\\b');
	if(!re.test(o.className))
	{
		o.className=o.className+' '+tabHighlightClass
	}
}
// call onload tab search display default (Basic Search)
window.onload=initTabs;  	