<!--#include file="../conn.asp"-->

<%   if strUserName<>"" then
mz="<font color=red>"&strUserName&"</font>"
else
mz="�ο�"
end if
conn.execute("insert into sqdt(shijian,dz)values('"&now&"','["&mz&"] �鿴���ҵĶ���>> <a href=""/myorder/index.asp?sid="&sid&""">��ѯ���Ѽ�¼</a>')") %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 
<title>��Ա����-�������<%=site("site_description")%></title>
<meta name="keywords" content="<%=site("site_description")%>" />
<meta name="description" content="<%=site("site_description")%>" />
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />  
<meta content="yes" name="apple-mobile-web-app-capable" />  
<meta content="black" name="apple-mobile-web-app-status-bar-style" />  
<meta content="telephone=no" name="format-detection" />

<script src="../js/jquery.1.8.0.min.js" type="text/javascript"></script>
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

<!-- ���Ѽ�¼ -->
<div class="clearfix">
	   
		 <div class="Recordweb">
			<ul>
<div class="dingzuo">    
                     <%
						ip=GetIP()
Set rsp = server.CreateObject("adodb.recordset")
if strUserID<>"" then
 sql="select * from [orders] where ip='"&ip&"' and userid="&struserid&" order by username desc"

else
 sql="select * from [orders] where ip='"&ip&"' and sessionid='"&session.SessionID&"' order by username desc"
 end if
rsp.Open sql, conn, 1, 1
'response.Write sql
    if not rsp.eof then
rsp.pagesize=5
if request("page")<>"" then
  epage=cint(request("page"))
   if epage<1 then epage=1
   if epage>rsp.pagecount then epage=rsp.pagecount
else
epage=1
end if
rsp.absolutepage=epage

For  i=0 to rsp.pagesize-1
if rsp.bof or rsp.eof then exit for
Set Rsa=Conn.Execute("select title,gsmt,lxdh,tzed from [products] where id="&rsp("bookid")&"")
%> 
				<li class="bgstyle Record p_re">
					<div class="clearfix">
					  <div class="fl">
                      <em><font>�������룺</font><%= rsp("username") %></em>
						<em><font>����ʱ�䣺</font><%= rsp("actiondate") %></em>
                        <% If rsp("shjiaid")=1  Then %>
                        <em class="red_b"><font>���ѻ��֣�</font>�� <%= rsa("tzed")%> </em>
                         <% elseIf vip=1  Then %>
                         <em class="red_b"><font>���ѻ��֣�</font>�� <%= rsa("tzed")%> </em>
                        <em>   <font>���ػ��֣�</font><%= rsa("lxdh")%></em>
                        <% Else %>

						<em><font>���ѽ�</font>�� <%= rsa("gsmt")*rsp("bookcount")%> </em>
						<em>   <font>��û��֣�</font><%= rsa("lxdh")*rsp("bookcount")%></em>
                        <% End If %>

					  </div>	
					  <div class="Recordpic"> 
					    <%
								 
		  select case rsp("zhuangtai")
	case "0"
	Response.Write "<div style=""color:#cccccc"">��ȡ��</div>"
	case "1"
	response.write "<div style=""color:#0C6"">��ǩ��</div>"
	case "2"
	response.write "<div style=""color:#CC3366"">������</div>"
	case "6"
	response.write "<div style=""color:#ccceee"">δ����</div>"
	end select%>							
					 <br/>
</div>
					</div>
					<div class="Recordname">
		<a href="../show/index.asp?id=<%= rsp("bookid")%>&sid=<%= sid %>">��Ʒ��<%= rsa("title")%></a>����: <%= rsa("gsmt")%>Ԫ &nbsp;&nbsp; ����: <%= rsp("bookcount") %><br>
					</div>
				</li>
                                          <%
rsp.movenext
Next
end if
%>
                </div>
  			 
			</ul>
		 </div>
		 <!-- ��ҳ -->
	<div class="page bgstyle clearfix clear">
	  <ul>
      <%  
       if epage<=1 then%>
	   <li>
          <a href='#' class="fl page_up"> <�ѵ���ҳ </a> 
         </li>

 <% Else %>
       <li>
          <a href='?page=<%= epage-1 %>&sid=<%= sid %>' class="fl page_up"> <��һҳ </a> 
         </li>
  <% End If %>
		<li>��<%=epage%>ҳ/��<%=rsp.pagecount%>ҳ </li>
<% if epage>=rsp.pagecount then%>
	<li> 
  <a href='#' class='fr pagenext'>  �ѵ�βҳ>  </a>        
     </li>        
 <% Else %>
	<li> 
  <a href='?page=<%= epage+1 %>&sid=<%= sid %>' class='fr pagenext'>  ��һҳ>  </a>        
     </li>   
   <% End If %>

	  </ul>	
	</div>
	<!-- ��ҳ END -->
		
	</div> 
  

<!-- ��Ա���� END -->







<!-- footer -->
   
    <!--#include file="../foot.asp"-->
 
<!-- footer END -->

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
