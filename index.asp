<!--#include file="conn.asp"-->
<%wx=request("wx")
session("user")="wx"%>
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
<script src="js/jquery.1.8.0.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>      
<script src="js/js.js" type="text/javascript"></script>
<link href="css/common.css" rel="stylesheet" type="text/css" />

</head>
<body>
<div class="moveleft">
 <div class="mlwarp">
	<i class="mlgomr"></i>
 </div>
 <!-- header -->
	
 <div id="header">
  
    <!--#include file="naver.asp"-->
  
 </div>
 

 
<!-- header END -->
<!-- banner -->
<div class="bgstyle banner">
   <div class="swiper-container bannerswiper">
      <div class="swiper-wrapper">
          <%
Set rs = server.CreateObject("adodb.recordset")
sql = "select * from banner order by banner_order"
rs.Open sql, conn, 1, 1
Do While Not rs.EOF
%>
        <div class="swiper-slide bawarp"> <img  src='<%=rs("uploadfile")%>' alt='<%=rs("banner_name")%>' /></div> 
            <%
rs.movenext
Loop
rs.Close
Set rs = Nothing
%> 
      
      </div>
	  <div class="pagination"></div>
    </div>
</div>
<!-- banner END -->



<link href="css/dsj.css" rel="stylesheet" type="text/css" />
<div class="clearfix moreshop martop15">

             
	              
   
             
	              
	              
   
             <div class="bgstyle clearfix merchant" >
	                <a href="index.asp?wxa76_" > 
	              <div class="merchantlogo fl">
			           
                          <img src="images/images111.jpg" alt="�̼�logo"/><!-- �̻�LOGO -->
                           
		          </div>
			 <div class="userinfo">
				    <strong>����ȯԤ���㵥ƽ̨</strong>
			   	  <span>
					<em><font>Ӫҵʱ�䣺</font>8:00-23:00</em>
				
				 </span>
			 </div>
		 </a>	
	   </div>
	              
            
</div>    
 
 
 
 
 
<!-- ��Ŀ -->
<div class="bgstyle indexsub">
	 <ul>
     
		<li class="s1 bg1"><a href="show/list.asp">
			<div class="subtype">
				<em> ��Ҫ���� </em>
				<span>��������Ʒ</span>
				<s></s>
			</div></a>
		</li>
        
           
		<li class="s2 bg2" style="display:none"><a href="myorder/">
		   <div class="subtype">
			   <em>���Ѽ�¼</em>
				<span>��ϸ����</span>
				<s></s>
		   </div></a>
		</li>
    
 
		<li class="s3 bg3"><a href="myorder/"> 
		    <div class="subtype">
				<em>�ҵĶ���</em>
				<span>��������</span>
				<s></s>
			</div></a>
		</li>
        
          
		<li class="s4 bg4"><a href="http://wapmap.baidu.com/"> 
		     <div class="subtype">
				<em>��ͼָ��</em>
				<span>�ٶȵ�ͼ</span>
				<s></s>
			</div></a>
		</li>
   
     
		<li class="s2 bg5" style="display:none"><a href="show/lyb.asp"> 
			<div class="subtype">
				<em>�������</em>
				<span>����̸̸</span>
				<s></s>
			</div></a>
		</li>
		<li class="s3 bg6"><a href="user/about.asp?id=1"> 
		   <div class="subtype">
			   <em>��������</em>
				<span>��������</span>
				<s></s>
		   </div></a>
		</li>
	 </ul>
</div>
<!-- ��Ŀ END -->



<!-- ������Ʒ -->
<div class="indexhot">
	 <div class="titlestyle">
		<strong>�Ƽ���Ʒ</strong><span class="fr" style="color:#666;font-weight:normal;">�����������߻�����</span>
	 </div>
 
	 <div class="indexgoodslist clearfix">
	 
	 
	    <div class="hotswiper">
			
			 <ul class="swiper-wrapper"> 
                  <%
Set rs = server.CreateObject("adodb.recordset")
sql = "select * from products where recommendatory=1 and ssqy='1' order by id desc"
rs.Open sql, conn, 1, 1
Do While Not rs.EOF
%>
              <li class="swiper-slide bgstyle">
					 <a href="show/?id=<%=rs("id")%>"> 
					<span class="pic"><img src="<%= rs("uploadfile") %>" alt="����鿴����"  height="80px" width="100px"/></span>
					<span class="name"><%=rs("title")%></span>
                    <span class="name"><em>���ۣ�</em><font color="#00CC33"><%=rs("gsmt")%></font>Ԫ</span>
					</a>
				</li>  
                  
                       <%
rs.movenext
Loop
rs.Close
Set rs = Nothing
%>
             
                  
             
                 
 
			 </ul>
			
       </div>	
	 </div>
</div>
<!-- ������Ʒ END -->



<!-- footer -->
	 
  <!--#include file="foot.asp"-->
 
 <!-- footer END -->

</div>


<!-- �ұ����ص����� -->
  <!--#include file="right.asp"-->
<!-- �ұ����ص����� END -->
<script src="js/RefreshCarCount.js" type="text/javascript"></script>


<script src="js/idangerous.swiper-2.1.min.js" type="text/javascript"></script>
<script>
  var mySwiper = new Swiper('.swiper-container',{
    pagination: '.pagination',
    loop:true,
    grabCursor: true,
    paginationClickable: true,
	autoplay: 5000
  });
  var mySwiper = new Swiper('.hotswiper',{
	paginationClickable: true,
    slidesPerView: 'auto'
  });
  </script>



</body>
</html>
