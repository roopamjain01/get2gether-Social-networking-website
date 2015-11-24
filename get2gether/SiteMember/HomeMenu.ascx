<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HomeMenu.ascx.cs" Inherits="SiteMember_HomeMenu" %>
<link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
<div>
     <div class="vmenu" style="width: 210px">
        <ul>
        
        <li>
            <asp:ImageButton ID="ImageButton1" runat="server" 
                ImageUrl="~/images/vmnewpost.png" Width="150px" 
                PostBackUrl="~/SiteMember/home.aspx" />
            </li>
            <li>
                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/vmmsg.png" 
                    Width="150px" PostBackUrl="~/SiteMember/viewmessage.aspx" />
            </li>
            <li>
                <asp:ImageButton ID="ImageButton3" runat="server" 
                    ImageUrl="~/images/vmfrireq.png" Width="152px" 
                    PostBackUrl="~/SiteMember/showRequest.aspx" />
            </li>
            <li>
                <strong>---------------------------------------</strong></li>
            <li>
                <asp:ImageButton ID="ImageButton4" runat="server" 
                    ImageUrl="~/images/vmphoto.png" Width="150px" 
                    PostBackUrl="~/SiteMember/album.aspx" />
            </li>
            <li>
                <asp:ImageButton ID="ImageButton8" runat="server" 
                    ImageUrl="~/images/Picture2.png" Width="150px" 
                    PostBackUrl="~/SiteMember/friend.aspx" />
            </li>
            <li>
                <strong>---------------------------------------</strong></li>
            <li>
                <asp:ImageButton ID="ImageButton5" runat="server" 
                    ImageUrl="~/images/vmsetting.png" Width="150px" 
                    PostBackUrl="~/SiteMember/setting.aspx" />
            </li>
            <li>
                <strong>---------------------------------------</strong></li>
            <li>
                <asp:ImageButton ID="ImageButton6" runat="server" 
                    ImageUrl="~/images/vmhelp.png" Width="150px" 
                    PostBackUrl="~/SiteMember/help.aspx" />
            </li>
            <li>
                <asp:ImageButton ID="ImageButton7" runat="server" 
                    ImageUrl="~/images/vmaboutus.png" Width="150px" 
                    PostBackUrl="~/SiteMember/aboutus.aspx" />
            </li>
        </ul>
      </div>
 </div>

