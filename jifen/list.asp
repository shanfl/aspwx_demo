<!--#include file="../conn.asp"-->
<!--#include file="../user/session.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 
<title><%=site("site_name")%>-<%=site("site_description")%></title>
<meta name="keywords" content="<%=site("site_description")%>" />
<meta name="description" content="<%=site("site_description")%>" />
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />  
<meta content="yes" name="apple-mobile-web-app-capable" />  
<meta content="black" name="apple-mobile-web-app-status-bar-style" />  
<meta content="telephone=no" name="format-detection" />
<script type="text/javascript" src="../js/jquery.js"></script>

<script  type="text/javascript" src="../js/jquery.1.8.0.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>      
<script type="text/javascript" src="../js/js.js"></script> 
<link href="../css/common.css" rel="stylesheet" type="text/css" />
<link href="../css/other.css" rel="stylesheet" type="text/css" />
 </head>
<body>
<div class="stopsub">
 
</div>
<img class="stop5" src="../img/stop_2_3.png"/>
<script>
	$(function(){

		$(".stop4,.stopsub").click(function(){
			$(".stopsub,.stop5").css("display","none");//点击隐藏
			$.cookie("litype_cookie","none",{expires:10000});//设置cookie
		});
		
		if($.cookie("litype_cookie")){  //如果cookie存在
		$(".stopsub,.stop5").css("display",$.cookie("litype_cookie")); //设置div的样式为cookie的值
		}else{
			$(".stopsub").load('../inc/litypelf.html');
		};
		
		if( $('.screen').is(':visible')  ){
			$('.screen').css({
				marginTop:'60px'
			});
		}else{
		  $('.listgoods').css({
				marginTop:'60px'
			});
		};
		
	});
</script>

<!-- 提示步骤 END -->

 <div class="moveleft">
 <div class="mlwarp">
	<i class="mlgomr"></i>
 </div>
 
<!-- header -->
   
 <div id="header">
  
     <!--#include file="../naver.asp"-->
  
 </div>
 

 
<!-- header END -->
<div class="clearfix">
    <!-- 一级分类 -->
   
  <div class="litypelf hotswiper">
	<ul style="padding-left: 0px; padding-right: 0px; width: 616px; height: 30px;" class="swiper-wrapper">
                       
                                         <%
Set rse = server.CreateObject("adodb.recordset")
sql = "select * from products_category_main"
rse.Open sql, conn, 1, 3
Do While Not rse.EOF
%>
  <LI class="swiper-slide swiper-slide-visible swiper-slide-active"> <a class="bgstyle" href="/jifen/list.asp?flid=<%=rse("main_id")%>&sid=<%= sid %>"> <%=rse("main_title")%> </A>  </LI>

	        <%
rse.movenext
Loop
rse.Close
Set rse = Nothing
%>
	
   
         
 	</ul>
   </div>
   
   <script src="../js/idangerous.js" type="text/javascript"></script>
<script>

  var mySwiper = new Swiper('.hotswiper',{
	paginationClickable: true,
    slidesPerView: 'auto'
  });
  </script>
   <!-- 新微云一级分类END -->
   
   
    
    <!-- 筛选 二级分类 -->

 	
   </div>
  
            <div class="listgoods">
        
                        <%
 if strUserName<>"" then
mz="<font color=red>"&strUserName&"</font>"
else
mz="游客"
end if
conn.execute("insert into sqdt(shijian,dz)values('"&now&"','["&mz&"] 正在积分兑换>> <a href=""/jifen/list.asp?sid="&sid&""">用积分购买</a>')")

						flid=request("flid")
Set rsp = server.CreateObject("adodb.recordset")
if flid<>"" then
sql = "select * from products where main_id="&flid&" and ssqy='1' and jfgmid=1 order by id desc"
else
sql = "select * from products where ssqy='1' and jfgmid=1 order by id desc"
end if
rsp.Open sql, conn, 1, 1
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
%>     
		<dl class="bgstyle"> 
         		  
     
          <dt>  <img src="/<%= rsp("uploadfile") %>" alt=""/>  </dt>
         <dd>
          
		  
		       <strong><%=rsp("title")%></strong>
			   <div class="listgoodsinfo">
					<span class="pr"> 需要:<font><%=rsp("tzed")%> 积分税换</font> </span></div>
              
			   <div class="clearfix">
				   <span class="lgadd fr">
                    
                   <button type=button class='lgminuss'  onclick="javascript:window.location.href='jforder.asp?sid=<%= sid %>&cpid=<%=rsp("id")%>'"> 我要兑换</button>
                   
 				   </span>
 			   </div>
		   </dd>
           
		</dl>
                            <%
rsp.movenext
Next
end if
%>

 		 
	</div>	


	
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
		<li><%=epage%>/<%=rsp.pagecount%> </li>
<% if epage>=rsp.pagecount then%>
	<li> 
  <a href='#' class='fr pagenext'>  尾页>  </a>        
     </li>        
 <% Else %>
	<li> 
  <a href='?page=<%= epage+1 %>&sid=<%= sid %>' class='fr pagenext'>  下一页>  </a>        
     </li>   
   <% End If %>

	  </ul>	
	</div>
	<!-- 分页 END -->
    <% rsp.Close
Set rsp = Nothing %>
    
</div>
<!-- 商品列表页 END -->


  




<!-- footer -->
	 
 <!--#include file="../foot.asp"-->
 
<!-- footer END -->

</div>


<!-- 右边隐藏的内容 -->
<div class="moveright">
	<div class="mrwarp">
		<div class=""><strong>栏目分类</strong></div>
		<div class="mrtype">
			<ul>
            
                  <%
Set rsc = server.CreateObject("adodb.recordset")
sql = "select * from products_category_main"
rsc.Open sql, conn, 1, 3
Do While Not rsc.EOF
%>
  <LI> <a href="/jifen/list.asp?flid=<%=rsc("main_id")%>&sid=<%= sid %>"> <%=rsc("main_title")%> </A>  </LI>

	        <%
rsc.movenext
Loop
rsc.Close
Set rsc = Nothing
%>
				 
 	
				
			</ul>
		</div>
	</div>
</div>
 
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
