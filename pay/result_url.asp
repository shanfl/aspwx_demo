<!--#include file="md5.asp"-->
<!--#include file="../conn.asp"-->
<!--#include file="config.asp"-->
<%
'***********拉卡支付 laka5.Com***********
UserId=request("P_UserId")
OrderId=request("P_OrderId")
CardId=request("P_CardId")
CardPass=request("P_CardPass")
FaceValue=request("P_FaceValue")'支付金额
ChannelId=request("P_ChannelId")
subject=request("P_Subject")
price=request("P_Price")'产品价格
quantity=request("P_Quantity")
notic=request("P_Notic")
ErrCode=request("P_ErrCode")
ErrMsg=request("P_ErrMsg")
PostKey=request("P_PostKey")
payMoney=request("P_PayMoney")'实际成功支付的金额

preEncodeStr=UserId&"|"&OrderId&"|"&CardId&"|"&CardPass&"|"&FaceValue&"|"&ChannelId&"|"&SalfStr

encodeStr=md5(preEncodeStr)

if PostKey=encodeStr then
	if ErrCode="0" then'支付成功
	response.write "ok"
		'设置为成功订单,注意订单的重复处理
		set rsc=Server.CreateObject("ADODB.Recordset")
  sql="select * from dl_pay where bl_czorderid='"&OrderId&"'"
  rsc.open sql,conn,1,3
  rsc("bl_czzt")=1
   rsc("bl_czje")=payMoney
  rsc.update
  rsc.close
	else
	Conn.Execute("update [dl_pay] set bl_czzt=2 where bl_czorderid='"&OrderId&"'")
		'支付失败
		response.write "-err"
	end if
else
Conn.Execute("update [dl_pay] set bl_czzt=4 where bl_czorderid='"&OrderId&"'")
	response.write "-数据被篡改"
end if
%>