<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<!--#include file="md5.asp"-->
<%
UserID=Trim(Request("ID"))
Action=Trim(Request("ac"))
Password=Trim(Request("pass"))
vip=Trim(Request("vipkh"))
ktvip=Trim(Request("ktvip"))
if ktvip="" then ktvip=0
vip2=Trim(Request("vipkh2"))
Set Rs=Conn.Execute("select * from [user] where userid="&userid&"")
If Rs.eof and Rs.bof Then
  Response.write "<script language=javascript>alert('用户信息出错');window.close();window.opener.location.reload();</script>"
  Response.End 
Else
  UserID=Rs("UserID")
	UserName=Rs("UserName")
	rShowre=Rs("showre")
	usertel=rs("usertel")
   jifen=rs("jifen")
    vipkh=rs("vipkh")
	useradder=rs("useradder")
End if

If Action="add" Then
 
  If Password<>"" Then
  Conn.Execute("update [user] set UserPassword='"&md5(Password)&"',vipkh='"&vip&"' where userid="&userid&"")
     Conn.Execute("update [user] set vipkh='"&vip&"' where userid="&userid&"")
  Response.write "<script language=javascript>alert('密码重置成功！新密码为："&HtmlEnCode(Password)&"');window.close();window.opener.location.reload();</script>"
  else
   Conn.Execute("update [user] set vipkh='"&vip&"',cxmoney="&vip2&",vip="&ktvip&" where userid="&userid&"")
  Response.write "<script language=javascript>alert('设置成功！');window.close();window.opener.location.reload();</script>"

  End if
End if
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css.css" rel="stylesheet" type="text/css">
</head>
<body>

<form name="form1" method="post" action="?ID=<%=userid%>&Ac=add" OnSubmit="return checkdata()" onReset="return ResetForm();">
  <table  width="90%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF">
    <tr > 
      <td colspan="4" align="center" background="images/admin_bg_1.gif"><b><font color="#ffffff">会员[<%=HtmlEnCode(UserName)%>]账户详细信息</font></b></td>
    </tr>
    <tr > 
      <td align="right" valign="top" class="tableBorder">输入新密码：</td>
      <td class="tableBorder">
        <input name="pass" type="text" id="pass" maxlength="20"></td>
    </tr>
    <tr >
      <td align="right" valign="top" class="tableBorder">手机号码：</td>
      <td class="tableBorder"><%=rs("usertel")%></td>
    </tr>
    <tr >
      <td align="right" valign="top">注册时间：</td>
      <td><%= rs("addDate") %></td>
    </tr>
    <tr >
      <td align="right" valign="top">登陆次数：</td>
      <td><%=Conn.Execute("select count(id) from log where user='"&UserName&"'")(0) %></td>
    </tr>
    <tr >
      <td align="right" valign="top">最后登陆IP：</td>
      <td><%=Conn.Execute("select ip from log order by time desc")(0)%></td>
    </tr>
    <tr >
      <td align="right" valign="top">拥有积分：</td>
      <td><%=jifen%></td>
    </tr>
    <tr >
      <td align="right" valign="top">储蓄金额：</td>
      <td><input name="vipkh2" type="text" id="vipkh2" value="<%=rs("cxmoney")%>" maxlength="20">
      </td>
    </tr>
    <tr >
      <td align="right" valign="top">用户邮箱：</td>
      <td><%=rs("UserEmail")%></td>
    </tr>
    <tr >
      <td align="right" valign="top">用户地址：</td>
      <td><%= useradder %></td>
    </tr>
    <tr >
      <td align="right" valign="top">是否开通VIP：</td>
      <td>
        <select name="ktvip" id="ktvip">
          <option value="1" <% If rs("vip")=1 Then %> selected="selected"<% End If %>>开通VIP</option>
          <option value="0" <% If rs("vip")=0 Then %> selected="selected"<% End If %>>取消VIP</option>
        </select>
      </label></td>
    </tr>
    <tr >
      <td align="right" valign="top">会员卡号：</td>
      <td><input name="vipkh" type="text" id="vipkh" value="<%=rs("vipkh")%>" maxlength="20">
      目前只能后台手动给会员发送会员卡</td>
    </tr>
    <tr >
      <td align="right" valign="top">&nbsp;</td>
      <td><input type="submit" value="提交设置" name="Submit" class="unnamed5"></td>
    </tr>
  </table>
</form>
</body>
</html>
