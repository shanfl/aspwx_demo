<!--#include file="../conn.asp"-->
<!--#include file="session.asp"-->
<%   if strUserName<>"" then
mz="<font color=red>"&strUserName&"</font>"
else
mz="�ο�"
end if
conn.execute("insert into sqdt(shijian,dz)values('"&now&"','["&mz&"] �����˻�Ա����>> <a href=""/user/index.asp?sid="&sid&""">��Ա����</a>')") %>
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


<!-- �û����� ��Ա���� -->

<div class="clearfix">
 <div class="bgstyle clearfix merchant">
	       <div class="merchantlogo fl">
          
              <img src="../images/images111.jpg" alt="�̼�logo"/><!-- �̻�LOGO -->
             
		   </div>
			<div class="userinfo">
				<strong> <% If strUserName="" Then %>�ο�:<%=session.SessionID %><% Else %>��ӭ����<%= strUserName %><% End If %></strong>
				<span>
					<em><font>���֣�</font><%= strjf %> �� </em>
					<em><font>��ֵ����</font><%= strmoney %>Ԫ</em>
				</span>
			</div>
	   </div>
		 <div class="clear userli">
			<ul>
				<li class="bgstyle"><a href="loguser.asp?sid=<%= sid %>"> ��������</a></li>
 				<li class="bgstyle"><a href="/myorder/?sid=<%= sid %>">���Ѽ�¼</a></li>
			 	<li class="bgstyle"><a href="/user/qdsjf.asp?sid=<%= sid %>">ÿ��ǩ��</a></li>
                          <li class="bgstyle" ><a href="../user/vipcard.asp?sid=<%= sid %>">��Ա��</a></li>
                          <li class="bgstyle"  ><a  href="../jifen/list.asp?sid=<%= sid %>">���ֶһ�</a></li>

                
                        
				<li class="bgstyle">  <a href="../user/out.asp?sid=<%= sid %>">�˳���½</a></li>
                  
			</ul>
		 </div>
		
	</div> 
<!-- �û����� END -->

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
