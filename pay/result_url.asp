<!--#include file="md5.asp"-->
<!--#include file="../conn.asp"-->
<!--#include file="config.asp"-->
<%
'***********����֧�� laka5.Com***********
UserId=request("P_UserId")
OrderId=request("P_OrderId")
CardId=request("P_CardId")
CardPass=request("P_CardPass")
FaceValue=request("P_FaceValue")'֧�����
ChannelId=request("P_ChannelId")
subject=request("P_Subject")
price=request("P_Price")'��Ʒ�۸�
quantity=request("P_Quantity")
notic=request("P_Notic")
ErrCode=request("P_ErrCode")
ErrMsg=request("P_ErrMsg")
PostKey=request("P_PostKey")
payMoney=request("P_PayMoney")'ʵ�ʳɹ�֧���Ľ��

preEncodeStr=UserId&"|"&OrderId&"|"&CardId&"|"&CardPass&"|"&FaceValue&"|"&ChannelId&"|"&SalfStr

encodeStr=md5(preEncodeStr)

if PostKey=encodeStr then
	if ErrCode="0" then'֧���ɹ�
	response.write "ok"
		'����Ϊ�ɹ�����,ע�ⶩ�����ظ�����
		set rsc=Server.CreateObject("ADODB.Recordset")
  sql="select * from dl_pay where bl_czorderid='"&OrderId&"'"
  rsc.open sql,conn,1,3
  rsc("bl_czzt")=1
   rsc("bl_czje")=payMoney
  rsc.update
  rsc.close
	else
	Conn.Execute("update [dl_pay] set bl_czzt=2 where bl_czorderid='"&OrderId&"'")
		'֧��ʧ��
		response.write "-err"
	end if
else
Conn.Execute("update [dl_pay] set bl_czzt=4 where bl_czorderid='"&OrderId&"'")
	response.write "-���ݱ��۸�"
end if
%>