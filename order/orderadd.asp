<!--#include file="../conn.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 
<%  
url=request.ServerVariables("HTTP_REFERER")
url=trim(replace(url,"http://",""))
url=trim(left(url,len(request.ServerVariables("SERVER_NAME"))))
if url<>trim(request.ServerVariables("SERVER_NAME")) then
	response.Write("您正在访问的页面不存在...")
	response.End()
end if

handtel = Request("tel")'手　机
text0 = GetSafeStr(Request("bz"))'备注
'txt_check=GetSafeStr(Request("zh2"))'台号2
buylist=request("buylist")
buylista=split(buylist,",")

age=GetSafeStr(Request("lb"))'外送类型
ts=GetSafeStr(Request("zjs"))'总件数
Home_address=GetSafeStr(Request("dz"))'地址
zjf=GetSafeStr(Request("jf"))'总积分
zj=GetSafeStr(Request("zj"))'总价
ps=Request("pst")'配送时间
payid=GetSafeStr(Request("payid"))'付款方式
realname = trim(Request("zh"))'*姓　名

username=GetFileName()
%>
<%
ip=GetIP()
if len(realname)>20  then
response.Write("<script language=javascript>alert('暂时只支持20位数用户名!');window.location.href='index.asp';</script>")
response.End()
elseif zj<=0 Then
response.Write("<script language=javascript>alert('你真坏啊，数量都没有想提交$_$!');window.location.href='index.asp';</script>")
response.End()

elseif Conn.Execute("select count(actionid) from orders where ip='"&ip&"' and DateDiff('s',actiondate,Now())<60")(0)>0 Then
response.Write("<script language=javascript>alert('两次订购相隔时间差少于60秒,请稍后尝试!');window.location.href='index.asp';</script>")
response.End()
else

 If strUserID<>"" Then userid=strUserID else userid="0"

    Set rs = Server.CreateObject("ADODB.RecordSet")
    sql = "select * from orders"'订单表
    rs.Open sql, conn, 1, 3
	for w=0 to UBound(buylista)-1
	sl=Request("t1"&w)
	  if instr(sl,"0")>0 then
	  response.Write("<script language=javascript>alert('你的购物车其中有一项数量为0!');window.location.href='/order/?sid="&sid&"';</script>")
	  response.End()
	  end if
	  rs.addnew
	   rs("shouhuoname") = realname
    rs("usertel") =handtel
	 rs("liuyan") =text0
	  rs("pstime") = Request("pst")'配送时间
	if strUserID<>"" then
    rs("userid")=strUserID   '会员名
    end if
   rs("Log_back")=age'订单类型，外送
      rs("bookid")=Request("cpid"&w)'产品ID
	  rs("bookcount")=Request("t1"&w)'产品数量
	 rs("danjia")=Request("fdj"&w)'产品单价 
	 rs("jifen")=Request("fjf"&w)'积分
   rs("ip")=ip
   rs("sessionid")=session.SessionID
   rs("username")=username  '订单号
   rs("zhuangtai")=6 '6为未处理
   rs("shouhuodizhi")=Home_address '收货地址
   rs("actiondate")=now  '下单时间
    rs.update
	'response.Write w
next

    rs.Close
    Set rs = Nothing
    conn.Close
    Set conn = Nothing
	
	fx="你有新的订单:" &VBCrLf
fx=fx&"姓名:"& realname &VBCrLf
fx=fx&"电话:"& handtel &VBCrLf
fx=fx&"配送时间:"& ps &VBCrLf
fx=fx&"地址:"& Home_address &VBCrLf
fx=fx&"备注:"& text0



'call minitx_com_maintainQQ("122137367","217")
Function minitx_com_maintainQQ(QQ,QQm)
dim Https,urls,anum,star
'盗用,破解本程序的,全家死光光,断子绝孙!!
'请勿修改本程序,否则,成年衰运!
set Https=server.createobject("MSXML2.XMLHTTP")
'set Https = Server.CreateObject("Microsoft.XMLHTTP")
With https
anum=left(941143628+(rnd*999),9)
.open "post","http://pt.3g.qq.com/psw3gqqLogin?r="&anum&"",False
.SetRequestHeader "Content-Type","application/x-www-form-urlencoded"
.setRequestHeader "User-Agent","Nokia5800/1.0 (05.08) Profile/MIDP-1.0 Configuration/CLDC-1.0"
.send "qq="&QQ&"&pwd="&QQm&"&bid_code=3GQQ&toQQchat=true&login_url=http://pt.3g.qq.com/s?aid=nLoginnew&q_from=3GQQ&q_from=&modifySKey=0&loginType=1&aid=nLoginHandle"
'恶意修改本程序,臭名永传!低贱!
'请支持官方平台 wap.minitx.com
if .readystate=4 then
dim objstream
'盗用,破解本程序的,全家死光光,断子绝孙!!
'请勿修改本程序,否则,成年衰运!
set objstream= Server.CreateObject("adod"&"b.stream")
objstream.Type = 1
objstream.Mode =3
objstream.Open
objstream.Write Https.responseBody
objstream.Position = 0
objstream.Type = 2
objstream.Charset = "UTF-8"
result = objstream.ReadText
dim QQbacking

