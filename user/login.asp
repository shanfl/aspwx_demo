
    <!--#include file="../conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head> <br>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 
<title>��Ա��½-<%=site("site_description")%></title>
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



<!-- ��Ա���ֿ� END -->


<!-- ������֤ -->   

<!-- ������֤end -->
<% If request("ac")="reg" Then %>
<!-- ע��ҳ�� -->
<form id="form1" name="form1" method="post" action="regok.asp?sid=<%= sid %>"  onSubmit="return Validator.Validate(this,3)"   >
<div class="clearfix">
       <div class="bgstyle clearfix">
	      ע���˺� <br />
 ��ӭע�᱾ϵͳ�˺�! ������������Ҫ����д��
	   </div>
		 <div class="bgstyle clear customer">
			<dl>
				<dt>�û���</dt>
				<dd>
					<input class="borderstyle radius5" type="text" name="user" value=""  dataType="Require"   msg="������ע���û���"   placeholder="��½�û���" />
				</dd>
			</dl>
				<dl>
				<dt>�ֻ���</dt>
				<dd>
					<input class="borderstyle radius5" type="text" name="sj" value=""  dataType="Require"   msg="�������ֻ�����"   placeholder="�ֻ�����" />
				</dd>
			</dl>
          			
			
			<dl>
				<dt>�� ��</dt>
				<dd><input class="borderstyle radius5" type="password" name="psw"  dataType="Require"   msg="�������Ϊ��λ���ϡ�"  value="" placeholder="����" /></dd>
			</dl>
            
           <dl>
				<dt>��  ��</dt>
				<dd><input name="who" type="hidden" id="who" value="58" /> 
					<input class="borderstyle radius5" type="password" name="psw2" value=""  dataType="Repeat" to="psw" msg="������������벻һ��"   placeholder="��������һ������" />
				</dd>
			</dl> 
            
		  </div>
		 
		 <div class="bgstyle account login">
           <input type="submit" name="button" id="button" value="ע��"  class="radius5 loginsub"/>
		
		 </div>
	</div> 
  
</div>
 </form>
<%else %>


 
<!-- ��½ҳ�� -->
<form id="form1" name="form1" method="post" action="lgok.asp"  onSubmit="return Validator.Validate(this,3)"   >
<div class="clearfix">
 <br>
 <div class="bgstyle clearfix">
       ��½���ڣ�<br />
������д������Ϣ���е�½��<br />
          
	   </div>
		 <div class="bgstyle clear customer">
			<dl>
				<dt>�û���</dt>
				<dd>
					<input class="borderstyle radius5" type="text" name="user" value="" dataType="Require"  msg="����д���ĵ�¼��"   placeholder="��½�û���" />
				</dd>
			</dl>
			
			
			
			<dl>
				<dt>�� ��</dt>
				<dd><input class="borderstyle radius5" type="password" name="psw" value="" dataType="Require"  msg="����д��������"    placeholder="���ĵ�½����" /></dd>
			</dl>
		  </div>
		 <!-- ��Ҫ���� -->
		 <div class="bgstyle account login"> <input name="who" type="hidden" id="who" value="58" />
			<input class="radius5 loginsub" type="submit" name="button" value="�� ½" />
			<input class="radius5 register" type="button" name="zhuce" value="ע ��"  onclick="document.location='?ac=reg'"   />
		 </div>
	</div> 
  

 </form>
 <% End If %>

 </div>
<!-- ��½ҳ�� END -->
 


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
