<!--#include file="conn.asp"-->
<!--#include file="md5.asp"-->
<!--#include file="seeion.asp"-->
<%
If request.QueryString("id") = "" Or Not IsNumeric(request.QueryString("id")) Then
    response.Write "<script language=javascript>alert(""非法操作！"");window.history.back();</script>"
    response.End
End If
If request.Form("submit") = "修改资料" Then
    If request.Form("user_name") = "" Then
        response.Write "<script language=javascript>alert(""用户名不能为空！"");window.history.back();</script>"
        response.End
    End If
    If request.Form("password") = "" Then
        response.Write "<script language=javascript>alert(""密码不能为空！"");window.history.back();</script>"
        response.End
    End If
    If request.Form("password") <> request.Form("password_again") Then
        response.Write "<script language=javascript>alert(""您两次输入的密码不一致！请重新输入！"");window.history.back();</script>"
        response.End
    End If
    Set rs = server.CreateObject("adodb.recordset")
    sql = "select * from admin where id="&request.QueryString("ID")&""
    rs.Open sql, conn, 1, 3
    rs("user_name") = request.Form("user_name")
    rs("password") = md5(request.Form("password"))
    rs.update
    rs.Close
    Set rs = Nothing
    conn.Close
    Set conn = Nothing
    response.Write "<script language=javascript>alert(""管理员修改成功！"");window.location.href=""admin.asp""</script>"
    response.End
End If
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>网站后台管理系统</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!--#include file="header.asp"-->
<div id="top_banner" class="layout"></div>
<div id="content" class="layout">
  <!--#include file="left.asp"-->
  <div id="right">
    <div class="right_title">
      <h2>管理员管理</h2>
    </div>
    <div class="right_body">
      <table class="table">
        <form method="post">
          <%
Set rs = server.CreateObject("adodb.recordset")
sql = "select * from admin where ID = "&request.QueryString("ID")&""
rs.Open sql, conn, 1, 1
%>
          <tr>
            <td width="80" align="center">用户姓名：</td>
            <td><input name="user_name" type="text" size="40" maxlength="60" value="<%=rs("user_name")%>" />
              <span class="red">*必填</span></td>
          </tr>
          <tr>
            <td align="center">密　　码：</td>
            <td><input name="password" type="password" size="40" maxlength="16" />
              <span class="red">*必填</span></td>
          </tr>
          <tr>
            <td align="center">确认密码：</td>
            <td><input name="password_again" type="password" size="40" maxlength="16" />
            <span class="red">*</span><span class="red">必填</span></td>
          </tr>
          <tr align="center">
            <td colspan="2"><input name="submit" type="submit" class="submit_button" value="修改资料" /></td>
          </tr>
        </form>
      </table>
    </div>
  </div>
  <div class="clear"></div>
</div>
<!--#include file="footer.asp"-->