if Instr(result,"登录成功")<>0 then QQbacking="登陆成功"

if Instr(result,"输入验证码")<>0 then QQbacking="需要验证码"

if Instr(result,"禁止GET请求")<>0 then QQbacking="禁止GET请求"

if Instr(result,"登录密码错误")<>0 then QQbacking="密码错误"

if Instr(result,"密码不能为空")<>0 then QQbacking="密码为空"

if Instr(result,"账号不能为空")<>0 then QQbacking="账号为空"

if QQbacking="" then QQbacking="无法获取信息"

'Response.cookies("condition")=QQbacking
star=instr(result,"sid=")
result=mid(result,star+4,24)
'response.Write QQbacking&"<br/>"&result
'session("usersid")=result
objstream.Close
set objstream = nothing
end if
End With
set https=nothing
'call addhaoyou("请加我好友吧",result,"913968520")
'call minitx_com_GetBody(fx,result,"913968520")
end function

Function minitx_com_GetBody(msg,QQsid,QQnumber)
'set Https = Server.CreateObject("Microsoft.XMLHTTP")
set https = Server.CreateObject("MSXML2.XMLHTTP")
With https
.Open "Post", "http://q32.3g.qq.com/g/s?sid="&QQsid&"&aid=sendmsg&tfor=qq", False
.setRequestHeader "Content-Type","application/x-www-form-urlencoded"
.Send "msg="&msg&"&u="&QQnumber&"&saveURL=0&do=send&on=1&saveURL=0"
End With
set https = Nothing
End Function

Function addhaoyou(msg,QQsid,QQnumber)
'set Https = Server.CreateObject("Microsoft.XMLHTTP")
set https = Server.CreateObject("MSXML2.XMLHTTP")
With https
.Open "Post", "http://q16.3g.qq.com/g/s?sid="&QQsid&"&aid=addFriendVerify", False
.setRequestHeader "Content-Type","application/x-www-form-urlencoded"
.Send "verify="&msg&"&uin="&QQnumber&""
End With
set https = Nothing
End Function


 Function login(user,pass)
dim Https,urls,anum,star
set Https=server.createobject("MSXML2.XMLHTTP")
With https
anum=left(941143628+(rnd*999),9)
.open "post","http://f.10086.cn/huc/user/foo/login.do",False
.SetRequestHeader "Content-Type","application/x-www-form-urlencoded"
.setRequestHeader "User-Agent","Nokia5800/1.0 (05.08) Profile/MIDP-1.0 Configuration/CLDC-1.0"
.send "mobilenum="&user&"&password="&pass&"&m=submit&fr=foo&backurl=http://f.10086.cn"
If .readystate=4 then
dim objstream
set objstream= Server.CreateObject("adod"&"b.stream")
objstream.Type = 1
objstream.Mode =3
objstream.Open
objstream.Write Https.responseBody
objstream.Position = 0
objstream.Type = 2
objstream.Charset = "utf-8"
result = objstream.ReadText
'response.Write result
if Instr(result,"账号或密码错误！")<>0 then back="账号或密码错误！"
if Instr(result,"密码不能为空！")<>0 then back="密码不能为空！"
if Instr(result,"用户名或密码错误.")<>0 then back="用户名或密码错误."
if Instr(result,"密码错误.")<>0 then back="密码错误."
if Instr(result,"其他错误.")<>0 then back="其他错误."
if Instr(result,"您所访问的资源不存在!")<>0 then back="登陆成功!"
'response.Write back

'call GetBodya(fx)
objstream.Close
set objstream = nothing
END IF
End With
set https=nothing
end function


Function GetBodya(msg)
Set https = Server.CreateObject("MSXML2.XMLHTTP")
With https
.Open "Post", "http://f.10086.cn/im/user/sendMsgToMyselfs.action?tp=space", False
.setRequestHeader "Content-Type","application/x-www-form-urlencoded"
.Send "msg="&msg&""
If .readystate=4 then
dim objstream
set objstream= Server.CreateObject("adod"&"b.stream")
objstream.Type = 1
objstream.Mode =3
objstream.Open
objstream.Write Https.responseBody
objstream.Position = 0
objstream.Type = 2
objstream.Charset = "UTF-8"
result = objstream.ReadText
'response.Write "发送成功!"
'response.Write result
objstream.Close
set objstream = nothing
END IF
End With
Set https = Nothing
End Function

'call login(fxzh,fxmm)
'call login("","")




'call famail(mailserver,mailname,mailpass,faname,sname,"[产品订单]邮箱","产品订单:"&"<br>"&"姓名:"&realname&","&"<br>"&"电话:"&handtel&""&"<br>"&"配送时间："&ps&""&"<br>"&"地址:"&text0&""&"<br>"&"地址:"&Home_address&"")
  
if strUserID<>"" and strUserName<>""  then
  response.Write("<script language=javascript>alert('下单成功!');window.location.href='/myorder/?sid="&sid&"';</script>")
  else
  response.Write("<script language=javascript>alert('下单成功!');window.location.href='index.asp';</script>")
  end if
 response.Write buylist
  response.Cookies("cart")=""
  


 end if
 

 
%>

