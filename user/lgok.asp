<!--#include file="../conn.asp"-->
<!--#include file="md5.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 
<%  

user = GetSafeStr(Request("user"))'�û���
psw = GetSafeStr(Request("psw"))'����

%>
<%
ip=GetIP()
if len(user)>16 then
response.Write("<script language=javascript>alert('�û������Գ�������!');window.location.href='login.asp';</script>")

elseif Conn.Execute("select count(id) from log where ip='"&ip&"' and DateDiff('s',time,Now())<60")(0)>0 Then
response.Write("<script language=javascript>alert('���ε�½���ʱ�������60��,���Ժ���!');window.location.href='login.asp';</script>")
else
Set Rsa=Conn.Execute("select userid from [user] where UserName='"&Left(user,16)&"' and UserPassword='"&md5(psw)&"'")

	if not rsa.eof then
	homepage=md5(Rsa("userid")&now()&Session.SessionID)&md5(Replace(Replace(now,":","")," ",""))
	Conn.Execute("update [user] set homepage='"&homepage&"' where userid="&Rsa("userid")&"")

	Conn.Execute("insert into [log](user,ip) values('"&user&"','"&ip&"')")
	
	response.Write("<script language=javascript>alert('��½�ɹ�!');window.location.href='index.asp?sid="&homepage&"';</script>")
	else
	
  response.Write("<script language=javascript>alert('�û������������!');window.location.href='login.asp';</script>")
  'response.Write buylist
  	end if
		
	rsa.Close
    Set rsa = Nothing
    conn.Close
    Set conn = Nothing
 end if
%>

