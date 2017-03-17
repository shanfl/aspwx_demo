<% Response.Buffer = True %>
<%
'On Error Resume Next '程序遇到错误还会向下执行
db = "/data/!@#$%cherry.mdb"
connstr = "DBQ=" + server.mappath(""&db&"") + ";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"
Set conn = server.CreateObject("ADODB.CONNECTION")
conn.Open connstr
If Err<>0 Then
    Err.Clear
    Set conn = Nothing
    Response.Write("不能连接到数据库！")
    Response.End()
End If
Rem 过滤HTML代码
Function HtmlEncode(strTmp)
		If IsNull(strTmp) Then
			HtmlEncode = ""
			Exit Function
		End If
		Dim strContent
		strContent = Replace(Replace(Replace(Replace(Replace(strTmp,"&","&amp;"),"'","&apos;"),">","&gt;"),"<","&lt;"),"""","&quot;")
		HtmlEncode = strContent
End Function
urls = Request.ServerVariables("URL")
Function GrateRs(SqlStr,wr)
	'On Error Resume Next
	Set GrateRs=Server.CreateObject("ADODB.Recordset")
	GrateRs.Open SqlStr,conn,1,wr
	If Err Then
		Response.Write "rs->"&err.description&"->"&SqlStr
		err.Clear
		Response.End
	End If
End Function

%>
