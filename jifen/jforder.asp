<!--#include file="../conn.asp"-->
<!--#include file="../user/session.asp"-->
<%   'response.Cookies("cart")="" 

if strUserName<>"" then
mz="<font color=red>"&strUserName&"</font>"
else
mz="�ο�"
end if
conn.execute("insert into sqdt(shijian,dz)values('"&now&"','["&mz&"] ʹ���˻��ֶһ�>> <a href=""/jifen/list.asp?sid=[sid]"">���ֶһ�</a>')") %>
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
<!-- ��Ʒ���ﳵҳ -->
  <div class="clearfix"> 
<form id="form1" name="form1" method="post" action="orderadd.asp?sid=<%= sid %>"  onSubmit="return Validator.Validate(this,3)" >

   
	<div class="clearfix">
      <div class="webcar">
          
         			<ul>
                      
                      
				<li class="bgstyle"><!-- ��Ʒid -->
                <strong>������ʹ�û��ֶһ� </strong>
				  <strong>��Ʒ���ƣ�<em class="pr"> <%= rsa("title")%> </em></strong>
					<span>
					<em class="pr">  ����<%= xfjf%>���� </em>  <br/>
                    <% If vip=1 Then %>   
					<em class="pr">  VIP�û����Է���<%= jf%>���� </em>    
                    <% End If %>
	
					</span>
				</li>
				<!-- ��Ʒ�ܵĻ��ֺ��ܼƽ�� -->
				<!-- ��Ʒ�ܵĻ��ֺ��ܼƽ�� -->        
                
			</ul>
         

		  </div>
          <% End If %>

<!-- 2013-10-26 �޸� ��������ʳ��ʼ���� -->
		<div class="bgstyle clear tabsinfo">
		  <div class="clearfix">
			<ul class="cartabs">
             
                 <li ><span><a href="?ac=ws">����ҵ��</a></span></li>
            
				<li   ><span></span></li>
                    
				
			</ul>
		  </div>
		  <div class="tabscon">


		 
	 		
			<!-- ���� -->
            
 			<div class="customer">
			  <div class="customerfont radius5">
			    <p><strong>��ĵ�ǰ����Ϊ��</strong> <font color="#FF0000"><%= strjf %></font></p>
			  </div>
				<dl>
					<dt>������ <font color="#FF0000">*</font> </dt>
					<dd>
                    <input name="lb" type="hidden" id="lb" value="1" />  
                   
                     <input name="cpid" type="hidden" id="cpid" value="<%= id %>" /> 
                     <input name="jf" type="hidden" id="jf" value="<%= jf %>" />   
                      <input name="vip" type="hidden" id="vip" value="<%= vip %>" />   
                    <input name="xfjf" type="hidden" id="xfjf" value="<%= xfjf%>" />
                    <input type="hidden" class="fdj" name="fdj" value="<%= rsa("gsmt")%>">  
						<input name="zh" type="text" class="borderstyle radius5"  maxlength="10"  placeholder="������������������/�ƺ�"   dataType="Require" msg="*������"  value="<%=strUserName %>" autocomplete="off"/>
					</dd>
				</dl>
				<dl>
					<dt>�绰�� <font color="#FF0000">*</font></dt>
					<dd>
						<input name="tel" type="text" class="borderstyle radius5"   placeholder="�������������ĵ绰..."   dataType="Require" msg="*������"     value="<%= strtel%>"  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"  maxlength="20" autocomplete="off"  onchange="this.value=(/[0-9]+/).exec(this.value)" />
					</dd>
				</dl>
                
                
<dl>
					<dt>����ʱ�䣺</dt>
					<dd>
						 <select name="pst" id="pst">
    <option value="�����͵�">�����͵�</option>
      
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

					<dt>��ַ��  <font color="#FF0000">*</font></dt>
					<dd>
						<input name="dz" type="text" class="borderstyle radius5"  dataType="Require" msg="*������"    placeholder="�����������ַ..."   value="<%= strdz%>" maxlength="50"  autocomplete="off"/>
					</dd>
				</dl>
                   <dl>

<dl>
					<dt>��ע˵��</dt>
					<dd>
						<textarea class="borderstyle radius5" msg="�����������100����֮��"   placeholder="�������������ı�ע �磺��Ҫ̫�����������������"  max="100" datatype="Limit" rows="4" cols="33" id="bz" name="bz" autocomplete="off"></textarea>
					</dd>
				</dl>
<!-- ���� END -->
		 <!-- ���� -->
		 <div class="bgstyle account">
			<input class="radius5" type="submit" name="" value="�µ�����" />
	  </div>
</form> 
</div>





    
 <!--#include file="../foot.asp"-->
 
<!-- footer END -->

</div>


<!-- ��<script type="text/javascript">
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
            
            //д��cookie�����ݽṹ�� id-num,id-num,id-num,��
            //14-5,1-4,6-2 Id 14 1 6�Ĳ�Ʒ�ֱ����5 4 2��
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
            refreshTotal();//ˢ������
	    refreshSumMoney();//ˢ�½��
	
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

���ص����� -->
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
