<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<!--#include file="md5.asp"-->
<%
If request.Form("submit") = "添加管理员" Then
    Set rs = server.CreateObject("adodb.recordset")
    sql = "select * from admin where user_name='"&request.Form("user_name")&"'"
    rs.Open sql, conn, 1, 1
    If Not rs.EOF Then
        rs.Close
        Set rs = Nothing
        conn.Close
        Set conn = Nothing
        response.Write "<script language=javascript>alert(""已经存在此管理员！请更换用户名！"");window.history.back();</script>"
        response.End
    End If
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
    sql = "select * from admin"
    rs.Open sql, conn, 1, 3
    rs.addnew
    rs("user_name") = request.Form("user_name")
    rs("password") = md5(request.Form("password"))
    rs.update
    rs.Close
    Set rs = Nothing
    conn.Close
    Set conn = Nothing
    response.Write "<script language=javascript>alert(""管理员添加成功！"");window.location.href=""admin.asp""</script>"
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
        <tr>
          <th width="40">ID</th>
          <th width="424">用户名</th>
          <th width="231">操作</th>
        </tr>
        <%
Set rs = server.CreateObject("adodb.recordset")
sql = "select * from admin order by ID"
rs.Open sql, conn, 1, 1
Do While Not rs.EOF
%>
        <tr align="center">
          <td><%=rs("ID")%></td>
          <td><%=rs("user_name")%></td>
          <td>[<a href="admin_modify.asp?id=<%=rs("id")%>">修改</a>][<a href="admin_delete.asp?id=<%=rs("ID")%>"onclick="return confirm('确定要删除此管理员吗？删除后将不可恢复！')">删除</a>]</td>
        </tr>
        <%
rs.movenext
Loop
rs.Close
Set rs = Nothing
%>
      </table>
    </div>
    <div class="right_title">
      <h2>添加管理员</h2>
    </div>
    <div class="right_body">
      <table class="table">
        <form method="post" action="admin.asp">
          <tr>
            <td width="80" align="center">用户姓名：</td>
            <td><input name="user_name" type="text" size="40" maxlength="60" />
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
            <span class="red">*必填</span></td>
          </tr>
          <tr align="center">
            <td colspan="2"><input name="submit" type="submit" class="submit_button" value="添加管理员" /></td>
          </tr>
        </form>
      </table>
    </div>
  </div>
  <div class="clear"></div>
</div>
<!--#include file="footer.asp"-->
