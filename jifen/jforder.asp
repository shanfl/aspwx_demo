<!--#include file="../conn.asp"-->
<!--#include file="../user/session.asp"-->
<%   'response.Cookies("cart")="" 

if strUserName<>"" then
mz="<font color=red>"&strUserName&"</font>"
else
mz="游客"
end if
conn.execute("insert into sqdt(shijian,dz)values('"&now&"','["&mz&"] 使用了积分兑换>> <a href=""/jifen/list.asp?sid=[sid]"">积分兑换</a>')") %>
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
<script src="../js/jquery.1.8.0.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>  
<script src="../js/js.js" type="text/javascript"></script>
 <SCRIPT language=JavaScript src="../js/vali_form.js" type=text/JavaScript></SCRIPT>

<link href="../css/common.css" rel="stylesheet" type="text/css" />
<link href="../css/other.css" rel="stylesheet" type="text/css" />

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
  <% 	id=request("cpid")
  
 
   Set rsa = server.CreateObject("adodb.recordset")
sql = "select * from products where ssqy='1' and jfgmid=1 and id="& ID
rsa.Open sql, conn, 1, 1
if not rsa.eof then
xfjf= rsa("tzed")
jf=rsa("lxdh")
 %>
<!-- 商品购物车页 -->
  <div class="clearfix"> 
<form id="form1" name="form1" method="post" action="orderadd.asp?sid=<%= sid %>"  onSubmit="return Validator.Validate(this,3)" >

   
	<div class="clearfix">
      <div class="webcar">
          
         			<ul>
                      
                      
				<li class="bgstyle"><!-- 商品id -->
                <strong>你正在使用积分兑换 </strong>
				  <strong>商品名称：<em class="pr"> <%= rsa("title")%> </em></strong>
					<span>
					<em class="pr">  消费<%= xfjf%>积分 </em>  <br/>
                    <% If vip=1 Then %>   
					<em class="pr">  VIP用户可以返回<%= jf%>积分 </em>    
                    <% End If %>
	
					</span>
				</li>
				<!-- 商品总的积分和总计金额 -->
				<!-- 商品总的积分和总计金额 -->        
                
			</ul>
         

		  </div>
          <% End If %>

<!-- 2013-10-26 修改 外卖和堂食开始区分 -->
		<div class="bgstyle clear tabsinfo">
		  <div class="clearfix">
			<ul class="cartabs">
             
                 <li ><span><a href="?ac=ws">外送业务</a></span></li>
            
				<li   ><span></span></li>
                    
				
			</ul>
		  </div>
		  <div class="tabscon">


		 
	 		
			<!-- 外卖 -->
            
 			<div class="customer">
			  <div class="customerfont radius5">
			    <p><strong>你的当前积分为：</strong> <font color="#FF0000"><%= strjf %></font></p>
			  </div>
				<dl>
					<dt>姓名： <font color="#FF0000">*</font> </dt>
					<dd>
                    <input name="lb" type="hidden" id="lb" value="1" />  
                   
                     <input name="cpid" type="hidden" id="cpid" value="<%= id %>" /> 
                     <input name="jf" type="hidden" id="jf" value="<%= jf %>" />   
                      <input name="vip" type="hidden" id="vip" value="<%= vip %>" />   
                    <input name="xfjf" type="hidden" id="xfjf" value="<%= xfjf%>" />
                    <input type="hidden" class="fdj" name="fdj" value="<%= rsa("gsmt")%>">  
						<input name="zh" type="text" class="borderstyle radius5"  maxlength="10"  placeholder="在这里输入您的姓名/称呼"   dataType="Require" msg="*必填项"  value="<%=strUserName %>" autocomplete="off"/>
					</dd>
				</dl>
				<dl>
					<dt>电话： <font color="#FF0000">*</font></dt>
					<dd>
						<input name="tel" type="text" class="borderstyle radius5"   placeholder="在这里输入您的电话..."   dataType="Require" msg="*必填项"     value="<%= strtel%>"  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"  maxlength="20" autocomplete="off"  onchange="this.value=(/[0-9]+/).exec(this.value)" />
					</dd>
				</dl>
                
                
