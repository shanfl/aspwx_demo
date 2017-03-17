<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->

<%
On Error Resume Next '程序遇到错误还会向下执行

for i=1 to 2000
Set rs = server.CreateObject("adodb.recordset")
    sql = "delete orders where actionid="&i&""
    rs.Open sql, conn, 1, 3
    rs.update
	response.Write "正在删除第"&i&"条<br/>"
next
    rs.Close
    Set rs = Nothing
    conn.Close
%>
