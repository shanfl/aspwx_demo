<!--#include file="../conn.asp"-->
<!--#include file="session.asp"-->
<%   if strUserName<>"" then
mz="<font color=red>"&strUserName&"</font>"
else
mz="�ο�"
end if
conn.execute("insert into sqdt(shijian,dz)values('"&now&"','["&mz&"] �鿴�˸�������>> <a href=""/user/loguser.asp?sid="&sid&""">��������</a>')") %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head> 
<title>��Ա����-<%=site("site_description")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 
<meta name="keywords" content="<%=site("site_description")%>" />
<meta name="description" content="<%=site("site_description")%>" />
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />  
<meta content="yes" name="apple-mobile-web-app-capable" />  
<meta content="black" name="apple-mobile-web-app-status-bar-style" />  
<meta content="telephone=no" name="format-detection" />
<SCRIPT language=JavaScript src="../js/vali_form.js" type=text/JavaScript></SCRIPT>
 <script src="../js/jquery.1.8.0.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>  
<script src="../js/js.js" type="text/javascript"></script>
<link href="../css/common.css" rel="stylesheet" type="text/css" />
<link href="../css/other.css" rel="stylesheet" type="text/css" />
<link href="../css/user.css" rel="stylesheet" type="text/css" />
 </head>
<body>

<div class="moveleft">
 <div class="mlwarp">
	<i class="mlgomr"></i>
 </div>
 <!-- header -->
   
 <div id="header">
  
     <!--#include file="../naver.asp"-->
  
 </div>
 

 
<!-- header END -->
<% Set rsa = Server.CreateObject("ADODB.RecordSet")
    sql = "select * from user where userid="&strUserID
	rsa.Open sql, conn, 1, 1 %>


<!-- ��Ա���� -->
 <form id="form1" name="form1" method="post" action="change.asp?sid=<%= sid %>"  onSubmit="return Validator.Validate(this,3)"   >
<div class="clearfix">
         
	   <div class="bgstyle" style="font-size:12px;">
		<p><strong>�벹�����ĸ�����Ϣ:</strong> </p>
<p>�����Ѿ������ĸ���΢�ź��뱾ϵͳ��Ա�Ű󶨣���ֻ��Ҫ�����������¸�����Ϣ���Ϳ������������������µ��������� </p>
	   </div>
		 <div class="bgstyle clear customer">
			<dl>
				<dt>��Ա��</dt>
				<dd>
					<input name="xm" type="text" disabled="disabled" class="borderstyle radius5" value="<%= rsa("UserName") %>" maxlength="10"     placeholder="�벹����������/�ƺ�"/>
				</dd>
			</dl>
            <dl>
				<dt>��½���� </dt>
				<dd>
					<input name="pass" type="text" class="borderstyle radius5" value="" maxlength="20"   placeholder="���޸������������" />
				</dd>
			</dl>
			<dl>
			<dl>
				<dt>�绰 </dt>
				<dd>
					<input name="tel" type="text" class="borderstyle radius5" value="<%= rsa("usertel") %>" maxlength="20"   placeholder="�����ﲹ��������ϵ�绰" />
				</dd>
			</dl>
			<dl>
            	<dl>
				<dt>���� </dt>
				<dd>
					<input name="email" type="text" class="borderstyle radius5" value="<%= rsa("UserEmail") %>" maxlength="20"   placeholder="�����ﲹ�����������ַ" />
				</dd>
			</dl>
			<dl>
				<dt>��ַ </dt>
				<dd>
					<input name="dz" type="text" class="borderstyle radius5"  value="<%= rsa("useradder") %>" maxlength="50"   placeholder="�����ﲹ�����ĵ�ַ" />
				</dd>
			</dl>
		 </div>
		 <!-- ��Ҫ���� -->
		 <div class="bgstyle account"> <input name="who" type="hidden" id="who" value="58" />
         <input type="submit" name="button" id="button" value="�޸���Ϣ"   class="radius5" />
		 
		 </div>
	</div> 
</form>   
<% rsa.Close
    Set rsa = Nothing %> 
 <!-- ��Ա���� END -->

<!-- ��Ա���ֿ� END -->


<!-- ������֤ -->   

<!-- ������֤end -->





<!-- footer -->
  
 <!--#include file="../foot.asp"-->
 
<!-- footer END -->
<script src="../js/RefreshCarCount.js" type="text/javascript"></script>

</div>


<!-- �ұ����ص����� -->
     <!--#include file="../right.asp"-->
 
<!-- �ұ����ص����� END -->
<script type="text/javascript">


 document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
WeixinJSBridge.call('hideOptionMenu');
});

document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
WeixinJSBridge.call('hideToolbar');
});
    </script>
</body>
</html>
