<%
'***********����֧�� laka5.Com***********
function requesturl(id)'��ȡURL
url=lcase(request.ServerVariables("url"))
insturl=InstrRev(""&url&"","/")
ggurl=left(""&url&"",""&insturl&"")
ggurl=replace(ggurl,"pay/","")'����֧���ļ������������޸Ĺ�����֧�����ļ���������Ҳ��Ҫ�޸�Ϊ��Ӧ��
ggurl=replace(ggurl,"wangyin/","")'����֧���ļ������������޸Ĺ��������ļ���������Ҳ��Ҫ�޸�Ϊ��Ӧ��
geturl1=""&ggurl&""
geturl2="http://"&request.servervariables("server_name")&""&ggurl&""
if id=1 then
requesturl=geturl1
elseif id=2 then
requesturl=geturl2
end if
end function

'�ӿ���Կ����Ҫ���������Լ�����Կ��Ҫ����̨���õ�һ��
'��¼APIƽ̨���̻�����-->���뷽ʽ-->API���룬����鿴�Լ�����Կ��ID
UserIda="5102"'ƽ̨�̻�ID����Ҫ�������Լ����̻�ID
SalfStr="JLdyT1E1hH2YAuNB23T3AipypB"'�̻���Կ

'���ص�ַ
gateWary="http://api.la-ka.com/"

'��ֵ�����̨֪ͨ��ַ��ע���ļ�·��
result_url="http://"&request.ServerVariables("HTTP_HOST")&"/pay/result_url.asp"

'��ֵ�������û����ص���վ�ϵĵ�ַ��ע���ļ�·��
notify_url=""&requesturl(1)&"notify_Url.asp"

function checkNumber(n)
if IsNumeric(n) and not IsEmpty(n) Then
checkNumber=n
else
Response.write"<script>alert(""��Ϣ��������"");;history.back(1);</script>"
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

'��ȡ���ڴ��磺20100604
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
	  GetHttpPage="�������"
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