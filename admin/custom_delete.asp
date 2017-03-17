<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<%
If request.QueryString("id") = "" Or Not IsNumeric(request.QueryString("id")) Then
    response.Write "<script language=javascript>alert(""非法操作！"");window.history.back();</script>"
    response.End
End If
Set rs = server.CreateObject("adodb.recordset")
sql = "select * from custom where custom_parent = "&request.QueryString("ID")&""
rs.Open sql, conn, 1, 1
If Not rs.EOF Then
    rs.Close
    Set rs = Nothing
    conn.Close
    Set conn = Nothing
    response.Write "<script language=javascript>alert(""此分类下包含单页，请先删除子单页！"");window.history.back();</script>"
    response.End()
End If
Set rs = server.CreateObject("adodb.recordset")
sql = "select * from custom where id = "&request.QueryString("ID")&""
rs.Open sql, conn, 1, 3
If rs.EOF Then
    rs.Close
    Set rs = Nothing
    conn.Close
    Set conn = Nothing
    response.Write "<script language=javascript>alert(""不存在此数据！"");window.history.back();</script>"
    response.End()
Else
    rs.Delete
    rs.Update
    rs.Close
    Set rs = Nothing
    conn.Close
    Set conn = Nothing
    response.Write "<script language=javascript>alert(""单页删除成功！"");window.location.href=""custom.asp""</script>"
    response.End
End If
%>
