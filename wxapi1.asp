<!--#include file="user/md5.asp"-->
<%
'response.write request("echostr")
'response.end

dim signature	'微信加密签名
dim timestamp	'时间戳
dim nonce		'随机数
'dim echostr		'随机字符串
dim Token
dim signaturetmp
token="weixin"'您在后台添写的 token

signature = Request("signature")
nonce = Request("nonce")
timestamp = Request("timestamp")

dim ToUserName	'开发者微信号
dim FromUserName'发送方帐号（一个OpenID）
dim CreateTime	'消息创建时间（整型）
dim MsgType		'text
dim Content		'文本消息内容
dim MsgId		'消息id，64位整型




set xml_dom = Server.CreateObject("MSXML2.DOMDocument")'此处根据您的实际服务器情况改写
xml_dom.load request
ToUserName=xml_dom.getelementsbytagname("ToUserName").item(0).text
FromUserName=xml_dom.getelementsbytagname("FromUserName").item(0).text
MsgType=xml_dom.getelementsbytagname("MsgType").item(0).text
if MsgType="text" then
Content=xml_dom.getelementsbytagname("Content").item(0).text
end if

'On Error Resume Next '程序遇到错误还会向下执行
db = "/data/!@#$%cherry.mdb"
connstr = "DBQ=" + server.mappath(""&db&"") + ";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"
Set conn = server.CreateObject("ADODB.CONNECTION")
conn.Open connstr
If Err<>0 Then
    Err.Clear
    Set conn = Nothing
    Response.Write("不能连接到数据库！")
    Response.End()
End If


set xml_dom=Nothing

'得到IP地址
Function GetIP()
    UserTrueIP=Request.ServerVariables("HTTP_X_FORWARDED_FOR")
    If UserTrueIP="" Then UserTrueIP=Request.ServerVariables("REMOTE_ADDR")
    GetIP=UserTrueIP
End Function

ip=getip()



homepage=md5(now()&Session.SessionID&FromUserName)&md5(Replace(Replace(now,":","")," ",""))
siteurl="http://www.huisigou.com/?sid="&homepage&""
siteurla="http://www.huisigou.com/"
dim  mingling,mlid
mingling=replace(content,chr(13),"")
mingling=trim(replace(mingling,chr(10),""))
sypic="http://www.huisigou.com/uploadfile/201309131347002929.jpg"

Set Rs=Conn.Execute("select UserName from [user] where UserName='"&left(md5(FromUserName),8)&"'")
if not rs.eof then
Conn.Execute("update [user] set homepage='"&homepage&"' where UserName='"&left(md5(FromUserName),8)&"'")
else
Conn.Execute("insert into [user](UserName,homepage) values('"&left(md5(FromUserName),8)&"','"&homepage&"')")
end if
Conn.Execute("insert into [log](user,ip) values('"&left(md5(FromUserName),8)&"','"&ip&"')")

strresponse="<xml>"
 strresponse=strresponse&"<ToUserName><![CDATA["&fromusername&"]]></ToUserName>"
 strresponse=strresponse&"<FromUserName><![CDATA["&tousername&"]]></FromUserName>"
 strresponse=strresponse&"<CreateTime>"&now&"</CreateTime>"
 strresponse=strresponse&"<MsgType><![CDATA[news]]></MsgType>"
 strresponse=strresponse&"<ArticleCount>4</ArticleCount>"
 strresponse=strresponse&"<Articles>"
  strresponse=strresponse&"<item>"
 strresponse=strresponse&"<Title><![CDATA[WAP微信网站首页]]></Title>"
 strresponse=strresponse&"<Description><![CDATA[WAP微信网站首页]]></Description>"
 strresponse=strresponse&"<PicUrl><![CDATA["&sypic&"]]></PicUrl>"
 strresponse=strresponse&"<Url><![CDATA["&siteurl&"]]></Url>"
 strresponse=strresponse&"</item>"
Set rs = server.CreateObject("adodb.recordset")
sql = "select top 3 * from products order by id desc"
rs.Open sql, conn, 1, 3
Do While Not rs.EOF
picurl=siteurla&""&rs("uploadfile")&""
url=siteurla&"/show/?id="&rs("id")&"&sid="&homepage&""
namea=""&rs("title")&""
 strresponse=strresponse&"<item>"
 strresponse=strresponse&"<Title><![CDATA["&namea&"]]></Title>"
 strresponse=strresponse&"<Description><![CDATA["&namea&"]]></Description>"
 strresponse=strresponse&"<PicUrl><![CDATA["&picurl&"]]></PicUrl>"
 strresponse=strresponse&"<Url><![CDATA["&url&"]]></Url>"
 strresponse=strresponse&"</item>"
rs.movenext
Loop
rs.Close
Set rs = Nothing
 strresponse=strresponse&"</Articles>"
 strresponse=strresponse&"</xml>"
response.write strresponse


%>