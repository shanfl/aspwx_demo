function u(url){self.location=url;}
function CheckGB(){if(this.gbform.title.value==""){document.getElementById("postinfo").innerHTML="*请输入留言标题";return false}else if(this.gbform.content.value==""){document.getElementById("postinfo").innerHTML="*请输入留言内容";return false}else{return true}}
//定时器间隔  
var interval=2000;//两次滚动之间的时间间隔
var stepsize=53;//滚动一次的高度
var scrollspeed="normal";//可选("slow", "normal", or "fast")，或者滚动动画时长的毫秒数
var objInterval=null;
var ccmsg="<img src=common/images/error.png align='absbottom'>";
var cgmsg="<img src=common/images/right.png align='absbottom'>";
var loadmsg="<img src=common/images/loading.gif align='absbottom'>";
$(document).ready(  
function(){
$('form').jqTransform({imgPath:'common/plugin/img/'});  
setInterval("startRequest()",8000);
$(".loginbtn").click(function(){
     $("#login").click();
})
$("#refresh").click(function(){
   $("b#userjf").load("/detect.asp?action=refresh&typeid=1");
   $("b#userzt").load("/detect.asp?action=refresh&typeid=2");
   $.ajaxSetup ({
            cache: true
        });
})
$(".reg_a").click(function(){$("#reg").click();$('html,body').animate({scrollTop: '0px'}, 800);return false;})
$(".submit-a").click(function(){$("#warm").wBox({title: "温馨提示",show:true,html:"<div class='warm_n'>请先注册登陆您的会员帐号！</div>"});$("#reg").click();$('html,body').animate({scrollTop: '0px'}, 800);return false;})
$(".submit-b").click(function(){$("#warm").wBox({title: "温馨提示",show:true,html:"<div class='warm_n'>您的帐户未激活,需激活才能使用！</div>"});setTimeout(function(){window.location.reload()},1000)})
$(".submit-c").click(function(){$("#warm").wBox({title: "温馨提示",show:true,html:"<div class='warm_n'>系统检测到您的IP被腾讯所封，请进入会员中心设置IP邦定在进行操作!</div>"});setTimeout(function(){window.location.reload()},1000)})
$(".submit-d").click(function(){$("#warm").wBox({title: "温馨提示",show:true,html:"<div class='warm_y'>提交成功，请耐心等待，若您不想等待的话，可以利用积分购买充值基金!</div>"});setTimeout(function(){window.location.reload()},1000)})
$("input[name='webyw']").change(function(){document.getElementById('webyw_i').innerHTML=" &nbsp;您选择开通的是：<b>"+$("input[name='webyw']:checked").val()+"</b>"; });
$("input[name='sl']").change(function(){var intHot = $("input[name='sl']:checked").val();document.getElementById('qbsl_i').innerHTML=" &nbsp;您将要充值：<b>"+intHot+"</b> QB"; });
//检测帐号
$("#reguser").blur(function(){$("#zinfo").html(loadmsg+"正在检测帐号");$.get("/detect.asp?action=checkusername",{reguser:$("#reguser").val()},function(data,textStatus){if(data==""){$("#zinfo").html(ccmsg+"该帐号已存在");$("#reguser").focus();return false}else{$("#zinfo").html("");return true}})})
$("#ip_username").blur(function(){$("#ipinfo").html(loadmsg+"正在检测帐号");$.get("/detect.asp?action=checktjr",{tjr:$("#ip_username").val()},function(data,textStatus){if(data==""){$("#ipinfo").html(ccmsg+"要绑定的会员账号不存在");$("#ip_username").focus();return false}else{$("#ipinfo").html(cgmsg+"填写正确");return true}})})
//检测推荐人
$("#tjr").blur(function(){if($("#tjr").val()==''){$("#zinfo").html("");return true}else{$.get("/detect.asp?action=checktjr",{tjr:$("#tjr").val()},function(data,textStatus){if(data==""){$("#zinfo").html(ccmsg+"推荐人不存在!");$("#tjr").focus();return false}else{$("#zinfo").html("");return true}})}})
//注册帐号
$("#regtj").click(function(){if($("#reguser").val()==''){$("#reguser").focus();$("#zinfo").html(ccmsg+"请输入一个帐号");return false}else if($("#reguser").val().length<4){$("#reguser").focus();$("#zinfo").html(ccmsg+"帐号必须大于4且小于15个字");return false}else if($("#reguser").val().length>15){$("#reguser").focus();$("#zinfo").html(ccmsg+"帐号必须大于4且小于15个字");return false}else if($("#regpassword").val()==''){$("#regpassword").focus();$("#zinfo").html(ccmsg+"请输入密码");return false}else if($("#regpassword").val().length<4){$("#regpassword").focus();$("#zinfo").html(ccmsg+"密码长度必须大于6且小于20");return false}else if($("#regpassword").val().length>15){$("#regpassword").focus();$("#zinfo").html(ccmsg+"密码长度必须大于6且小于20");return false}else if($("#regpassword2").val()==''){$("#regpassword2").focus();$("#zinfo").html(ccmsg+"请再输入一次以确认您的密码");return false}else if($("#regpassword2").val()!==$("#regpassword").val()){$("#regpassword2").focus();$("#zinfo").html(ccmsg+"2次输入的密码不相同");return false}else{$(this).attr("disabled",true);$("#zinfo").html(loadmsg+"正在发送注册信息");$.get("/detect.asp?action=register",$("#registers").serialize(),function(data,textStatus){if(data=="true"){$(".remove").val("");$("#regtj").removeAttr("disabled");$("#regclose").click();$("#login").click();$("#zinfo").html("");$("#linfo").html(cgmsg+"注册成功,立即登陆激活帐号")}else{$("#regtj").removeAttr("disabled");$("#zinfo").html(ccmsg+"注册失败:"+data)}})}})
//登陆
$("#logintj").click(function(){if($("#user").val()==''){$("#user").focus();$("#linfo").html(ccmsg+"请输入帐号");return false}else if($("#password").val()==''){$("#password").focus();$("#linfo").html(ccmsg+"请输入密码");return false}else{$("#linfo").html(loadmsg+"正在发送登陆数据");$.get("/detect.asp?action=login",$("#logins").serialize(),function(data,textStatus){if(data=="true"){$(".remove").val("");$("#linfo").html(cgmsg+"登陆成功!正在返回数据..");setTimeout(function(){window.location='/tg/'},1000)}else{$("#linfo").html(ccmsg+"登陆失败:"+data)}})}})
//留言
$("#lytj").click(function(){if($("#title").val()==''){$("#title").focus();$("#tinfo").html(ccmsg+"留言标题不能为空!");return false}else if($("#content").val()==''){$("#content").focus();$("#cinfo").html(ccmsg+"留言内容不能为空!");return false}else{$("#postinfo").html(loadmsg+"正在发送登陆数据");$.get("/detect.asp?action=lyok",$("#book").serialize(),function(data,textStatus){if(data=="true"){$(".remove").val("");$("#postinfo").html(cgmsg+"留言成功!正在返回数据..");setTimeout(function(){window.location.reload()},1000)}else{$("#postinfo").html(ccmsg+"留言失败:"+data)}})}})
//退出登陆
$("#outbtn").click(function(){$("#memberbox").html(loadmsg+"正在退出登陆");$.post("/detect.asp?action=loginout",function(data,textStatus){if(data=="true"){$("#memberbox").html(cgmsg+"退出成功!");setTimeout(function(){window.location.reload()},1000)}else{$("#memberbox").html(ccmsg+"退出失败!")}})})
//每日签到
$("#jifen").click(function(){$("#jifen").html(loadmsg+"正在签到");$.post("/detect.asp?action=jifen",function(data,textStatus){if(data=="true"){$("#jifen").html(cgmsg+"今日签到成功!");setTimeout(function(){window.location.reload()},1000)}else{$("#jifen").html(ccmsg+"签到失败!")}})})
//tenpay
$("#paysub").click(function(){if($("#username").val()==''){$("#payinfo").html(ccmsg+"请先登陆再提交");$("#login").click();return false}else if($("#pay_zh").val()==''){$("#pay_zh").focus();$("#payinfo").html(ccmsg+"请输入网址!");return false}else{$(this).attr("disabled",true);$.get("/detect.asp?action=pay",$("#tenpay").serialize(),function(data,textStatus){if(data=="true"){$("#paysub").removeAttr("disabled");$(".remove").val("");$("#payinfo").html("");$("#payinfo").html(cgmsg+"提交成功!")}else{$("#paysub").removeAttr("disabled");$("#payinfo").html(ccmsg+"提交失败:"+data)}})}})


//alipay'发贴地址
$("#apaysub").click(function(){if($("#ausername").val()==''){$("#alipayinfo").html(ccmsg+"请先登陆再提交");$("#login").click();return false}else if($("#apay_zh").val()==''){$("#apay_zh").focus();$("#alipayinfo").html(ccmsg+"请输入网址!");return false}else{$(this).attr("disabled",true);$.get("addtuiguang.asp?action=pay",$("#alipay").serialize(),function(data,textStatus){if(data=="true"){$("#apaysub").removeAttr("disabled");$(".remove").val("");$("#alipayinfo").html(ccmsg+"正在提交中");$("#alipayinfo").html(cgmsg+"提交成功!")}else{$("#apaysub").removeAttr("disabled");$("#alipayinfo").html(ccmsg+"提交失败:"+data)}})}})




//softdown
$("#softdownbtn").click(function(){$.get("/detect.asp?action=softdown",$("#softdown").serialize(),function(data,textStatus){if(data=="true"){$("#softdowninfo").html(cgmsg+"下载成功");window.open (DownUrl);
}else{$("#softdowninfo").html(ccmsg+"今天已经领取过了!")}})})
$("#gamedownbtn").click(function(){$.get("/detect.asp?action=gamedown",$("#gamedown").serialize(),function(data,textStatus){if(data=="true"){$("#gamedowninfo").html(cgmsg+"下载成功");window.open (GameUrl);
}else{$("#gamedowninfo").html(ccmsg+"今天已经领取过了!")}})})
$("#searchurlbtn").click(function(){$.get("/detect.asp?action=search",$("#viewurl").serialize(),function(data,textStatus){if(data=="true"){$("#viewurlinfo").html(cgmsg+"任务完成");window.open (SearchUrl);
}else{$("#viewurlinfo").html(ccmsg+"今天已经领取过了!")}})})
$("#viewurlbtn").click(function(){$.get("/detect.asp?action=view",$("#viewurl").serialize(),function(data,textStatus){if(data=="true"){$("#viewurlinfo").html(cgmsg+"任务完成");window.open (ViewUrl);
}else{$("#viewurlinfo").html(ccmsg+"今天已经领取过了!")}})})
$("#playgamebtn").click(function(){$.get("/detect.asp?action=playgame",$("#playgame").serialize(),function(data,textStatus){if(data=="false"){$("#warm").wBox({title: "宝箱结果",show:true,html:"<div class='warm_n'>请先登录！！</div>"});
}else{$("#warm").wBox({title: "宝箱结果",show:true,html:"<div class='warm_y'>"+data+"</div>"});setTimeout(function(){window.location.reload()},1000)}})})
//CardPay

$("#cardbtn").click(function(){if($("#C_Amount").val()==''){$("#C_Amount").focus();$("#cardpayinfo").html(ccmsg+"面额不能为空！");return false}if($("#C_Amount").val()<5){$("#C_Amount").focus();$("#cardpayinfo").html(ccmsg+"面额不能小于5！");return false}else if($("#C_Amount").val()>500){$("#C_Amount").focus();$("#cardpayinfo").html(ccmsg+"面额不能大于500！");return false}else if($("#C_CardID").val()==''){$("#C_CardID").focus();$("#cardpayinfo").html(ccmsg+"卡号不能为空！");return false}else if($("#C_CardPWD").val()==''){$("#C_CardPWD").focus();$("#cardpayinfo").html(ccmsg+"卡密码不能为空！");return false}else{$(this).attr("disabled",true);$("#cardpayinfo").html(loadmsg+"正在提交充值卡信息");$.get("/pay/payok.asp",$("#cardpay").serialize(),
																																																																																																																																																																															  function(data,textStatus)																																																																																																																																																																	{	
			//alert(data)																																																																																																																																																																															 
																																																																																																																																																																																		 if(data=="true")
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																											   {$("#cardbtn").removeAttr("disabled");$(".remove").val("");
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																											   $("#cardpayinfo").html(cgmsg+"充值信息提交成!")
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																											   }
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																											   else{$("#cardbtn").removeAttr("disabled");$("#cardpayinfo").html(cgmsg+""+data)
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																											   }})}})

//BankPay
$("#bankbtn").click(function(){if($("#B_userid").val()==''){$("#bankpayinfo").html(ccmsg+"请先登陆再进行操作！");return false}else if($("#B_Amount").val()==''){$("#B_Amount").focus();$("#bankpayinfo").html(ccmsg+"请填写要充值的金额！");return false}else if($("#B_Amount").val()>1000){$("#C_Amount").focus();$("#bankpayinfo").html(ccmsg+"一次性充值金额不能大于1000！");return false}else{$("#bankpayinfo").html("");$('#bankpay').submit();$(".remove").val("")}})
//修改资料
$("#Editbtn").click(function(){$("#postinfo").html(loadmsg+"正在提交修改信息");$.get("/detect.asp?action=edituser",$("#memberinfo").serialize(),function(data,textStatus){if(data=="true"){$("#postinfo").html(cgmsg+"帐号资料修改成功!");setTimeout(function(){window.location.reload()},1000)}else{$("#postinfo").html(ccmsg+"帐号资料修改失败:"+data)}})})
//ip
$("#ipbtn").click(function(){if($("#ip_username").val()==''){$("#ip_username").focus();$("#ipinfo").html(ccmsg+"请输入要绑定的会员账户");return false}else if($("#ip_username2").val()==''){$("#ip_username").focus();$("#ipinfo").html(ccmsg+"请再次确认会员账户");return false}else{$(this).attr("disabled",true);$("#ipinfo").html(loadmsg+"正在提交信息");$.get("/detect.asp?action=ipform",$("#ipform").serialize(),function(data,textStatus){if(data=="true"){$("#ipbtn").removeAttr("disabled");$(".remove").val("");$("#ipinfo").html(cgmsg+"IP绑定成功!")}else{$("#ipbtn").removeAttr("disabled");$("#ipinfo").html(ccmsg+"IP绑定失败:"+data)}})}})
//用上部的内容填充下部
$("#member_b").html($("#member_t").html());$("#member_c").bind("mouseover",function(){StopScroll()});$("#member_c").bind("mouseout",function(){StartScroll()});StartScroll()});function StartScroll(){objInterval=setInterval("verticalloop()",interval)}function StopScroll(){window.clearInterval(objInterval)}
//控制滚动
function verticalloop(){
if($("#member_c").scrollTop()>=$("#member_t").outerHeight()){
      $("#member_c").scrollTop($("#member_c").scrollTop()-$("#member_t").outerHeight());
}
$("#member_c").animate({"scrollTop" : $("#member_c").scrollTop()+stepsize +"px"},scrollspeed,function(){
});
}
function startRequest(){$("#postinfo").slideUp("400");$("#postinfo1").slideUp("400");$("#postinfo2").slideUp("400");$("#postinfo3").slideUp("400");$("#postinfo4").slideUp("400");$("#postinfo5").slideUp("400");}
function changeqq(){var minlen=document.getElementById('qq');var qqnumber=document.getElementById('qq').value;if(minlen.value.length<5){document.getElementById('qq_i').innerHTML=ccmsg+"QQ号至少输入5位!";return false}document.getElementById('qq_i').innerHTML="您输入的QQ号是：<b>"+qqnumber+"</b>"}function changeqq2(){var minlen=document.getElementById('qq');var qqnumber=document.getElementById('qq').value;if(minlen.value.length<5){document.getElementById('qq_ii').innerHTML=ccmsg+"QQ号至少输入5位!";return false}document.getElementById('qq_ii').innerHTML="您输入的QQ号是：<b>"+qqnumber+"</b>"}function regqq(){var minlens=document.getElementById('qqs');if(minlens.value==""){document.getElementById('zinfo').innerHTML="";return true}else{if(minlens.value.length<5){document.getElementById('zinfo').innerHTML=ccmsg+"QQ号至少输入5位!";return false}else{document.getElementById('zinfo').innerHTML="";return true}}}
function returnsj(objOption){var objText=objOption.options[objOption.selectedIndex].text;document.getElementById("websj_i").innerHTML=" &nbsp;开通时间为：<b>"+objText+"</b>"}
function isEmail(email){var strEmail=document.getElementById('email').value;if(strEmail.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/)!=-1){document.getElementById('zinfo').innerHTML="";return true}else{document.getElementById('zinfo').innerHTML=ccmsg+"请输入正确邮箱地址!";document.getElementById('email').focus();return true}}