<!--#include file="../conn.asp"-->
<!--#include file="config.asp"-->
<!--#include file="md5.asp"-->
<%
Response.Addheader "Content-Type","text/html; charset=gb2312" 
'response.Write "true"
P_CardId=request("cardId")
P_CardPass=request("cardPass")
P_FaceValue=checkNumber(request("faceValue"))
P_ChannelId=checkNumber(request("channelId"))
P_Subject=request("FaceValue")
P_Price=P_FaceValue
P_Quantity=request("faceValue")
P_Notic=request("cardId")
P_Result_url=result_url
P_Notify_url=notify_url


P_OrderId=getOrderId()
preEncodeStr=UserIda&"|"&P_OrderId&"|"&P_CardId&"|"&P_CardPass&"|"&P_FaceValue&"|"&P_ChannelId&"|"&SalfStr

P_PostKey=md5(preEncodeStr)


params="P_UserId="&UserIda
params=params&"&P_OrderId="&P_OrderId
params=params&"&P_CardId="&P_CardId
params=params&"&P_CardPass="&P_CardPass
params=params&"&P_FaceValue="&P_FaceValue
params=params&"&P_ChannelId="&P_ChannelId
params=params&"&P_Subject="&P_Subject
params=params&"&P_Price="&P_Price
params=params&"&P_Quantity="&P_Quantity
params=params&"&P_Description="&P_Bankid
params=params&"&P_Notic="&P_Notic
params=params&"&P_Result_url="&P_Result_url
params=params&"&P_Notify_url="&P_Notify_url
params=params&"&P_PostKey="&P_PostKey

'商户可以在这里对订单进行入库保存

 set rsc=Server.CreateObject("ADODB.Recordset")
  sql="select * from dl_pay"
  rsc.open sql,conn,1,3
  rsc.addnew
  rsc("bl_czorderid")=P_OrderId
  rsc("bl_czlb")="在线充值"
  rsc("bl_czkh")=P_CardId
  rsc("bl_czmm")=P_CardPass
  rsc("bl_czsj")=now()
  rsc("bl_czzt")=3
   rsc("bl_czuser")= request("useridd")
   rsc("bl_czje")=P_FaceValue
  rsc.update
  rsc.close
'下面这句是提交到API
'response.Redirect  gateWary&"?"&params
response.Write getHTTPPage(gateWary&"?"&params)

response.Write "ok!"



function getOrderId()
	Randomize
	MyValue = Int((9910-100+1) * Rnd + 1100)
	strDate=getMyDate
	h=hour(now)
	m=minute(now)
	s=second(now)
	if h<10 then h="0"&h
	if m<10 then m="0"&m
	if s<10 then s="0"&s
	getOrderId=strDate&s&MyValue
end function

'获取日期串如：20100604
function getMyDate()
	y=year(date)
	m=month(date)
	d=day(date)
	
	if m<10 then m="0"&m
	if d<10 then d="0"&d
	
	getMyDate=y&m
end function

%>
