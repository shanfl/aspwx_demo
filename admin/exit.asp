<!--#include file="conn.asp"-->
<%
session.Abandon()

Response.Write("<script language=""JavaScript"">alert(""已经安全退出后台管理系统！"");</script>")
response.Write "<Meta http-equiv='refresh' content='0;URL=login.asp'>"

%>
