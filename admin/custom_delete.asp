<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<%
If request.QueryString("id") = "" Or Not IsNumeric(request.QueryString("id")) Then
    response.Write "<script language=javascript>alert(""�Ƿ�������"");window.history.back();</script>"
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
    response.Write "<script language=javascript>alert(""�˷����°�����ҳ������ɾ���ӵ�ҳ��"");window.history.back();</script>"
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
    response.Write "<script language=javascript>alert(""�����ڴ����ݣ�"");window.history.back();</script>"
    response.End()
Else
    rs.Delete
    rs.Update
    rs.Close
    Set rs = Nothing
    conn.Close
    Set conn = Nothing
    response.Write "<script language=javascript>alert(""��ҳɾ���ɹ���"");window.location.href=""custom.asp""</script>"
    response.End
End If
%>