<dl>
					<dt>配送时间：</dt>
					<dd>
						 <select name="pst" id="pst">
    <option value="尽快送到">尽快送到</option>
      
       <option value="10:30-11:00">10:30-11:00</option>
     
       <option value="11:00-11:30">11:00-11:30</option>
     
       <option value="12:00-12:30">12:00-12:30</option>
     
       <option value="11:30-12:00">11:30-12:00</option>
     
       <option value="12:30-13:00">12:30-13:00</option>
     
       <option value="16:00-16:30">16:00-16:30</option>
     
       <option value="16:30-17:30">16:30-17:30</option>
     
       <option value="18:00-19:00">18:00-19:00</option>
     
 
</select>
					</dd>
</dl>
				<dl>

					<dt>地址：  <font color="#FF0000">*</font></dt>
					<dd>
						<input name="dz" type="text" class="borderstyle radius5"  dataType="Require" msg="*必填项"    placeholder="在这里输入地址..."   value="<%= strdz%>" maxlength="50"  autocomplete="off"/>
					</dd>
				</dl>
                   <dl>

<dl>
					<dt>备注说明</dt>
					<dd>
						<textarea class="borderstyle radius5" msg="内容请控制在100个字之内"   placeholder="在这里输入您的备注 如：不要太辣，快点送来。。。"  max="100" datatype="Limit" rows="4" cols="33" id="bz" name="bz" autocomplete="off"></textarea>
					</dd>
				</dl>
<!-- 外卖 END -->
		 <!-- 结算 -->
		 <div class="bgstyle account">
			<input class="radius5" type="submit" name="" value="下单购买" />
	  </div>
</form> 
</div>





    
 <!--#include file="../foot.asp"-->
 
<!-- footer END -->

</div>


<!-- 右<script type="text/javascript">
     var readCart = function () {
        var ckcart = $.cookie('cart') || '';
        $('.bgstyle').each(function (e) {
            var id = $(this).children('input').attr('value');
            var p = ckcart.indexOf(id + '-');
            if (p == -1)
                return;
            p = ckcart.indexOf('-', p) + 1;
            var ed = ckcart.indexOf(',', p);
            $(this).find('.caraddg > input').attr('value',ckcart.substr(p, ed - p));
        });
    };

    var listener = function () {
        $('.caraddg > button').click(function (e) {
            var pel = $(e.target.parentNode);
            var id = parseInt(pel.parents('.bgstyle').children('.spid').attr('value'));
            var num = parseInt(pel.children('input').attr('value'));
            
            if ($(e.target).html().indexOf('+') != -1)
                num++;
				
            else if (num > 0)
                num--;
			
            pel.children('input').attr('value',num);
            
            //写入cookie，数据结构是 id-num,id-num,id-num,如
            //14-5,1-4,6-2 Id 14 1 6的菜品分别点了5 4 2份
            var ckcart = $.cookie('cart') || '';
            var p = ckcart.indexOf(id + '-');
            if (p!= -1) {
                var ed = ckcart.indexOf(',', p);
                var oldVal = ckcart.substr(p, ed - p + 1);
                ckcart = ckcart.replace(oldVal, num == 0 ? '' : id + '-' + num + ',');

            }
            else{
                ckcart += id + '-' + num + ',';
				//location.reload();
            }

            $.cookie('cart', ckcart, {expires:7,path:'/'});
            refreshTotal();//刷新总数
	    refreshSumMoney();//刷新金额
	
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
		
        //#carttotal对应的是显示总数的标签的Id,移植时改动下面这个Id即可
        $('.allsl').html(total);
		 $("#ts").val(total);
        $('.count').html(total);
	};
	
    var refreshSumMoney = function () {
           var money = 0,sumjf = 0;
           $('.bgstyle').each(function () {

               var price = parseFloat($(this).find('.fdj').attr('value'));
               var djf = parseFloat($(this).find('.fjf').attr('value'));
               var num = parseFloat($(this).find('.caraddg > input').attr('value'));
               
               if (!isNaN(price) && !isNaN(num))
                   money += price * num;

	       if (!isNaN(djf) && !isNaN(num))
               	   sumjf+= djf * num;
				   
           });
		  $('.allzj').html(money);
	   $('.alljf').html(sumjf);
	    $("#zj").val(money);
		$("#jf").val(sumjf);
    };
   
    $(document).ready(function () {
        readCart();
        listener();
	refreshTotal();
        refreshSumMoney();
		
    });

</script>   

隐藏的内容 -->
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
