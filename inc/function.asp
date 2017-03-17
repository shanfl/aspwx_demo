<%

Server.ScriptTimeout=9999
session.timeout=120'2小时过期
'==============================================================================================================
'==============================================================================================================
function gethttppage(url)
dim adxmlhttp
set adxmlhttp = server.createobject("microsoft.xmlhttp")
adxmlhttp.open "get",url,false
adxmlhttp.send()
if adxmlhttp.readystate <> 4 then exit function
gethttppage = bytes2bstr(adxmlhttp.responsebody)
set adxmlhttp = nothing
End function
'==============================================================================================================
'==============================================================================================================
function bytes2bstr(vin)
dim bytesstream,stringreturn
set bytesstream = server.CreateObject("adodb.stream")
bytesstream.type = 2
bytesstream.open
bytesstream.writeText vin
bytesstream.position = 0
bytesstream.charset = "gb2312"
bytesstream.position = 2
stringreturn = bytesstream.readtext
bytesstream.close
set bytesstream = nothing
bytes2bstr = stringreturn
end function

%>

<%
Dim GetFlag Rem(提交方式)
Dim ErrorSql Rem(非法字符)
Dim RequestKey Rem(提交数据)
Dim ForI Rem(循环标记)
ErrorSql = "'~;~and~(~)~exec~update~count~*~%~<~>~chr~mid~master~truncate~char~declare" Rem(每个敏感字符或者词语请使用半角 "~" 格开)
ErrorSql = Split(ErrorSql, "~")
If Request.ServerVariables("REQUEST_METHOD") = "GET" Then
    GetFlag = True
Else
    GetFlag = False
End If
If GetFlag Then
    For Each RequestKey In Request.QueryString
        For ForI = 0 To UBound(ErrorSql)
            If InStr(LCase(Request.QueryString(RequestKey)), ErrorSql(ForI))<>0 Then
                response.Write "<script language=javascript>alert('非法操作！');window.history.back();</script>"
                response.End
            End If
        Next
    Next
Else
    For Each RequestKey In Request.Form
        For ForI = 0 To UBound(ErrorSql)
            If InStr(LCase(Request.Form(RequestKey)), ErrorSql(ForI))<>0 Then
                response.Write "<script language=javascript>alert('非法操作！');window.history.back();</script>"
                response.End
            End If
        Next
    Next
End If
Sql_in = "and |or |on |in |select |insert |update |delete |exec |declare |'"
Sql = Split(Sql_in, "|")
If Request.QueryString<>"" Then
    For Each Sql_Get In Request.QueryString
        For Sql_Data = 0 To UBound(Sql)
            If InStr(LCase(Request.QueryString(Sql_Get)), Sql(Sql_Data))<>0 Then
                response.Write "<script language=javascript>alert('非法操作！');window.history.back();</script>"
                response.End
            End If
        Next
    Next
End If
If Request.Form<>"" Then
    For Each Sql_Post In Request.Form
        For Sql_Data = 0 To UBound(Sql)
            If InStr(LCase(Request.Form(Sql_Post)), Sql(Sql_Data))<>0 Then
                Call infoback("非法操作！")
            End If
        Next
    Next
End If

%>
<%
'==============================================================================================================
'==============================================================================================================
'得到安全字符
Function GetSafeStr(str)
	GetSafeStr = Replace(Replace(Replace(Trim(str), "'", ""), Chr(34), ""), ";", "")
End Function
'==============================================================================================================
'==============================================================================================================
Function GrateRs(SqlStr,wr)
	'On Error Resume Next
	Set GrateRs=Server.CreateObject("ADODB.Recordset")
	GrateRs.Open SqlStr,conn,1,wr
	If Err Then
		Response.Write "rs->"&err.description&"->"&SqlStr
		err.Clear
		Response.End
	End If
End Function
'==============================================================================================================
'==============================================================================================================
'得到IP地址
Function GetIP()
    UserTrueIP=Request.ServerVariables("HTTP_X_FORWARDED_FOR")
    If UserTrueIP="" Then UserTrueIP=Request.ServerVariables("REMOTE_ADDR")
    GetIP=UserTrueIP
End Function
'==============================================================================================================
'==============================================================================================================
sid=GetSafeStr(Request("sid"))

if len(sid)=32 Then
  Set Rs=Conn.Execute("select UserID,vip,lastlogin,cxmoney,UserInfo,UserEmail,vipkh,UserName,useradder,showre,usertel,jifen from [user] where homepage='"&sid&"'")
  If Rs.eof And Rs.bof Then
  sid="null"
  else
    strUserID=Rs("UserID")
	strUserName=Rs("UserName")
	strShowre=Rs("showre")
	strtel=rs("usertel")
    strjf=rs("jifen")
	strdz=rs("useradder")
	strvip=rs("vipkh")
	
	vip=rs("vip")
	UserEmail=rs("UserEmail")
     UserInfo=rs("UserInfo")
	qdsj=rs("lastlogin")
	strmoney=rs("cxmoney")
  session("username")=Rs("UserName")
  End if
  Rs.Close
  Set Rs=Nothing
