<!--#include file="../conn.asp"-->
<!--#include file="../user/session.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 
<title>����<%=site("site_description")%></title>
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
<!-- ���Ѽ�¼ -->
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
				<strong>�ɻ�����</strong>
				<span> 
				<font color=red>��</font><font color=red>��</font><font color=red>��</font><font color=red>��</font><font color=red>��</font>
            </span>
			  </span>
			  <p>
				����Ϳ���΢�ŵ��������ˣ��о�����ͦרҵ�ģ�ϣ��Խ��Խ�á� 
			  </p>
			</dd>
		   </dl>
         
		   <dl>
			<dt>
			  <img src="../images/test_1.png" alt=""/></dt>
			<dd>
			  <span class="ymname">
				<strong>Ư��ƿ</strong>
				<span> 
				<font color=red>��</font>
            </span>
			  </span>
			  <p>
				�������ǿ�͵꣬��Ҳ����Ϊ¥�¿�͵����� 
			  </p>
			</dd>
		   </dl>
         
		   <dl>
			<dt>
			  <img src="../images/test_1.png" alt=""/></dt>
			<dd>
			  <span class="ymname">
				<strong>�Ի�</strong>
				<span> 
				<font color=red>��</font><font color=red>��</font><font color=red>��</font>
            </span>
			  </span>
			  <p>
				�һ���Ϊ΢��������ˣ��߸����˵���˵��˰����ͷ�ŷ����������ʾϵͳ�����ǿ�͵ꡣ�������� 
			  </p>
			</dd>
		   </dl>
         
		   <dl>
			<dt>
			  <img src="../images/test_1.png" alt=""/></dt>
			<dd>
			  <span class="ymname">
				<strong>С����</strong>
				<span> 
				<font color=red>��</font><font color=red>��</font><font color=red>��</font><font color=red>��</font><font color=red>��</font>
            </span>
			  </span>
			  <p>
				�����ҿ�������Ư����Լϵͳ 
			  </p>
			</dd>
		   </dl>
         
		   <dl>
			<dt>
			  <img src="../images/test_1.png" alt=""/></dt>
			<dd>
			  <span class="ymname">
				<strong>�ܽ�</strong>
				<span> 
				<font color=red>��</font><font color=red>��</font><font color=red>��</font><font color=red>��</font><font color=red>��</font>
            </span>
			  </span>
			  <p>
				̫�������ϵͳ�����Ի� 
			  </p>
			</dd>
		   </dl>
         
		   <dl>
			<dt>
			  <img src="../images/test_1.png" alt=""/></dt>
			<dd>
			  <span class="ymname">
				<strong>�ǳ���ʿ����</strong>
				<span> 
				<font color=red>��</font><font color=red>��</font><font color=red>��</font><font color=red>��</font><font color=red>��</font>
            </span>
			  </span>
			  <p>
				��ӭ��Ҷ�ϵͳ�������������������ǹ�ͬ�ĲƸ��� 
			  </p>
			</dd>
		   </dl>
  
 		</div>
 
<br />
<br />
<% ac=request("ac") 
if ac="" then%>
 <input type="button" name="zhuce" id="zhuce" value="��Ҫ����"   style=" margin-left:40px; margin-bottom:80px;"  onclick="document.location='../show/lyb.asp?ac=ly'"   class="msubm radius5"/>
     <% Else %>

 
	
		<SCRIPT language=JavaScript src="../js/vali_form.js" type=text/JavaScript></SCRIPT>
  <form id="form1" name="form1" method="post" action="lybok.asp"  onSubmit="return Validator.Validate(this,3)"   > 

		  <div class="evalinput clearfix clear">
			 <dl>
				<dt>�ǳƣ�</dt>
				<dd><input class="a1 radius5" type="text" name="nc" datatype="Require" msg="�ף�����֤����д��" style="width:40%"  /></dd>
			 </dl>
             
			 <dl>
			   <dt>��֣�</dt>
			    <dd>
					<input type="radio" checked="checked" value="5" id="radio" name="fs">
					5��
					<input type="radio" value="4" id="radio2" name="fs">
					4��
					<input type="radio" value="3" id="radio3" name="fs">
					3��
					<input type="radio" value="2" id="radio4" name="fs">
					2��
					<input type="radio" value="1" id="radio5" name="fs">
					1��
				</dd>	
			 </dl>
             <dl>
				<dt>��֤�룺</dt>
				<dd><input name="txt_check" type="text" size=6 maxlength=4  datatype="Require" msg="�ף�����֤����д��"    class="a1 radius5"  style="width:20%" > <img src="code.asp " alt="��֤��,�������?����ˢ����֤��" height="20" style="cursor : pointer;" onClick="this.src='code.asp?t='+(new Date().getTime());" >  <input name="intime1" type="hidden" value="2013-11-15 16:26:47">  <input name="yclx" type="hidden" id="yclx" value="ly" /></dd>
			 </dl>
             
			 <div class="clear mtextarea">
				<textarea class="radius5" msg="�����������200��֮��"   max="200" datatype="Limit" rows="4" id="nr" name="nr"></textarea>
 			 </div>
			 <div class="clear martop15">
					<input class="msubm radius5" type="submit" name="button" value="�ύ����" />
					<input class="mdelete radius5" type="reset" name="button2" value="�� ��"/>
			</div>
		  </div>
	  
     </form></div>
	<% End If %>

  
</div>
<!-- ��Ա���� END -->



 <!-- footer -->
   
  
    <!--#include file="../foot.asp"-->
 
<!-- footer END -->
 </div>
 <!-- �ұ����ص����� -->
       
    <!--#include file="../right.asp"-->
 
    <script src="../js/RefreshCarCount.js" type="text/javascript"></script>
 <!-- �ұ����ص����� END -->



</body>
</html>
