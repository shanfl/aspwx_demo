<!--#include file="../conn.asp"-->

 <% 
	  set rs=conn.execute("select * from custom where id="&request.QueryString("id"))
	  %>
<%   if strUserName<>"" then
mz="<font color=red>"&strUserName&"</font>"
else
mz="游客"
end if
conn.execute("insert into sqdt(shijian,dz)values('"&now&"','["&mz&"] 浏览了关于我们>> <a href=""/user/about.asp?sid="&sid&""">关于我们</a>')") %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 
<title><%=rs("custom_name")%>-<%=site("site_description")%></title>
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




 
    
    
<!-- 关于我们 -->
<div class="clearfix">
       <div class="bgstyle clearfix merchant">
	       <div class="merchantlogo fl">
			 
              <img src="../images/images111.jpg" alt="商家logo"/><!-- 商户LOGO -->
            
		   </div>
			<h1><%=site("site_name")%></h1>
	   </div>
		 <div class="bgstyle clear merchantcon">
<%=rs("all_custom_content")%>
		
		
	</div> 
 <!-- 关于我们 END -->

<!-- 会员积分卡 END -->


<!-- 短信验证 -->   

<!-- 短信验证end -->



</div>

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