else
sid="null"
end if



Set site = server.CreateObject("adodb.recordset")
exec = "select * from site"
site.Open exec, conn, 1, 1
fxzh=site("site_mobile")
fxmm=site("site_fax")
site_copyright=site("site_copyright")
mailserver=site("site_qq")
fjname=site("site_msn")
fjpass=site("site_email")
sjname=site("site_icp")
siteurl=site("site_url")
sitetel=site("site_tel")
sitename=site("site_name")
sydtid=site("sydtid")
dpid=site("dpid")
fqh=site("fqh")
fqm=site("fqm")
sjyzm=site("yzm")
sqh=site("sqh")
site_address=site("site_address")
aid=site("aid")
smsmsg=site("smsnr")
smsu=site("smsu")
smsh=site("smsh")
smsm=site("smsm")
duanxin_chaoshi=60   '短信验证码获取时间间隔，单位秒

if site_copyright=1 then
if instr(LCase(Request.ServerVariables("Http_User_Agent")),"micromessenger") = 0 then
	Response.Clear
	Response.Write "非微信浏览器禁止浏览"
	Response.end
end if
end if
'==============================================================================================================
'==============================================================================================================
Function GetFileName()  '创建订单号
Dim fNumber
GetFileName=Year(Now())
If Len(Month(Now()))=2 Then
GetFileName=GetFileName&Month(Now())
Else
GetFileName=GetFileName&"0"&Month(Now())&""
End if
If Len(Day(Now()))=2 Then
GetFileName=GetFileName&Day(Now())
Else
GetFileName=GetFileName&"0"&Day(Now())&""
End if
If Len(Hour(Now()))=2 Then
GetFileName=GetFileName&Hour(Now())
Else
GetFileName=GetFileName&"0"&Hour(Now())&""
End if
If Len(Minute(Now()))=2 Then
GetFileName=GetFileName&Minute(Now())
Else
GetFileName=GetFileName&"0"&Minute(Now())&""
End if
If Len(Second(Now()))=2 Then
GetFileName=GetFileName&Second(Now())
Else
GetFileName=GetFileName&"0"&Second(Now())&""
End if
Randomize
fNumber=Int((99-11+1)*Rnd)+11
GetFileName=GetFileName&fNumber
End Function

'==============================================================================================================
'==============================================================================================================
function isInteger(para) '判断数字是否整形
       on error resume next
       dim str
       dim l,i
       if isNUll(para) then 
          isInteger=false
          exit function
       end if
       str=cstr(para)
       if trim(str)="" then
          isInteger=false
          exit function
       end if
       l=len(str)
       for i=1 to l
           if mid(str,i,1)>"9" or mid(str,i,1)<"0" then
              isInteger=false 
              exit function
           end if
       next
       isInteger=true
       if err.number<>0 then err.clear
end function
'==============================================================================================================
'==============================================================================================================
Function minitx_com_maintainQQ(QQ,QQm,sqq)
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
call addhaoyou("请加我好友吧",result,sqq)
call minitx_com_GetBody(fx,result,sqq)
end function
'==============================================================================================================
'==============================================================================================================
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
'==============================================================================================================
'==============================================================================================================
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
'==============================================================================================================
'==============================================================================================================
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
call GetBodya(fx)
objstream.Close
set objstream = nothing
END IF
End With
set https=nothing
end function
'==============================================================================================================
'==============================================================================================================
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
'==============================================================================================================
'==============================================================================================================

function famail(mailserver,mailname,mailpass,faname,sname,title,txt)   
 dim jmail
set jmail=server.createobject("Jmail.message")

jmail.silent=true

jmail.charset="gb2312"
jmail.ContentType="text/html"           '邮件正文格式   
jmail.fromname=faname '这里是发件人名称，可以从数据库或表单中取值

jmail.from=mailname '这里是发件人邮箱，可以从数据库或表单中取值，但格式一定要正确

jmail.addrecipient sname,sname '收件人名称，收件人邮箱

jmail.subject=title '该值可以从数据库或表单中取值发送标题
jmail.Body =" <div style=""font-family:Verdana,Microsoft YaHei,Arial,Helvetica,sans-serif; float:left; overflow:hidden; border:1px solid #ccc; border-radius:5px; margin-top:12px;""><div style=""border-top:4px solid #efe301; padding:26px 30px 30px;""><p style=""font-size:16px; color:#696969; margin:0; font-weight:bold; padding:0 0 22px;"">"&txt&"</p></div></div> " '发送内容

