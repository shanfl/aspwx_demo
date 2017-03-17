<!--#include file="../conn.asp"-->
<!--#include file="md5.asp"-->
<!--#include file="session.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 

<%   if strUserName<>"" then
mz="<font color=red>"&strUserName&"</font>"
else
mz="游客"
end if
conn.execute("insert into sqdt(shijian,dz)values('"&now&"','["&mz&"] 修改了个人资料>> <a href=""/user/loguser.asp?sid="&sid&""">个人资料</a>')") %>
<%  


tel = GetSafeStr(Request("tel"))'电话
dz=GetSafeStr(Request("dz"))'地址
pass=GetSafeStr(Request("pass"))'密码
email=GetSafeStr(Request("email"))
%>
<%
ip=GetIP()

if pass<>"" then
Conn.Execute("update [user] set UserPassword='"&md5(pass)&"' where userid="&strUserID&"")
else
Conn.Execute("update [user] set usertel='"&tel&"',useradder='"&dz&"',UserEmail='"&email&"' where userid="&strUserID&"")
end if

	response.Write("<script language=javascript>alert('修改成功!');window.location.href='loguser.asp?sid="&sid&"';</script>")
 
  conn.Close
    Set conn = Nothing
%>

