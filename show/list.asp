<!--#include file="../conn.asp"-->
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
			$(".stopsub,.stop5").css("display","none");//�������
			$.cookie("litype_cookie","none",{expires:10000});//����cookie
		});
		
		if($.cookie("litype_cookie")){  //���cookie����
		$(".stopsub,.stop5").css("display",$.cookie("litype_cookie")); //����div����ʽΪcookie��ֵ
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

<!-- ��ʾ���� END -->

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
    <!-- һ������ -->
   
  <div class="litypelf hotswiper">
	<ul style="padding-left: 0px; padding-right: 0px; width: 616px; height: 30px;" class="swiper-wrapper">
                       
                                         <%
Set rse = server.CreateObject("adodb.recordset")
sql = "select * from products_category_main"
rse.Open sql, conn, 1, 3
Do While Not rse.EOF
%>
  <LI class="swiper-slide swiper-slide-visible swiper-slide-active"> <a class="bgstyle" href="/show/list.asp?flid=<%=rse("main_id")%>&sid=<%= sid %>"> <%=rse("main_title")%> </A>  </LI>

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
   <!-- ��΢��һ������END -->
   
   
    
    <!-- ɸѡ �������� -->

 	
   </div>
  
            <div class="listgoods">
        
                        <%
 if strUserName<>"" then
mz="<font color=red>"&strUserName&"</font>"
else
mz="�ο�"
end if
conn.execute("insert into sqdt(shijian,dz)values('"&now&"','["&mz&"] ���ڵ��>> <a href=""/show/list.asp?sid="&sid&""">��ҲҪ�Է�</a>')")

						flid=request("flid")
Set rsp = server.CreateObject("adodb.recordset")
if flid<>"" then
sql = "select * from products where main_id="&flid&" and ssqy='1' order by id desc"
else
sql = "select * from products where ssqy='1' order by id desc"
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
           <input  type="hidden"  value="<%=rsp("id")%>"   name="spid"/>
 		  
     
          <dt>  <a href="index.asp?id=<%=rsp("id")%>&sid=<%= sid %>">  <img src="/<%= rsp("uploadfile") %>" alt=""/>  </a></dt>
         <dd>
          
		  
		       <strong><a href="index.asp?id=<%=rsp("id")%>&sid=<%= sid %>"> <%=rsp("title")%></a></strong>
			   <div class="listgoodsinfo">
					<span class="pr"> ��<%=rsp("gsmt")%><font> ������<%=rsp("lxdh")%>����</font> </span>
			    
               </div>
               
             
			   <div class="clearfix">
				   <span class="lgadd fr">
                     <button type=button class='lgplus'>   -   </button> 
                     <input type=text value='0' name='t1' size='2' class="addtext" maxlength='3' dataType='Number' msg='����Ϊ����'>
                     <button type=button class='lgminus'  >   +   </button>
                     <div class="car_item_piao">+1</div>
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
		<li><%=epage%>/<%=rsp.pagecount%> </li>
<% if epage>=rsp.pagecount then%>
	<li> 
  <a href='#' class='fr pagenext'>  βҳ>  </a>        
     </li>        
 <% Else %>
	<li> 
  <a href='?page=<%= epage+1 %>&sid=<%= sid %>' class='fr pagenext'>  ��һҳ>  </a>        
     </li>   
   <% End If %>

	  </ul>	
	</div>
	<!-- ��ҳ END -->
    <% rsp.Close
Set rsp = Nothing %>
    
</div>
<!-- ��Ʒ�б�ҳ END -->


  
<script type="text/javascript">

$(document).ready(function(){
		$(".lgminus").click(function(){
		  $(this).nextAll('.car_item_piao').css({
				fontSize:'50px'
			});
		  $(this).nextAll('.car_item_piao').stop();
			$(this).each(function(){
				var AX =  $('.count').offset().top + $(this).offset().top ;
				var Ay =   $(this).offset().left  + $('.count').offset().left-250 ;
				$(this).nextAll('.car_item_piao').show();
				$(this).nextAll('.car_item_piao').css({
					top:"20px",
					left:"50px",
					width:"100px",
					height:"150px"
					
				});
				$(this).nextAll('.car_item_piao').animate({
					top:AX,
					left:Ay,
					fontSize:'0'
				},3000);
			});
  		  });
		});
		
		


    var readCart = function () {
        var ckcart = $.cookie('cart') || '';
        $('.bgstyle').each(function (e) {
            var id = $(this).children('input').attr('value');
            var p = ckcart.indexOf(id + '-');
            if (p == -1)
                return;
            p = ckcart.indexOf('-', p) + 1;
            var ed = ckcart.indexOf(',', p);
            $(this).find('.lgadd > input').attr('value',ckcart.substr(p, ed - p));
        });
    };

    var listener = function () {
        $('.lgadd > button').click(function (e) {

            var pel = $(e.target.parentNode);
            var id = parseInt(pel.parents('.bgstyle').children('input').attr('value'));
            var num = parseInt(pel.children('input').attr('value'));

            if ($(e.target).html().indexOf('+') != -1)
                num++;
            else if (num > 0)
                num--;
            pel.children('input').attr('value', num);

            //д��cookie�����ݽṹ�� id-num,id-num,id-num,��
            //14-5,1-4,6-2 Id 14 1 6�Ĳ�Ʒ�ֱ����5 4 2��
            var ckcart = $.cookie('cart') || '';
            var p = ckcart.indexOf(id + '-');
            if (p != -1) {
                var ed = ckcart.indexOf(',', p);
                var oldVal = ckcart.substr(p, ed - p + 1);
                ckcart = ckcart.replace(oldVal, num == 0 ? '' : id + '-' + num + ',');

            }
            else {
                ckcart += id + '-' + num + ',';
            }

            $.cookie('cart', ckcart, { expires: 7, path: '/' });

 		    refreshTotal();//ˢ������
        });

    };
	
	var refreshTotal = function () {
        var ckcart = $.cookie('cart') || '';
	    var total=0;
	    $.each(ckcart.split(',') , function (i , v) {
		    var p = v.indexOf('-') + 1;
		    if (p != 0)
			    total += parseInt(v.substr(p));
	    });
		
		//#carttotal��Ӧ������ʾ�����ı�ǩ��Id,��ֲʱ�Ķ��������Id����
		  $('.count').html(total);
	};

    $(document).ready(function () {
        readCart();
        listener();
		refreshTotal();
    });

</script>   



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
