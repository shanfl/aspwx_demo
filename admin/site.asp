<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<%
If request.Form("submit") = "确认修改" Then
    Set rs = server.CreateObject("adodb.recordset")
    sql = "select * from site"
    rs.Open sql, conn, 1, 3
    rs("site_name") = request.Form("site_name")
    rs("site_contact") = request.Form("site_contact")
    rs("site_tel") = request.Form("site_tel")
	 rs("site_mobile") = request.Form("site_mobile")
    rs("site_fax") = request.Form("site_fax")
    rs("site_qq") = request.Form("site_qq")
    rs("site_msn") = request.Form("site_msn")
    rs("site_email") = request.Form("site_email")
    rs("site_url") = request.Form("site_url")
    rs("site_address") = request.Form("site_address")
    rs("site_keywords") = request.Form("site_keywords")
    rs("site_description") = request.Form("site_description")
    rs("site_icp") = request.Form("site_icp")
    rs("site_hits") = request.Form("site_hits")
    rs("site_copyright") = request.Form("site_copyright")
    rs("site_code") = request.Form("site_code")
    rs("site_information") = request.Form("site_information")
	rs("sydtid") = request.Form("sydtid")
	rs("aid") = request.Form("aid")
	rs("dpid") = request.Form("dpxx")
	rs("fqh") = request.Form("fqh")
	rs("fqm") = request.Form("fqm")
	rs("sqh") = request.Form("sqh")
	rs("yzm") = request.Form("yzm")
	rs("smsu") = request.Form("smsu")
	rs("smsh") = request.Form("smsh")
	rs("smsm") = request.Form("smsm")
	rs("smsnr") = request.Form("smsnr")
    rs.update
    rs.Close
    Set rs = Nothing
    conn.Close
    Set conn = Nothing
    response.Write("<script type=""text/javascript"">alert(""网页设置成功"");location.href=""site.asp""</script>")
    response.End()
End If
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>汇优券预定点单后台管理系统</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!--#include file="header.asp"-->
<div id="top_banner" class="layout"></div>
<div id="content" class="layout">
  <!--#include file="left.asp"-->
  <div id="right">
    <div class="right_title" >
      <h2>系统设置</h2>
    </div>
    <div class="right_body" >
      <table align="center">
