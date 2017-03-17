<!--#include file="../conn.asp"-->
<!--#include file="../user/session.asp"-->
<%   if strUserName<>"" then
mz="<font color=red>"&strUserName&"</font>"
else
mz="游客"
end if
conn.execute("insert into sqdt(shijian,dz)values('"&now&"','["&mz&"] 查看了储蓄卡>> <a href=""/user/chuzk.asp?sid="&sid&""">储蓄卡充值</a>')") %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head> <br>  <title>会员中心-VIP-<%=site("site_description")%></title>
<meta name="keywords" content="<%=site("site_description")%>" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 
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



<!-- 储值卡明细 -->
<div class="clearfix">
 
                   	 <div class="minute">
			<ul>
            
            <li class='bgstyle'>充值记录查询：<select name="select2" onChange="var jmpURL=this.options[this.selectedIndex].value ; if(jmpURL!='') {window.location=jmpURL;} else {this.selectedIndex=0 ;}" >
              <option value="" >全部订单状态</option>
            <option value="chuzk.asp?bl_czzt=1&sid=<%= sid %>" >成功订单</option>
            <option value="chuzk.asp?bl_czzt=2&sid=<%= sid %>" >失败订单</option>
            <option value="chuzk.asp?bl_czzt=3&sid=<%= sid %>" >待处理订单</option>
              </select></li>
            <li ><%  
			bl_czzt=trim(request("bl_czzt"))
			
			set rsc=Server.CreateObject("ADODB.Recordset")
			select case bl_czzt
	  case "1"
	  sql="select * from dl_pay where bl_czzt=1 and bl_czuser="&strUserID&""
	  case "2"
	  sql="select * from dl_pay where bl_czzt=2 and bl_czuser="&strUserID&""
	  case "3"
	  sql="select * from dl_pay where bl_czzt=3 and bl_czuser="&strUserID&""
	end select
	if bl_czzt<>"" then
	 sql=sql&" order by bl_id desc"
  else
  sql="select * from dl_pay where bl_czuser="&strUserID&""
  end if
  rsc.open sql,conn,1,1
  if not rsc.eof then
  rsc.pagesize=2
if request("page")<>"" then
  epage=cint(request("page"))
   if epage<1 then epage=1
   if epage>rsc.pagecount then epage=rsc.pagecount
else
epage=1
end if
rsc.absolutepage=epage

For  i=0 to rsc.pagesize-1
if rsc.bof or rsc.eof then exit for
%>订单号：<%= rsc("bl_czorderid") %> <br/>
充值卡号：<%= rsc("bl_czkh") %><br/>
卡号密码：<%= rsc("bl_czmm") %> <br/>
充值金额：<%= rsc("bl_czje") %> <br/>
充值时间：<%= rsc("bl_czsj") %><Br/>
<hr/>
  <%
rsc.movenext
Next
%></b></li> 
            <li>
	<!-- 分页 -->
	<div class="page bgstyle clearfix clear">
	  <ul>
      <%  
       if epage<=1 then%>
	   <li>
          <a href='#' class="fl page_up"> <首页 </a> 
         </li>

 <% Else %>
       <li>
          <a href='?page=<%= epage-1 %>&sid=<%= sid %>' class="fl page_up"> <上一页 </a> 
         </li>
  <% End If %>
		<li><%=epage%>/<%=rsc.pagecount%></li>
<% if epage>=rsc.pagecount then%>
	<li> 
  <a href='#' class='fr pagenext'>  尾页>  </a>        
     </li>        
 <% Else %>
	<li> 
  <a href='?page=<%= epage+1 %>&sid=<%= sid %>' class='fr pagenext'>  下一页>  </a>        
     </li>   
   <% End If %>
<% End If %>

	  </ul>	
	</div></li>
<li class='bgstyle'>您还未购买储值卡。<b class="red_b">比例为1元=10积分,1元=1储蓄金!</b></li> 
                            <li ><form id="cardpay" >
	<input name="useridd" value="<%=  strUserID%>" type="hidden" />
	<table width="442" border="0" align="center" cellpadding="3" cellspacing="1">
  <tr>
    <td width="110" height="50" align="right" style="width:103px">选择卡类型：</td>
    <td width="221" height="50" style="width:227px"><select name="channelId">
    <option value="14">移动充值卡</option>
    <option value="15">联通充值卡</option>
    <option value="13">电信充值卡</option>
    <option value="6">骏网一卡通</option>
     <option value="8">搜狐一卡通</option>
    <option value="11">网易一卡通</option>
    <option value="16">纵游一卡通</option>
    <option value="10">久游一卡通</option>
    <option value="9">征途一卡通</option>
    <option value="7">完美一卡通</option>
    <option value="5">盛大一卡通</option>
    <option value="17">天宏一卡通</option>
      <option value="4">QQ币充值卡</option>

    </select></td>
    <td width="89" height="50" style="width:90px">&nbsp;<span class="red_b">*</span></td>
  </tr>
  <tr>
    <td height="50" align="right">面 值：</td>
    <td height="50"><input type="text" name="faceValue" id="C_Amount" class="remove" onkeyup="this.value=this.value.replace(/[^\d]/g,'');"/></td>
    <td height="50">&nbsp;<span class="red_b">*</span></td>
  </tr>
  <tr>
    <td height="50" align="right">卡 号：</td>
    <td height="50"><input type="text" name="cardId" id="C_CardID" class="remove"/></td>
    <td height="50">&nbsp;<span class="red_b">*</span></td>
  </tr>
  <tr>
    <td height="50" align="right">卡 密：</td>
    <td height="50"><input type="text" name="cardPass" id="C_CardPWD" class="remove"/></td>
    <td height="50">&nbsp;<span class="red_b">*</span></td>
  </tr>
  <tr>
    <td align="right">&nbsp;</td>
    <td><input name="submit" type="button" id="cardbtn" value="确认充值" /><span id="cardpayinfo"></span></td>
    <td></td>
  </tr>
</table>
</form></li> 
 			</ul>
			<div class="bgstyle minutetotal">
				  <strong>    储值卡余额 <em><%=strmoney %></em>元</strong>
			</div>
	</div>
 </div>
<!-- 储值卡明细 END -->

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
