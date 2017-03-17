<!--#include file="../conn.asp"-->
<!--#include file="../user/session.asp"-->
<%   if strUserName<>"" then
mz="<font color=red>"&strUserName&"</font>"
else
mz="游客"
end if
conn.execute("insert into sqdt(shijian,dz)values('"&now&"','["&mz&"] 查看了会员卡>> <a href=""/user/vipcard.asp?sid="&sid&""">会员卡</a>')") %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head> 
 <title>会员中心-VIP-<%=site("site_description")%></title>
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


<!-- 会员积分卡 -->
<div class="clearfix">
 	 <div class="bgstyle">
	  <div class="vipcard">
			<div class="vipcard1">
				<div class="vipname">微信点餐VIP会员卡</div>
				<div class="viptype"></div>
				<div class="vip123">NO：<%= strvip %></div>
			</div>
		</div>
	 </div>
	 <div class="vipcard2">
			<ul>
			 <li class="bgstyle vipmm"></li>
			 <li class="bgstyle">  </li>
			 <li class="bgstyle">   </li>
			 <li class="bgstyle vippr">
			  会员卡使用注意事项：<br/>
				 <p>1、会员凭此卡享受消费积分。</p>
				  <p>2、积分可用于兑换本店礼品及冲抵消费之用。</p>
				 <p>3、本卡仅限本人使用，不得转借他人。 </p>
                  <p>4、此会员卡由管理员发放。 </p>
				 <p>5、使用本卡时需向服务员出示此卡。 </p>
				</li> 
			</ul>
		</div>
 </div>

<!-- 会员积分卡 END -->


<!-- 短信验证 -->   

<!-- 短信验证end -->





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
