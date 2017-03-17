<%
'***********拉卡支付 laka5.Com***********
function requesturl(id)'获取URL
url=lcase(request.ServerVariables("url"))
insturl=InstrRev(""&url&"","/")
ggurl=left(""&url&"",""&insturl&"")
ggurl=replace(ggurl,"pay/","")'卡类支付文件夹名，如有修改过卡类支付的文件夹名这里也需要修改为对应的
ggurl=replace(ggurl,"wangyin/","")'网银支付文件夹名，如有修改过网银的文件夹名这里也需要修改为对应的
geturl1=""&ggurl&""
geturl2="http://"&request.servervariables("server_name")&""&ggurl&""
if id=1 then
requesturl=geturl1
elseif id=2 then
requesturl=geturl2
end if
end function

'接口密钥，需要更换成你自己的密钥，要跟后台设置的一致
'登录API平台，商户管理-->接入方式-->API接入，这里查看自己的密钥和ID
UserIda="5102"'平台商户ID，需要更换成自己的商户ID
SalfStr="JLdyT1E1hH2YAuNB23T3AipypB"'商户密钥

'网关地址
gateWary="http://api.la-ka.com/"

'充值结果后台通知地址，注意文件路径
result_url="http://"&request.ServerVariables("HTTP_HOST")&"/pay/result_url.asp"

'充值操作后用户返回到网站上的地址，注意文件路径
notify_url=""&requesturl(1)&"notify_Url.asp"

function checkNumber(n)
if IsNumeric(n) and not IsEmpty(n) Then
checkNumber=n
else
Response.write"<script>alert(""信息输入有误！"");;history.back(1);</script>"
response.End()
end if
end function

function getOrderId()
	Randomize
	MyValue = Int((9999999-1000000+1) * Rnd + 1000000)
	strDate=getMyDate
	h=hour(now)
	m=minute(now)
	s=second(now)
	if h<10 then h="0"&h
	if m<10 then m="0"&m
	if s<10 then s="0"&s
	getOrderId=strDate&h&m&s&MyValue
end function

'获取日期串如：20100604
function getMyDate()
	y=year(date)
	m=month(date)
	d=day(date)
	
	if m<10 then m="0"&m
	if d<10 then d="0"&d
	
	getMyDate=y&m&d
end function

function GetHttpPage(url)
	'on error resume next 
	dim http
	Set http = Server.CreateObject("WinHttp.WinHttpRequest.5.1")  
      http.Option(4) = 13056
      http.Option(6) = true
      http.SetTimeOuts 30000, 30000, 30000, -1
      http.Open "GET",url, False
      http.setRequestHeader "Content-Type", "application/x-www-form-urlencoded"
	  http.setRequestHeader "Connection", "Keep-Alive"
      http.setRequestHeader "Accept-Encoding", "gzip, deflate"
      http.setRequestHeader "Accept-Language", "zh-cn"
	  http.setrequestheader "User-Agent", ""&Request.ServerVariables("HTTP_USER_AGENT")&""
	  http.setRequestHeader "referer",""&request.servervariables("server_name")&Request.servervariables("url")&""
      http.Send
	If http.Status = 200 Then
	  GetHttpPage=bytes2BSTR(Http.responseText)
	else
	  GetHttpPage="网络错误"
	end if 
	set http=nothing
	response.Write GetHttpPage
end function

Function bytes2BSTR(vIn)
	Dim strreturn,i,thischarcode,nextcharcode
	strReturn = ""
	For i = 1 To LenB(vIn)
		ThisCharCode = AscB(MidB(vIn,i,1))
		IF ThisCharCode < &H80 THEN
			strReturn = strReturn & Chr(ThisCharCode)
		Else
			NextCharCode = AscB(MidB(vIn,i+1,1))
			strReturn = strReturn & Chr(CLng(ThisCharCode) * &H100 + CInt(NextCharCode))
			i = i + 1
		End If
	Next
	bytes2BSTR = strReturn
End Function
%>