<!--#include file="../conn.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 
<%

if sid<>"null" then
			conn.execute("update [user] set homepage='' where homepage='"&sid&"'")
response.Write "<script language='javascript'>alert('�Ѿ��˳���½��');window.location.href='../index.asp';</script>"
end if
 
%>