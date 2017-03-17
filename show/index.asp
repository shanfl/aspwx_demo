<!--#include file="../conn.asp"-->

<%
	 

id = request("id")
If request.QueryString("id") = "" Or Not IsNumeric(request.QueryString("id")) Then
    Response.Write "<script language='javascript'>alert('参数错误!');document.location.href('products.asp?sid="&sid&"');</script>"
    Response.End()
End If
%>
      <%
Set rs = server.CreateObject("adodb.recordset")
sql = "select * from products where ssqy='1' and id="& request.QueryString("id")
rs.Open sql, conn, 1, 1
If rs.EOF And rs.bof Then
    Response.Write "<script language='javascript'>alert('无效值!');document.location.href('products.asp?sid="&sid&"');</script>"
    Response.End()
End If
dz=rs("title")
  if strUserName<>"" then
mz="<font color=red>"&strUserName&"</font>"
else
mz="游客"
end if
conn.execute("insert into sqdt(shijian,dz)values('"&now&"','["&mz&"] 正在订餐>> <a href=""/show/index.asp?id="&id&"&sid="&sid&""">"&rs("title")&"</a>')")
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 
 <title><%=rs("title")%></title>
<META NAME="Keywords" CONTENT="<%=rs("title")%>">
<META NAME="Description" CONTENT="<%=rs("title")%> ">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />  
<meta content="yes" name="apple-mobile-web-app-capable" />  
<meta content="black" name="apple-mobile-web-app-status-bar-style" />  
<meta content="telephone=no" name="format-detection" />

<script src="../js/jquery.1.8.0.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>     
<script src="../js/js.js" type="text/javascript"></script>
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
<!-- 商品内容页 -->
<div class="clearfix">
 <% Set rsa = server.CreateObject("adodb.recordset")
sql = "select * from products where ssqy='1' and id="& request.QueryString("id")
rsa.Open sql, conn, 1, 3
rsa("hits") = rsa("hits") + 1
rsa.update 
%>
   
   <!-- 商品信息 -->
   <div class="bgstyle goodsinfos">
      <h1><%= rsa("title")%> </h1>
	  <div class="goodspr">
		<em> ￥ <%= rsa("gsmt")%> </em>  <% If rsa("lxdh")<>"" Then %> <font>  &nbsp;&nbsp;消费送<% =rsa("lxdh") %>积分 </font><% End If %>

	  </div>
      <div class="hit">人气：<%= rsa("hits")%> &nbsp;&nbsp;更新时间:<%= rsa("date")%></div>
   </div>
   <!-- 商品信息 END -->
   <% rsa.close %>
   <!-- 购物车 -->
   <div class="bgstyle goodscar">
      <ul>
	    <li class="plustext"> <input  type="hidden"  value="<%=rs("id")%>"  ID="spid"  name="spid"/>   <!-- 商品ID -->
			     <button type=button class='lgplus'>   -   </button> 
					<input class="addtext" type="text" name="" value="0" />
					<button type=button class='lgminus'>   +   </button>
		</li>
		<li class="buyadd">
			<span><input class="buying" type="submit" name="" value="前往购物车"  onclick="location.href='../order/?sid=<%= sid %>'" /></span>
			 
			 
		</li>
	   </ul>
      
   </div>
   <!-- 购物车 END -->
   
   <!-- 图文 -->
   <div class="imagetext clear">
    <a name="imagetext" id="imagetext"></a>
	  <div class="texttitle radius5">
		 <ul>
			<li class="this"><a href="#imagetext" >图文详情</a></li>
              
			<li><a href="#evaluation" title="" >评价</a></li>
            
		 </ul>
	  </div>
	  <div class="bgstyle textcontent">
		<%=rs("body")%>
	  </div>
   </div>
   <!-- 图文 END -->
   	   
   <!-- 评论 -->
   <script type="text/javascript">
     $(function(){
		 $('.ymessage dl:odd').addClass('color_1');
	 });
   </script>
   <div class="imagetext clear martop10">
     <a name="evaluation" id="evaluation"></a>
	  <div class="texttitle radius5">
		 <ul>
			<li><a href="#imagetext" >图文详情</a></li>
           
			<li class="this"><a href="#evaluation" title="" >评价</a></li>
            
		 </ul>
	  </div>
	  <div class="bgstyle textcontent evaluation">
      
      <div class="ymessage">
	
 <%  Set rsp = Server.CreateObject("ADODB.RecordSet")
    sqlp = "select top 5 * from pinglun where Card_number='1' and cpid='"& id &"'" '连接表，id=0表示不从表里面输出数据
    rsp.Open sqlp, conn, 1, 1
	If rsp.EOF Then
	response.Write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;还没有任何评论，赶紧抢沙发吧！")
	else 
	do while not rsp.eof       
%>
  		   <dl >
			<dt>
			  <img src="../images/test_1.png" alt=""></dt>
			<dd>
			  <span class="ymname">
				<strong><%= rsp("realname") %></strong> 
				<span>  
                 <% If rsp("Run_effect")=1 Then %>★<% ElseIf  rsp("Run_effect")=2 Then %>★★<% ElseIf  rsp("Run_effect")=3 Then %>★★★<% ElseIf  rsp("Run_effect")=4 Then %>★★★★<% ElseIf  rsp("Run_effect")=5 Then %>★★★★★</span><%= rsp("aftime") %>
			  <% End If %>
</span>
			  <p>
				<%= rsp("text0") %>
 			  </p>
			</dd>
		   </dl>
                       <%

rsp.movenext
loop
rsp.Close
Set rsp = Nothing 
end if
%>
                 <dl id="listtable"></dl>
        
 <input type="hidden"  id="plid" value="<%= id %>"/>
    
        <input id="pageno" class="j-pageno" type="hidden" value="2">
        <div class="more" id="getmore">
           <span> 查看更多 </span>
        </div>
        
		</div>
	  
 <SCRIPT language=JavaScript src="../js/vali_form.js" type=text/JavaScript></SCRIPT>	  
  <form id="form1" name="form1" method="post" action="dianping.asp?sid=<%= sid %>"  onSubmit="return Validator.Validate(this,3)"   >
      
		  <div class="evalinput clearfix clear">
			 <dl>
				<dt>昵称：</dt>
				<dd><input name="nc" type="text" class="a1 radius5" maxlength="10"  dataType="Require" msg="亲，留下您的姓名或称呼吧。。。" style="width:200px;" autocomplete="off"/>
				</dd>
			 </dl>
			 <dl>
			   <dt>打分：</dt>
			    <dd>
					<input type="radio" checked="checked" value="5" id="radio" name="fs">
					5分
					<input type="radio" value="4" id="radio2" name="fs">
					4分
					<input type="radio" value="3" id="radio3" name="fs">
					3分
					<input type="radio" value="2" id="radio4" name="fs">
					2分
					<input type="radio" value="1" id="radio5" name="fs">
					1分
				</dd>	
			 </dl>
             
             <dl>
				<dt>验证码：</dt>
				<dd> <input autocomplete="off" name="txt_check" type="text" size=6 maxlength=4  datatype="Require" msg="亲，把验证码填写下"    class="a1 radius5"  style="width:20%" > <img src="code.asp " alt="验证码,看不清楚?请点击刷新验证码" height="20" style="cursor : pointer;" onClick="this.src='code.asp?t='+(new Date().getTime());" >  <input name="intime1" type="hidden" value="2013-11-14 22:36:34">   
				</dd>
			 </dl>
             
             
			 <div class="clear mtextarea">
				<textarea class="radius5" autocomplete="off" msg="亲，总要说点什么吧。。。。"  dataType="LimitB" min="4" max="200"   rows="4" id="nr" name="nr"></textarea>
				
			 </div>
			 <div class="clear martop15"   style=" margin-left:90px;">
                  <input name="ycid" type="hidden" id="ycid" value="<%= rs("id") %>" />
        
					<input class="msubm radius5" type="submit" name="button" value="确 认" />
					<input class="mdelete radius5" type="reset" name="button2" value="清 除"/>
			</div>
		  </div>
	
  </form>  
     </div>
   </div>
   <!-- 评论 END -->
   
  
</div>
<!-- 商品内容页 END -->







<!-- footer -->
    
 <!--#include file="../foot.asp"-->
<!-- footer END -->
</div>


<!-- 右边隐藏的内容 -->
       <!--#include file="../right.asp"-->
  
      <script src="../js/RefreshCarCount.js" type="text/javascript"></script>
<!-- 右边隐藏的内容 END -->
 <script type="text/javascript">
  var readCart = function () {
        var ckcart = $.cookie('cart') || '';
        $('.plustext').each(function (e) {
            var id = $(this).children('#spid').attr('value');
            var p = ckcart.indexOf(id + '-');
            if (p == -1)
                return;
            p = ckcart.indexOf('-', p) + 1;
            var ed = ckcart.indexOf(',', p);
            $(this).find('.addtext').attr('value',ckcart.substr(p, ed - p));
        });
    };

    var listener = function () {
        $('.plustext > button').click(function (e) {
            var pel = $(e.target.parentNode);
            var id = parseInt(pel.children('#spid').attr('value'));
            var num = parseInt(pel.children('.addtext').attr('value'));

            if ($(e.target).html().indexOf('+') != -1)
                num++;
            else if (num > 0)
                num--;
            pel.children('.addtext').attr('value',num);

            //写入cookie，数据结构是 id-num,id-num,id-num,如
            //14-5,1-4,6-2 Id 14 1 6的菜品分别点了5 4 2份
            var ckcart = $.cookie('cart') || '';
            var p = ckcart.indexOf(id + '-');
            if (p != -1) {
                var ed = ckcart.indexOf(',', p);
                var oldVal = ckcart.substr(p, ed - p + 1);
                ckcart = ckcart.replace(oldVal, num == 0 ? '' : id + '-' + num + ',');

            }
            else{
                ckcart += id + '-' + num + ',';
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
		
        $('.count').html(total);
    };
	
   
    $(document).ready(function () {
        readCart();
        listener();
	refreshTotal();
    });
//显示更多新闻
	$("#getmore").click(function(){
		    var page = $("#pageno").val();
				var plid = $("#plid").val();
				
        $.get("page.asp","page=" + page + "&id=" + plid,function(data){
					  if (data=="no") {
						  //$("#getmore").attr("style", "display:none");
						  $("#getmore").html("已经没有了!");
					  }
					  else{
              $("#listtable").append(data);
					    page++;
				      $("#pageno").val(page);
					  }
                            })
				
		});
 </script> 
<% rs.close
 %>
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
