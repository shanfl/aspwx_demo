<!--#include file="conn.asp"-->
<%
session.Abandon()

Response.Write("<script language=""JavaScript"">alert(""�Ѿ���ȫ�˳���̨����ϵͳ��"");</script>")
response.Write "<Meta http-equiv='refresh' content='0;URL=login.asp'>"

%>
