<!--#include file="../conn.asp"-->
<!--#include file="../user/session.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 
<title>点评<%=site("site_description")%></title>
<meta name="keywords" content="<%=site("site_description")%>" />
<meta name="description" content="<%=site("site_description")%>" />
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />  
<meta content="yes" name="apple-mobile-web-app-capable" />  
<meta content="black" name="apple-mobile-web-app-status-bar-style" />  
<meta content="telephone=no" name="format-detection" />
<link href="../css/user.css" rel="stylesheet" type="text/css" />
<script  type="text/javascript" src="../js/jquery.1.8.0.min.js"></script>
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
<!-- 消费记录 -->
<div class="clearfix">
 <script type="text/javascript">
     $(function(){
		 $('.ymessage dl:odd').addClass('color_1');
	 });
   </script>
<div class="martop15"></div>
<div class="bgstyle textcontent evaluation">
	    <div class="ymessage">
       
		   <dl>
			<dt>
			  <img src="../images/test_1.png" alt=""/></dt>
			<dd>
			  <span class="ymname">
				<strong>飞火流星</strong>
				<span> 
				<font color=red>★</font><font color=red>★</font><font color=red>★</font><font color=red>★</font><font color=red>★</font>
            </span>
			  </span>
			  <p>
				我早就看好微信电子商务了，感觉你们挺专业的，希望越做越好。 
			  </p>
			</dd>
		   </dl>
         
		   <dl>
			<dt>
			  <img src="../images/test_1.png" alt=""/></dt>
			<dd>
			  <span class="ymname">
				<strong>漂流瓶</strong>
				<span> 
				<font color=red>★</font>
            </span>
			  </span>
			  <p>
				啊？不是快餐店，我也是以为楼下快餐店搞的呢 
			  </p>
			</dd>
		   </dl>
         
		   <dl>
			<dt>
			  <img src="../images/test_1.png" alt=""/></dt>
			<dd>
			  <span class="ymname">
				<strong>吃货</strong>
				<span> 
				<font color=red>★</font><font color=red>★</font><font color=red>★</font>
            </span>
			  </span>
			  <p>
				我还以为微信卖快餐了，高高兴兴点个菜等了半个钟头才发现这个是演示系统，不是快餐店。饿死我了 
			  </p>
			</dd>
		   </dl>
         
		   <dl>
			<dt>
			  <img src="../images/test_1.png" alt=""/></dt>
			<dd>
			  <span class="ymname">
				<strong>小飞侠</strong>
				<span> 
				<font color=red>★</font><font color=red>★</font><font color=red>★</font><font color=red>★</font><font color=red>★</font>
            </span>
			  </span>
			  <p>
				这是我看到的最漂亮简约系统 
			  </p>
			</dd>
		   </dl>
         
		   <dl>
			<dt>
			  <img src="../images/test_1.png" alt=""/></dt>
			<dd>
			  <span class="ymname">
				<strong>杰杰</strong>
				<span> 
				<font color=red>★</font><font color=red>★</font><font color=red>★</font><font color=red>★</font><font color=red>★</font>
            </span>
			  </span>
			  <p>
				太棒了这个系统很人性化 
			  </p>
			</dd>
		   </dl>
         
		   <dl>
			<dt>
			  <img src="../images/test_1.png" alt=""/></dt>
			<dd>
			  <span class="ymname">
				<strong>非常绅士联盟</strong>
				<span> 
				<font color=red>★</font><font color=red>★</font><font color=red>★</font><font color=red>★</font><font color=red>★</font>
            </span>
			  </span>
			  <p>
				欢迎大家对系统提出宝贵意见，这是我们共同的财富。 
			  </p>
			</dd>
		   </dl>
  
 		</div>
 
<br />
<br />
<% ac=request("ac") 
if ac="" then%>
 <input type="button" name="zhuce" id="zhuce" value="我要留言"   style=" margin-left:40px; margin-bottom:80px;"  onclick="document.location='../show/lyb.asp?ac=ly'"   class="msubm radius5"/>
     <% Else %>

 
	
		<SCRIPT language=JavaScript src="../js/vali_form.js" type=text/JavaScript></SCRIPT>
  <form id="form1" name="form1" method="post" action="lybok.asp"  onSubmit="return Validator.Validate(this,3)"   > 

		  <div class="evalinput clearfix clear">
			 <dl>
				<dt>昵称：</dt>
				<dd><input class="a1 radius5" type="text" name="nc" datatype="Require" msg="亲，把验证码填写下" style="width:40%"  /></dd>
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
				<dd><input name="txt_check" type="text" size=6 maxlength=4  datatype="Require" msg="亲，把验证码填写下"    class="a1 radius5"  style="width:20%" > <img src="code.asp " alt="验证码,看不清楚?请点击刷新验证码" height="20" style="cursor : pointer;" onClick="this.src='code.asp?t='+(new Date().getTime());" >  <input name="intime1" type="hidden" value="2013-11-15 16:26:47">  <input name="yclx" type="hidden" id="yclx" value="ly" /></dd>
			 </dl>
             
			 <div class="clear mtextarea">
				<textarea class="radius5" msg="内容请控制在200字之内"   max="200" datatype="Limit" rows="4" id="nr" name="nr"></textarea>
 			 </div>
			 <div class="clear martop15">
					<input class="msubm radius5" type="submit" name="button" value="提交留言" />
					<input class="mdelete radius5" type="reset" name="button2" value="清 除"/>
			</div>
		  </div>
	  
     </form></div>
	<% End If %>

  
</div>
<!-- 会员资料 END -->



 <!-- footer -->
   
  
    <!--#include file="../foot.asp"-->
 
<!-- footer END -->
 </div>
 <!-- 右边隐藏的内容 -->
       
    <!--#include file="../right.asp"-->
 
    <script src="../js/RefreshCarCount.js" type="text/javascript"></script>
 <!-- 右边隐藏的内容 END -->



</body>
</html>