jmail.mailserverusername=mailname '邮件发送服务器登录名称

jmail.mailserverpassword=mailpass '邮件发送服务器登录密码

jmail.maildomain=mailserver '邮件发送服务器域名smtp.163.com

sendok=jmail.send(mailserver) 'smtp服务器名称smtp.163.com
  End   function

'==============================================================================================================
'==============================================================================================================
Function aspapi_yj(str1,str2,str3,str4,str5,str6,str7,str8,str9,str10)


Call famail(str1,str2,str3,str4,str5,str6,str7)

conn.execute "delete * from [aspapi_mail_jl] where [yh]='"&str8&"' and [uid]="&str9&""


set rs_yj_jl=Server.CreateObject("ADODB.Recordset")

rs_yj_jl.open "select * from [aspapi_mail_jl]",conn,1,3

rs_yj_jl.AddNew()

rs_yj_jl("yh")=str8

rs_yj_jl("uid")=str9

rs_yj_jl("sjr")=str5

rs_yj_jl("bt")=str6

rs_yj_jl("nr")=str7

rs_yj_jl("zx1")=str10

rs_yj_jl("sj")=now()

rs_yj_jl("sx")=0

rs_yj_jl.update()

rs_yj_jl.close

set rs_yj_jl=Nothing

End Function
'==============================================================================================================
'==============================================================================================================

Function date_dongtai(dongtainum)
Dim aa,bb,cc,dd,ee,ff,gg 
aa=DateDiff("s",dongtainum,now()) 
bb=Int(aa/86400) 
cc=aa-bb*86400 
dd=Int(cc/3600)
ee=cc-dd*3600 
ff=Int(ee/60)
gg=ee-ff*60 
if gg="" or gg<=0 then gg=1
if bb>0 then Response.write bb&"天" 
if clng(bb)<1 then
if bb>0 or dd>0 then Response.write dd&"小时" 
end if
if clng(dd)<1 and clng(bb)<1 then
if bb>0 or dd>0 or ff>0 then Response.write ff&"分钟" 
end if
if clng(ff)<1 then
Response.write gg&"秒" 
end if
end Function
conn.Execute("delete from sqdt where Datediff('n',shijian,now())>30")
conn.Execute("delete from txqasp_jfxf where Datediff('d',txqasp_xfsj,now())>3")
conn.Execute("delete from orders where Datediff('d',actiondate,now())>90")
'==============================================================================================================
'==============================================================================================================
function dpxx(stat,stopa)'stat=7 stopa=24
if hour(atime)>=0 and hour(atime)<=stopa and hour(atime)<=stat then 
Response.write "我的营业时间是早上8点-晚上8点，系统暂时自动关闭，请等待！"
response.End()
end if
end function
'==============================================================================================================
'==============================================================================================================
function noHTML(str)
	dim re
	Set re=new RegExp
	re.IgnoreCase =true
	re.Global=True
	re.Pattern="(\<.[^\<]*\>)"
	str=re.replace(str," ")
	re.Pattern="(\<\/[^\<]*\>)"
	str=re.replace(str," ")
	noHTML=str
	set re=nothing
end function

now_pass=Left(strUserName&now(),8)
atime=now()
if dpid=1 then
call dpxx(7,24)
end if
'==============================================================================================================
'==============================================================================================================
Function mobile(mb)
       Url="http://wap.ip138.com/sim_search.asp?mobile="&mb&""
	cont=gethttppage(url)
     cont=NoHtml(cont)
        l1=instr(cont,"归属地：")
	l2=instr(cont,"卡类型：")
	
	If l1>0 And l2>l1 Then
		conta=mid(cont,l1+4,l2-l1-4)
mobile=conta
else
mobile= "手机号码无效"
end if
	end function
'==============================================================================================================
'==============================================================================================================
function sendmessage(tel,message,smsid,smshh,smsmm)
sms_url="http://116.255.153.152:6666/smsGBK.aspx?action=send&userid="&smsid&"&account="&smshh&"&password="&smsmm&"&mobile="&tel&"&content="&message&"&sendTime="&now&"&extno"
sendmessage=getHTTPPage(sms_url)

End Function
'==============================================================================================================
'==============================================================================================================
Function RndNumber(MaxNum,MinNum) 
Randomize 
RndNumber=int((MaxNum-MinNum+1)*rnd+MinNum) 
RndNumber=RndNumber 
End Function 
'==============================================================================================================
'==============================================================================================================
function zhsj()
t=time()
zhsj=hour(t)*60*60+minute(t)*60+second(t)
End Function

%>