<%
Dim rs, sql
Set rs = server.CreateObject("adodb.recordset")
sql = "select * from site"
rs.Open sql, conn, 1, 1
%>
        <form name="cherry" method="post">
          <tr>
            <td width="126" align="right">网站标题：</td>
            <td colspan="2"><input name="site_name" type="text" size="80" value="<%=rs("site_name")%>" /></td>
          </tr>
          <tr style="display:none">
            <td align="right">联系人：</td>
            <td colspan="2"><input name="site_contact" type="text" size="30" value="<%=rs("site_contact")%>" /></td>
          </tr>
          <tr>
            <td align="right">客服热线：</td>
            <td colspan="2"><input name="site_tel" type="text" size="40" value="<%=rs("site_tel")%>" /></td>
          </tr>
          <tr>
            <td align="right">飞信登陆帐号：</td>
            <td colspan="2"><input name="site_mobile" type="text" size="40" value="<%=rs("site_mobile")%>" /></td>
          </tr>
          <tr>
            <td align="right">飞信登陆密码：</td>
            <td colspan="2"><input name="site_fax" type="text" size="40" value="<%=rs("site_fax")%>" /></td>
          </tr>
          <tr >
            <td align="right">邮箱服务名：</td>
            <td colspan="2"><input name="site_qq" type="text" size="30" value="<%=rs("site_qq")%>" />
            如：邮件发送服务器域名smtp.163.com</td>
          </tr>
          <tr >
            <td align="right">邮箱登陆名：</td>
            <td colspan="2"><input name="site_msn" type="text" size="35" value="<%=rs("site_msn")%>" />
            aaa@163.com</td>
          </tr>
          <tr >
            <td align="right">邮箱登陆密码：</td>
            <td colspan="2"><input name="site_email" type="text" size="35" value="<%=rs("site_email")%>" /></td>
          </tr>
            <tr >
            <td align="right">收件人邮箱：</td>
            <td colspan="2"><input name="site_icp" type="text" size="30" value="<%=rs("site_icp")%>" />
            913968520@qq.com</td>
          </tr>
          <tr>
            <td align="right">发信人QQ号：</td>
            <td colspan="2"><input name="fqh" type="text" id="fqh" value="<%=rs("fqh")%>" size="40" />
            *请不要在网址后面加&ldquo;/&rdquo;符号</td>
          </tr>
          <tr>
            <td align="right">发信人QQ密码：</td>
            <td colspan="2"><input name="fqm" type="text" id="fqm" value="<%=rs("fqm")%>" size="40" /></td>
          </tr>
          <tr>
            <td align="right">收信人QQ号：</td>
            <td colspan="2"><input name="sqh" type="text" id="sqh" value="<%=rs("sqh")%>" size="40" /></td>
          </tr>
          <tr >
            <td align="right">收信方式：</td>
            <td colspan="2">
              <input name="aid" type="radio" id="radio" value="1" <% If rs("aid")=1 Then %>checked="checked" <% End If %>/>
              飞信短信
                  <input type="radio" name="aid" id="radio2" value="2" <% If rs("aid")=2 Then %>checked="checked" <% End If %>/>
                  邮箱收信

                  <input type="radio" name="aid" id="radio3" value="3" <% If rs("aid")=3 Then %>checked="checked" <% End If %>/>
              QQ收信
            ===为了提高速度只需要选择一种方式/不选则无收信方式</td>
          </tr>
          <tr>
            <td align="right">网　　址：</td>
            <td colspan="2"><input name="site_url" type="text" id="site_url" value="<%=rs("site_url")%>" size="40" />
              *请不要在网址后面加&ldquo;/&rdquo;符号</td>
          </tr>
          <tr>
            <td align="right">地　　址：</td>
            <td colspan="2"><input name="site_address" type="text" size="100" value="<%=rs("site_address")%>" /></td>
          </tr>
          <tr >
            <td align="right">地图指引：</td>
            <td colspan="2"><input name="site_keywords" type="text" size="100" value="<%=rs("site_keywords")%>" /></td>
          </tr>
          <tr >
            <td align="right">关键字描述：</td>
            <td colspan="2"><input name="site_description" type="text" size="100" value="<%=rs("site_description")%>" /></td>
          </tr>
        
          <tr >
            <td align="right">短信验证开关：</td>
            <td width="27"><input name="yzm" type="checkbox" id="yzm" value="1" <% If rs("yzm")="1" Then %>checked="checked" <% End If %>/></td>
            <td width="617"><table border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="18%" align="center">用户名</td>
                <td width="18%" align="center">密码</td>
                <td width="13%" align="center">商户ID</td>
                <td width="51%" align="center">发送内容</td>
                </tr>
              <tr>
                <td align="left"><input name="smsh" type="text" id="smsh" value="<%=rs("smsh")%>" size="15" /></td>
                <td width="18%" align="left"><input name="smsm" type="text" id="smsm" value="<%=rs("smsm")%>" size="15" /></td>
                <td width="13%" align="left"><input name="smsu" type="text" id="smsu" value="<%=rs("smsu")%>" size="10" /></td>
                <td align="left"><input name="smsnr" type="text" id="smsnr" value="<%=rs("smsnr")%>" size="40" /></td>
                </tr>
            </table></td>
          </tr>
          <tr >
            <td align="right">首页动态隐藏：</td>
            <td colspan="2"><input name="sydtid" type="checkbox" id="sydtid" value="1" <% If rs("sydtid")="1" Then %>checked="checked" <% End If %>/></td>
          </tr>
          <tr >
            <td align="right">店铺自动休息：</td>
            <td colspan="2"><input name="dpxx" type="checkbox" id="dpxx" value="1" <% If rs("dpid")="1" Then %>checked="checked" <% End If %>/></td>
          </tr>
          <tr >
            <td align="right">限制电脑访问：</td>
            <td colspan="2">
        <input name="site_copyright" type="checkbox" id="site_copyright" value="1" <% If rs("site_copyright")="1" Then %>checked="checked" <% End If %>/>
                            

          </td>
          </tr>
          <tr>
            <td align="right">微信回复的第一张图：</td>
            <td colspan="2"><input name="site_code" type="text" size="100" value="<%=rs("site_code")%>" /></td>
          </tr>
          <tr >
            <td align="right">通用信息：</td>
            <td colspan="2">
            <textarea name="site_Information" cols="95" rows="8" ><%=rs("site_information")%></textarea></td>
          </tr>
          <tr>
            <td colspan="3" align="center"><input name="submit" type="submit" class="submit_button" value="确认修改" /></td>
          </tr>
        </form>
<%
rs.close
set rs = nothing
conn.Close
Set conn = Nothing
%>
      </table>
    </div>
  </div>
  <div class="clear"></div>
</div>
<!--#include file="footer.asp"-->
