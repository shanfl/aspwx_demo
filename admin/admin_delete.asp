<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<%
If request.QueryString("id") = "" Or Not IsNumeric(request.QueryString("id")) Then
    response.Write "<script language=javascript>alert(""�Ƿ�������"");window.history.back();</script>"
    response.End
End If
Set rs = server.CreateObject("adodb.recordset")
sql = "select * from admin where ID="&request.querystring("ID")&""
rs.Open sql, conn, 1, 3
If rs.EOF Then
    rs.Close
    Set rs = Nothing
    conn.Close
    Set conn = Nothing
    response.Write "<script language=javascript>alert(""�����ڴ����ݣ�"");window.history.back();</script>"
    response.End
Else
    rs.Delete
    rs.update
    response.Write "<script language=javascript>alert(""ɾ���ɹ���"");window.location.href=""admin.asp""</script>"
    response.End
End If
rs.Close
Set rs = Nothing
conn.Close
Set conn = Nothing
%>
