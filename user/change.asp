<!--#include file="../conn.asp"-->
<!--#include file="md5.asp"-->
<!--#include file="session.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 

<%   if strUserName<>"" then
mz="<font color=red>"&strUserName&"</font>"
else
mz="�ο�"
end if
conn.execute("insert into sqdt(shijian,dz)values('"&now&"','["&mz&"] �޸��˸�������>> <a href=""/user/loguser.asp?sid="&sid&""">��������</a>')") %>
<%  


tel = GetSafeStr(Request("tel"))'�绰
dz=GetSafeStr(Request("dz"))'��ַ
pass=GetSafeStr(Request("pass"))'����
email=GetSafeStr(Request("email"))
%>
<%
ip=GetIP()

if pass<>"" then
Conn.Execute("update [user] set UserPassword='"&md5(pass)&"' where userid="&strUserID&"")
else
Conn.Execute("update [user] set usertel='"&tel&"',useradder='"&dz&"',UserEmail='"&email&"' where userid="&strUserID&"")
end if

	response.Write("<script language=javascript>alert('�޸ĳɹ�!');window.location.href='loguser.asp?sid="&sid&"';</script>")
 
  conn.Close
    Set conn = Nothing
%>

