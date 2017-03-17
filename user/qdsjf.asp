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

<link rel="stylesheet" href="common/plugin/jqtransform.css" type="text/css" media="all" />

<script src="common/js/common.js"></script>
<script type="text/javascript" src="common/plugin/jquery.jqtransform.js" ></script>
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
 	 <div class="bgstyle">签到送积分</div>
	 <div class="vipcard2">
     
			<ul>
           
           			 <li class="bgstyle vipmm">
                     <% timeInterval = DateDiff("d", qdsj, date) %>
                      <% If timeInterval=0 Then %>
  <b><font color=red>已经签到过了</font></b>
    <% Else %>
    <% if request("act")="qd" then'每日签到
set rs=Server.CreateObject("ADODB.Recordset")
  sql="select * from user where userid="&strUserID&""
  rs.open sql,conn,1,3
  rs("jifen")=rs("jifen")+10
  rs("lastlogin")=date
  rs.update
  rs.close
response.Redirect "qdsjf.asp?sid="&sid&"&msg=签到成功"
end if %>
    
             			   <form id="form1" name="form1" method="post" action="?act=qd&sid=<%= sid %>">
			     
			       <input type="submit" name="button" id="button" value="我要签到" />
		        
               </form>
			   <% End If %>
<%
			   msg=request.QueryString("msg") 
			   response.Write "<font color=blue>"&msg&"</font>"
			   %>
			 </li>
			 <li class="bgstyle">====签到记录==== </li>
             
			 <li class="bgstyle">  
             
             签到时间：<%= qdsj %>
             
             
             
              </li>
			 <li class="bgstyle vippr"> </li> 
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
