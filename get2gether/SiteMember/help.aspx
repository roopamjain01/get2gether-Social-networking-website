<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember/design.master" AutoEventWireup="true" CodeFile="help.aspx.cs" Inherits="SiteMember_help" %>

<%@ Register src="HomeMenu.ascx" tagname="HomeMenu" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

 p.MsoNormal
	{margin-top:0cm;
	margin-right:0cm;
	margin-bottom:10.0pt;
	margin-left:0cm;
	text-align:justify;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	}
p.MsoListParagraphCxSpFirst
	{margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	margin-bottom:.0001pt;
	text-align:justify;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	}
p.MsoListParagraphCxSpMiddle
	{margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	margin-bottom:.0001pt;
	text-align:justify;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	}
p.MsoListParagraphCxSpLast
	{margin-top:0cm;
	margin-right:0cm;
	margin-bottom:10.0pt;
	margin-left:36.0pt;
	text-align:justify;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderLeft" Runat="Server">
    <asp:ImageButton ID="ImageButton1" runat="server" 
        onclick="ImageButton1_Click" Height="135px" Width="150px" />
    <br />
    <asp:Label ID="Label1" runat="server" Text="Label" CssClass="lb"></asp:Label>
    &nbsp;<asp:Label 
         ID="Label2" runat="server" Text="Label" CssClass="lb"></asp:Label>
    <br />
    <uc1:HomeMenu ID="HomeMenu1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderRight" Runat="Server">
    <p class="MsoNormal">
        <b style="mso-bidi-font-weight:normal">
        <span style="font-size:18.0pt;mso-bidi-font-size:11.0pt">&nbsp;&nbsp;&nbsp; <u>
        Get2Gether Help:<o:p></o:p></u></span></b></p>
    <p class="MsoListParagraphCxSpFirst" 
        style="text-indent:-18.0pt;mso-list:l1 level1 lfo1">
        <![if !supportLists]>
        <span style="mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin">
        <span style="mso-list:Ignore">1.<span 
            style="font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </span></span></span><![endif]>Change your Account setting using the section
        <b style="mso-bidi-font-weight:normal">Settings</b>.</p>
    <p class="MsoListParagraphCxSpMiddle" 
        style="text-indent:-18.0pt;mso-list:l1 level1 lfo1">
        <![if !supportLists]>
        <span style="mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin">
        <span style="mso-list:Ignore">2.<span 
            style="font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </span></span></span><![endif]>Account setting consist of
    </p>
    <p class="MsoListParagraphCxSpMiddle" style="margin-left:72.0pt;mso-add-space:
auto;text-indent:-18.0pt;mso-list:l0 level1 lfo2">
        <![if !supportLists]>
        <span style="font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:
Symbol"><span style="mso-list:Ignore">·<span 
            style="font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </span></span></span><![endif]>Change Password.</p>
    <p class="MsoListParagraphCxSpMiddle" style="margin-left:72.0pt;mso-add-space:
auto;text-indent:-18.0pt;mso-list:l0 level1 lfo2">
        <![if !supportLists]>
        <span style="font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:
Symbol"><span style="mso-list:Ignore">·<span 
            style="font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </span></span></span><![endif]>Edit Album Photo.</p>
    <p class="MsoListParagraphCxSpMiddle" style="margin-left:72.0pt;mso-add-space:
auto;text-indent:-18.0pt;mso-list:l0 level1 lfo2">
        <![if !supportLists]>
        <span style="font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:
Symbol"><span style="mso-list:Ignore">·<span 
            style="font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </span></span></span><![endif]>Edit Profile.</p>
    <p class="MsoListParagraphCxSpMiddle" style="margin-left:72.0pt;mso-add-space:
auto;text-indent:-18.0pt;mso-list:l0 level1 lfo2">
        <![if !supportLists]>
        <span style="font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:
Symbol"><span style="mso-list:Ignore">·<span 
            style="font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </span></span></span><![endif]>Edit Posts.</p>
    <p class="MsoListParagraphCxSpMiddle" style="margin-left:72.0pt;mso-add-space:
auto;text-indent:-18.0pt;mso-list:l0 level1 lfo2">
        <![if !supportLists]>
        <span style="font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:
Symbol"><span style="mso-list:Ignore">·<span 
            style="font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </span></span></span><![endif]>Edit Friends.</p>
    <p class="MsoListParagraphCxSpMiddle" 
        style="text-indent:-18.0pt;mso-list:l1 level1 lfo1">
        <![if !supportLists]>
        <span style="mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin">
        <span style="mso-list:Ignore">3.<span 
            style="font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </span></span></span><![endif]>Use <b style="mso-bidi-font-weight:normal">Easy 
        Life</b> for using additional gadgets.</p>
    <p class="MsoListParagraphCxSpMiddle" 
        style="text-indent:-18.0pt;mso-list:l1 level1 lfo1">
        <![if !supportLists]>
        <span style="mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin">
        <span style="mso-list:Ignore">4.<span 
            style="font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </span></span></span><![endif]>Create your album, add picture as much you want 
        in the <b style="mso-bidi-font-weight:normal">Create Albums</b> section.</p>
    <p class="MsoListParagraphCxSpMiddle" 
        style="text-indent:-18.0pt;mso-list:l1 level1 lfo1">
        <![if !supportLists]>
        <span style="mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin">
        <span style="mso-list:Ignore">5.<span 
            style="font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </span></span></span><![endif]>Add more friends in your account by using the 
        special feature of <b style="mso-bidi-font-weight:normal">Find Friends</b>.</p>
    <p class="MsoListParagraphCxSpLast" 
        style="text-indent:-18.0pt;mso-list:l1 level1 lfo1">
        <![if !supportLists]>
        <span style="mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin">
        <span style="mso-list:Ignore">6.<span 
            style="font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </span></span></span><![endif]><b style="mso-bidi-font-weight:normal">Change/Add</b> 
        your required <b style="mso-bidi-font-weight:normal">Profile Picture</b> to make 
        your account more identifiable and attractive.</p>
</asp:Content>

