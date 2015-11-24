<%--
'+ Dynamic RSS/XML feed using dataset - automatic update
'++++++++++++++++++++++++++++++++++++++++++++
--%>
<%@ Page Language="VB" Debug="true" %>
<%@ Import Namespace="System.Data" %>
<%@ import Namespace="System.Data.Oledb" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.IO" %>

<script runat="server">

'++++++++++++++++++++++++++++++++++++++++++++
'Handles page load events
      Private Sub Page_Load(sender As Object, e As System.EventArgs)
         Response.Clear()
         Response.ContentType = "text/xml"
         Dim objX As New XmlTextWriter(Response.OutputStream, Encoding.UTF8)
         objX.WriteStartDocument()
         objX.WriteStartElement("rss")
         objX.WriteAttributeString("version", "2.0")
         objX.WriteStartElement("channel")
         objX.WriteElementString("title", "World Recipe RSS Feed")
         objX.WriteElementString("link", "http://www.myasp-net.com")
         objX.WriteElementString("description", "Recipe Archive from around the world")
         objX.WriteElementString("copyright", "(c) 2005, Myasp-net.com and Ex-designz.net. All rights reserved.")
         objX.WriteElementString("ttl", "10")

         'Handles database connection string and command
         DBconnect()
         objConnection.Open()
         'SQL display details and rating value
         strSQL = "SELECT Top 10 ID,Name,HITS, Date,Category FROM Recipes Where LINK_APPROVED = 1 Order By Hits DESC"
         Dim objCommand = New OledbCommand(strSQL, objConnection)
         Dim objReader as OledbDataReader
         objReader  = objCommand.ExecuteReader()

         'Populate record for the RSS feed
         While objReader.Read()
            objX.WriteStartElement("item")
            objX.WriteElementString("title", objReader("Name"))
            objX.WriteElementString("link", "http://www.myasp-net.com/recipedetail.aspx?id=" & objReader("ID"))
            objX.WriteElementString("pubDate", objReader("Date"))
            objX.WriteEndElement()
         End While
         objReader.Close()
         objConnection.Close()
         
         objX.WriteEndElement()
         objX.WriteEndElement()
         objX.WriteEndDocument()
         objX.Flush()
         objX.Close()
         Response.End()

  End Sub
'++++++++++++++++++++++++++++++++++++++++++++


'++++++++++++++++++++++++++++++++++++++++++++
 'Database connection
 Sub DBconnect()

     objConnection = New OledbConnection(strConnection)
     
 End Sub
'++++++++++++++++++++++++++++++++++++++++++++

'++++++++++++++++++++++++++++++++++++++++++++
    Public strDBLocation = DB_Path()
    Public strConnection as string = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBLocation
    Public objConnection
    Public objCommand
    Public strSQL as String
'++++++++++++++++++++++++++++++++++++++++++++

</script>
<!--#include file="inc_databasepath.aspx"-->
