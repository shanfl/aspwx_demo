<!--#include file="md5.asp"-->
<!--#include file="config.asp"-->
<%
'***********����֧�� laka5.Com***********
UserId=request("P_UserId")
OrderId=request("P_OrderId")
CardId=request("P_CardId")
CardPass=request("P_CardPass")
FaceValue=formatnumber(request("P_FaceValue"),-1,true,false,false)
ChannelId=request("P_ChannelId")
subject=request("P_Subject")
price=request("P_Price")
quantity=request("P_Quantity")
notic=request("P_Notic")
ErrCode=request("P_ErrCode")
PostKey=request("P_PostKey")
payMoney=request("P_PayMoney")

preEncodeStr=UserId&"|"&OrderId&"|"&CardId&"|"&CardPass&"|"&FaceValue&"|"&ChannelId&"|"&SalfStr

encodeStr=md5(preEncodeStr)
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>����֧�����ҳ��</title>
<link rel="stylesheet" href="images/app_style.css"  type="text/css" />
</head>
<body>
<div id="wrap">
<table width="100%" height="34" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:20px">
  <tr>
    <td width="33%"><img src="images/logo-pay.jpg" /></td>
	<td width="68%" valign="bottom"><span class="logotxt">֧�����</span></td>
  </tr>
</table>

<table width="500" border="0" align="center" cellpadding="0" cellspacing="1" class="mytable">
  <tr>
    <td width="100%" height="88" bgcolor="#FFFFFF"><br />
	
      	<table width="500" border="0" align="center" cellpadding="1" cellspacing="1" class="table_main">
          <tr>
            <td height="25" align="right" class="STYLE1">�����ţ�</td>
            <td><span class="STYLE2"><%=request("P_OrderId")%></span></td>
          </tr>
          <tr>
            <td height="25" align="right" class="STYLE1">�ύ��</td>
            <td><span class="STYLE2"><%=request("P_FaceValue")%></span></td>
          </tr>
          <tr>
            <td height="25" align="right" class="STYLE1">ʵ�ʳ�ֵ��</td>
            <td><span class="STYLE2"><%=request("P_PayMoney")%></span></td>
          </tr>
          <tr>
            <td height="25" align="right" class="STYLE1">״̬��</td>
            <td height="25"><%if PostKey=encodeStr then
	if ErrCode="0" then'Ϊ0��ʾ֧���ɹ�
		'����Ϊ�ɹ���������ע�ⶩ�����ظ�����
		response.Write "֧���ɹ�"
	else
		'֧��ʧ��
		response.write "֧��ʧ��"
	end if
else
	response.write "���ݱ��۸�"
end if%></td>
          </tr>
      </table>
      <br /></td>
  </tr>
</table>
</div>
</body>
</html>
