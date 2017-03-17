<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<%
If request.Form("submit") = "确认添加" Then
    If request.Form("nav_name") = "" Then
        response.Write "<script language=javascript>alert(""导航名称不能为空！"");window.history.back();</script>"
        response.End
    End If
    If request.Form("nav_url") = "" Then
        response.Write "<script language=javascript>alert(""链接名称不能为空！"");window.history.back();</script>"
        response.End
    End If
    If request.Form("nav_order") = "" Or Not IsNumeric(request.Form("nav_order")) Then
        response.Write "<script language=javascript>alert(""排序名称不能为空！"");window.history.back();</script>"
        response.End
    End If
    Set rs = server.CreateObject("adodb.recordset")
    sql = "select * from nav"
    rs.Open sql, conn, 1, 3
    rs.addnew
    rs("nav_name") = request.Form("nav_name")
    rs("nav_url") = request.Form("nav_url")
    rs("nav_order") = request.Form("nav_order")
    rs("nav_open") = request.Form("nav_open")
    rs("nav_display") = True
    rs.update
    rs.Close
    Set rs = Nothing
    conn.Close
    Set conn = Nothing
    response.Write "<script language=javascript>alert(""导航栏添加成功"");window.location.href=""nav.asp""</script>"
    response.End
End If
If request.Form("submit") = "修改" Then
    If request.Form("nav_name") = "" Then
        response.Write "<script language=javascript>alert(""导航名称不能为空！"");window.history.back();</script>"
        response.End
    End If
    If request.Form("nav_url") = "" Then
        response.Write "<script language=javascript>alert(""链接名称不能为空！"");window.history.back();</script>"
        response.End
    End If
    If request.Form("nav_order") = "" Or Not IsNumeric(request.Form("nav_order")) Then
        response.Write "<script language=javascript>alert(""排序名称不能为空！"");window.history.back();</script>"
        response.End
    End If
    Set rs = server.CreateObject("adodb.recordset")
    sql = "select * from nav where id="&request.Form("ID")&""
    rs.Open sql, conn, 1, 3
    rs("nav_name") = request.Form("nav_name")
    rs("nav_url") = request.Form("nav_url")
    rs("nav_order") = request.Form("nav_order")
    rs("nav_open") = request.Form("nav_open")
    rs("nav_display") = request.Form("nav_display")
    rs.update
    rs.Close
    Set rs = Nothing
    conn.Close
    Set conn = Nothing
    response.Write "<script language=javascript>alert(""导航栏修改成功"");window.location.href=""nav.asp""</script>"
    response.End
End If
If request.Form("submit") = "删除" Then
    Set rs = server.CreateObject("adodb.recordset")
    sql = "select * from nav where id="&request.Form("ID")&""
    rs.Open sql, conn, 1, 3
    rs.Delete
    rs.update
    rs.Close
    Set rs = Nothing
    conn.Close
    Set conn = Nothing
    response.Write "<script language=javascript>alert(""导航栏删除成功"");window.location.href=""nav.asp""</script>"
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
      <h2>修改导航栏</h2>
    </div>
    <div class="right_body">
      <table width="99%" align="center">
        <tr>
          <th width="122">导航名称</th>
          <th width="183">链接地址</th>
          <th width="75">排序数字</th>
          <th width="88">打开方式</th>
          <th width="78">是否显示</th>
          <th width="137">修改操作</th>
        </tr>
        <%
Dim rs, sql
Set rs = server.CreateObject("adodb.recordset")
sql = "select * from nav order by nav_order"
rs.Open sql, conn, 1, 1
Do While Not rs.EOF
%>
        <form method="post">
          <tr align="center">
            <td><input type="hidden" name="ID" value="<%=rs("ID")%>" />
              <input name="nav_name" class="ce" type="text" size="10" value="<%=rs("nav_name")%>" /></td>
            <td><input name="nav_url" class="ce" type="text" size="25" value="<%=rs("nav_url")%>" /></td>
            <td><input name="nav_order" class="ce" type="text" size="5" value="<%=rs("nav_order")%>" /></td>
            <td><select name="nav_open">
                <option value="_self"<%If rs("nav_open") = "_self" Then%>selected="selected"<%End If%>>原窗口</option>
                <option value="_blank"<%If rs("nav_open") = "_blank" Then%>selected="selected"<%End If%>>新窗口</option>
              </select></td>
            <td><select name="nav_display">
                <option value="true"<%If rs("nav_display") = True Then%>selected="selected"<%End If%>>显示</option>
                <option value="false"<%If rs("nav_display") = false Then%>selected="selected"<%End If%>>隐藏</option>
              </select></td>
            <td><input name="submit" type="submit" value="修改" />
              <input name="submit" type="submit" value="删除" onclick="return confirm('确定要删除此导航栏吗？')" /></td>
          </tr>
        </form>
        <%
rs.movenext
Loop
rs.close
set rs=nothing
conn.Close
Set conn = Nothing
%>
      </table>
    </div>
    <div class="right_title">
      <h2>添加导航栏</h2>
    </div>
    <div class="right_body">
      <table>
        <form method="post">
          <tr>
            <td width="80" align="center">导航名称：</td>
            <td><input name="nav_name" type="text" size="20" />
              <span class="red">必填</span></td>
          </tr>
          <tr>
            <td align="center">链接地址：</td>
            <td><input name="nav_url" type="text" size="60" />
              <span class="red">必填 外部地址请完整填写包含&ldquo;http://&rdquo;</span></td>
          </tr>
          <tr>
            <td align="center">排序：</td>
            <td><input name="nav_order" type="text" size="10" />
              <span class="red">必填且必须为数字！</span></td>
          </tr>
          <tr>
            <td align="center">打开方式：</td>
            <td><select name="nav_open">
                <option value="_self">原窗口</option>
                <option value="_blank">新窗口</option>
              </select></td>
          </tr>
          <tr align="center">
            <td colspan="2"><input name="submit" type="submit" class="submit_button" value="确认添加" /></td>
          </tr>
        </form>
      </table>
    </div>
  </div>
  <div class="clear"></div>
</div>
<!--#include file="footer.asp"-->
