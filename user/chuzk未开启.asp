<!--#include file="../conn.asp"-->
<!--#include file="../user/session.asp"-->
<%   if strUserName<>"" then
mz="<font color=red>"&strUserName&"</font>"
else
mz="�ο�"
end if
conn.execute("insert into sqdt(shijian,dz)values('"&now&"','["&mz&"] �鿴�˴��>> <a href=""/user/chuzk.asp?sid="&sid&""">�����ֵ</a>')") %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head> <br>  <title>��Ա����-VIP-<%=site("site_description")%></title>
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



<!-- ��ֵ����ϸ -->
<div class="clearfix">
 
                   	 <div class="minute">
			<ul>
            
            <li class='bgstyle'>��ֵ��¼��ѯ��<select name="select2" onChange="var jmpURL=this.options[this.selectedIndex].value ; if(jmpURL!='') {window.location=jmpURL;} else {this.selectedIndex=0 ;}" >
              <option value="" >ȫ������״̬</option>
            <option value="chuzk.asp?bl_czzt=1&sid=<%= sid %>" >�ɹ�����</option>
            <option value="chuzk.asp?bl_czzt=2&sid=<%= sid %>" >ʧ�ܶ���</option>
            <option value="chuzk.asp?bl_czzt=3&sid=<%= sid %>" >��������</option>
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
%>�����ţ�<%= rsc("bl_czorderid") %> <br/>
��ֵ���ţ�<%= rsc("bl_czkh") %><br/>
�������룺<%= rsc("bl_czmm") %> <br/>
��ֵ��<%= rsc("bl_czje") %> <br/>
��ֵʱ�䣺<%= rsc("bl_czsj") %><Br/>
<hr/>
  <%
rsc.movenext
Next
%></b></li> 
            <li>
	<!-- ��ҳ -->
	<div class="page bgstyle clearfix clear">
	  <ul>
      <%  
       if epage<=1 then%>
	   <li>
          <a href='#' class="fl page_up"> <��ҳ </a> 
         </li>

 <% Else %>
       <li>
          <a href='?page=<%= epage-1 %>&sid=<%= sid %>' class="fl page_up"> <��һҳ </a> 
         </li>
  <% End If %>
		<li><%=epage%>/<%=rsc.pagecount%></li>
<% if epage>=rsc.pagecount then%>
	<li> 
  <a href='#' class='fr pagenext'>  βҳ>  </a>        
     </li>        
 <% Else %>
	<li> 
  <a href='?page=<%= epage+1 %>&sid=<%= sid %>' class='fr pagenext'>  ��һҳ>  </a>        
     </li>   
   <% End If %>
<% End If %>

	  </ul>	
	</div></li>
<li class='bgstyle'>����δ����ֵ����<b class="red_b">����Ϊ1Ԫ=10����,1Ԫ=1�����!</b></li> 
                            <li ><form id="cardpay" >
	<input name="useridd" value="<%=  strUserID%>" type="hidden" />
	<table width="442" border="0" align="center" cellpadding="3" cellspacing="1">
  <tr>
    <td width="110" height="50" align="right" style="width:103px">ѡ�����ͣ�</td>
    <td width="221" height="50" style="width:227px"><select name="channelId">
    <option value="14">�ƶ���ֵ��</option>
    <option value="15">��ͨ��ֵ��</option>
    <option value="13">���ų�ֵ��</option>
    <option value="6">����һ��ͨ</option>
     <option value="8">�Ѻ�һ��ͨ</option>
    <option value="11">����һ��ͨ</option>
    <option value="16">����һ��ͨ</option>
    <option value="10">����һ��ͨ</option>
    <option value="9">��;һ��ͨ</option>
    <option value="7">����һ��ͨ</option>
    <option value="5">ʢ��һ��ͨ</option>
    <option value="17">���һ��ͨ</option>
      <option value="4">QQ�ҳ�ֵ��</option>

    </select></td>
    <td width="89" height="50" style="width:90px">&nbsp;<span class="red_b">*</span></td>
  </tr>
  <tr>
    <td height="50" align="right">�� ֵ��</td>
    <td height="50"><input type="text" name="faceValue" id="C_Amount" class="remove" onkeyup="this.value=this.value.replace(/[^\d]/g,'');"/></td>
    <td height="50">&nbsp;<span class="red_b">*</span></td>
  </tr>
  <tr>
    <td height="50" align="right">�� �ţ�</td>
    <td height="50"><input type="text" name="cardId" id="C_CardID" class="remove"/></td>
    <td height="50">&nbsp;<span class="red_b">*</span></td>
  </tr>
  <tr>
    <td height="50" align="right">�� �ܣ�</td>
    <td height="50"><input type="text" name="cardPass" id="C_CardPWD" class="remove"/></td>
    <td height="50">&nbsp;<span class="red_b">*</span></td>
  </tr>
  <tr>
    <td align="right">&nbsp;</td>
    <td><input name="submit" type="button" id="cardbtn" value="ȷ�ϳ�ֵ" /><span id="cardpayinfo"></span></td>
    <td></td>
  </tr>
</table>
</form></li> 
 			</ul>
			<div class="bgstyle minutetotal">
				  <strong>    ��ֵ����� <em><%=strmoney %></em>Ԫ</strong>
			</div>
	</div>
 </div>
<!-- ��ֵ����ϸ END -->

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
