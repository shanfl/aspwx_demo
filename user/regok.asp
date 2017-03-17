<!--#include file="../conn.asp"-->
<!--#include file="md5.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 
<%  

user = GetSafeStr(Request("user"))'用户名
psw = GetSafeStr(Request("psw"))'密码
psw2=GetSafeStr(Request("psw2"))'台号2
sj=GetSafeStr(Request("sj"))'台号2
%>
<%
ip=GetIP()
if len(user)>16 then
response.Write("<script language=javascript>alert('用户名长度超出16位!');window.location.href='login.asp?ac=reg';</script>")
elseif len(sj)<7 or len(sj)>11 or not(isInteger(sj)) Then
response.Write("<script language=javascript>alert('手机号码格式不对!');window.location.href='login.asp?ac=reg';</script>")
elseif len(psw)<6 then
response.Write("<script language=javascript>alert('密码最少输入6位以上!');window.location.href='login.asp?ac=reg';</script>")
elseif Conn.Execute("select count(userid) from user where UserLastIP='"&ip&"' and DateDiff('s',adddate,Now())<60")(0)>0 Then
response.Write("<script language=javascript>alert('两次注册相隔时间差少于60秒,请稍后尝试!');window.location.href='login.asp?ac=reg';</script>")
else

Set Rsa=Conn.Execute("select UserID from [user] where UserName='"&user&"'")
	if not(rsa.eof and rsa.bof) then
	tUser=False
	response.Write("<script language=javascript>alert('用户名已存在!');window.location.href='login.asp?ac=reg';</script>")
	else
	homepage=md5(now()&Session.SessionID)&psw&md5(Replace(Replace(now,":","")," ",""))
	
	Conn.Execute("insert into [user](UserName,usertel,UserPassword,UserLastIP,homepage) values('"&user&"','"&sj&"','"&md5(psw)&"','"&IP&"','"&homepage&"')")
	

  response.Write("<script language=javascript>alert('注册成功!');window.location.href='login.asp';</script>")
  'response.Write buylist
  	end if
 end if
%>

