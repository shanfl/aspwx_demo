
    <!--#include file="../conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head> <br>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 
<title>会员登陆-<%=site("site_description")%></title>
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



<!-- 会员积分卡 END -->


<!-- 短信验证 -->   

<!-- 短信验证end -->
<% If request("ac")="reg" Then %>
<!-- 注册页面 -->
<form id="form1" name="form1" method="post" action="regok.asp?sid=<%= sid %>"  onSubmit="return Validator.Validate(this,3)"   >
<div class="clearfix">
       <div class="bgstyle clearfix">
	      注册账号 <br />
 欢迎注册本系统账号! 请您按照如下要求填写：
	   </div>
		 <div class="bgstyle clear customer">
			<dl>
				<dt>用户名</dt>
				<dd>
					<input class="borderstyle radius5" type="text" name="user" value=""  dataType="Require"   msg="请输入注册用户名"   placeholder="登陆用户名" />
				</dd>
			</dl>
				<dl>
				<dt>手机号</dt>
				<dd>
					<input class="borderstyle radius5" type="text" name="sj" value=""  dataType="Require"   msg="请输入手机号码"   placeholder="手机号码" />
				</dd>
			</dl>
          			
			
			<dl>
				<dt>密 码</dt>
				<dd><input class="borderstyle radius5" type="password" name="psw"  dataType="Require"   msg="密码必须为六位以上。"  value="" placeholder="密码" /></dd>
			</dl>
            
           <dl>
				<dt>密  码</dt>
				<dd><input name="who" type="hidden" id="who" value="58" /> 
					<input class="borderstyle radius5" type="password" name="psw2" value=""  dataType="Repeat" to="psw" msg="两次输入的密码不一致"   placeholder="请再输入一次密码" />
				</dd>
			</dl> 
            
		  </div>
		 
		 <div class="bgstyle account login">
           <input type="submit" name="button" id="button" value="注册"  class="radius5 loginsub"/>
		
		 </div>
	</div> 
  
</div>
 </form>
<%else %>


 
<!-- 登陆页面 -->
<form id="form1" name="form1" method="post" action="lgok.asp"  onSubmit="return Validator.Validate(this,3)"   >
<div class="clearfix">
 <br>
 <div class="bgstyle clearfix">
       登陆窗口：<br />
请您填写以下信息进行登陆。<br />
          
	   </div>
		 <div class="bgstyle clear customer">
			<dl>
				<dt>用户名</dt>
				<dd>
					<input class="borderstyle radius5" type="text" name="user" value="" dataType="Require"  msg="请填写您的登录名"   placeholder="登陆用户名" />
				</dd>
			</dl>
			
			
			
			<dl>
				<dt>密 码</dt>
				<dd><input class="borderstyle radius5" type="password" name="psw" value="" dataType="Require"  msg="请填写您的密码"    placeholder="您的登陆密码" /></dd>
			</dl>
		  </div>
		 <!-- 我要订座 -->
		 <div class="bgstyle account login"> <input name="who" type="hidden" id="who" value="58" />
			<input class="radius5 loginsub" type="submit" name="button" value="登 陆" />
			<input class="radius5 register" type="button" name="zhuce" value="注 册"  onclick="document.location='?ac=reg'"   />
		 </div>
	</div> 
  

 </form>
 <% End If %>

 </div>
<!-- 登陆页面 END -->
 


<!-- footer -->
  
    <!--#include file="../foot.asp"-->
<!-- footer END -->
<script src="../js/RefreshCarCount.js" type="text/javascript"></script>

</div>


<!-- 右边隐藏的内容 -->
     <!--#include file="../right.asp"-->
<!-- 右边隐藏的内容 END -->
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
