<%@ Control Language="C#" AutoEventWireup="true" CodeFile="editprofile.ascx.cs" Inherits="SiteMember_editprofile" %>
<link href="../StyleSheet.css" rel="stylesheet" type="text/css" />

<div>
<div class="vmenu">
		<ul>
			
			<li>
                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/vm1.png" 
                    PostBackUrl="~/SiteMember/basicinfo.aspx" Width="150px" />
            </li>
			<li>
                <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/images/vm2.png" 
                    PostBackUrl="~/SiteMember/profilepic.aspx" Width="150px" />
            </li>
                <li>
                    <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/images/vm3.png" 
                        PostBackUrl="~/SiteMember/education.aspx" Width="150px" />
            </li>
                <li>
                    <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/images/vm4.png" 
                        PostBackUrl="~/SiteMember/friendfamily.aspx" Width="150px" />
            </li>
                <li>
                    <asp:ImageButton ID="ImageButton6" runat="server" ImageUrl="~/images/vm5.png" 
                        PostBackUrl="~/SiteMember/activity.aspx" Width="150px" />
            </li>
                        <li>
                            <asp:ImageButton ID="ImageButton7" runat="server" ImageUrl="~/images/vm6.png" 
                                PostBackUrl="~/SiteMember/art.aspx" Width="150px" />
            </li>
                <li>
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/vm7.png" 
                        PostBackUrl="~/SiteMember/contact.aspx" Width="150px" />
            </li>	   
        </ul>
  </div>
  </div>
 