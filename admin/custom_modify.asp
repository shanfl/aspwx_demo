<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<!--#include file="fckeditor/fckeditor.asp"-->
<%
Dim rs, sql
If request.QueryString("id") = "" Or Not IsNumeric(request.QueryString("id")) Then
    response.Write "<script language=javascript>alert(""非法操作！"");window.history.back();</script>"
    response.End
End If
If request.Form("submit") = "确认修改" Then
    If request.Form("custom_name") = "" Then
        response.Write "<script language=javascript>alert(""单页名称不能为空！"");window.history.back();</script>"
        response.End
    End If
    If request.Form("custom_order") = "" Or Not IsNumeric(request.Form("custom_order")) Then
        response.Write "<script language=javascript>alert(""排序数字不能为空而且必须为数字！"");window.history.back();</script>"
        response.End
    End If
    If request.Form("all_custom_content") = "" Then
        response.Write "<script language=javascript>alert(""详细内容不能为空！"");window.history.back();</script>"
        response.End
    End If
    Set rs = server.CreateObject("adodb.recordset")
    sql = "select * from custom where id = "&request.QueryString("id")&""
    rs.Open sql, conn, 1, 3
    rs("custom_name") = request.Form("custom_name")
    rs("custom_order") = request.Form("custom_order")
    rs("custom_keywords") = request.Form("custom_keywords")
    rs("custom_description") = request.Form("custom_description")
    rs("custom_content") = request.Form("custom_content")
    rs("all_custom_content") = request.Form("all_custom_content")
    rs.update
    rs.Close
    Set rs = Nothing
    conn.Close
    Set conn = Nothing
    response.Write("<script type=""text/javascript"">alert(""单页修改成功！"");location.href=""custom.asp""</script>")
    response.End()
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
      <h2>修改单页</h2>
    </div>
    <div class="right_body">
      <table align="center">
        <%
Set rs = server.CreateObject("adodb.recordset")
sql = "select * from custom where id = "&request.QueryString("id")&""
rs.Open sql, conn, 1, 1
If rs.EOF Then
    rs.Close
    Set rs = Nothing
    conn.Close
    Set conn = Nothing
    response.Write "<script language=javascript>alert(""不存在此数据！"");window.history.back();</script>"
    response.End
End If
%>
        <form method="post">
          <tr>
            <td width="71" align="center">单页名称：</td>
            <td width="703"><input name="custom_name" type="text" size="40" value="<%=rs("custom_name")%>" />
              <span class="red">必填</span></td>
          </tr>
          <tr>
            <td align="center">排序数字：</td>
            <td><input name="custom_order" type="text" size="10" value="<%=rs("custom_order")%>" />
              <span class="red">必填且必须为数字！</span></td>
          </tr>
          <tr>
            <td align="center">关键字：</td>
            <td><input name="custom_keywords" type="text" size="100" value="<%=rs("custom_keywords")%>" /></td>
          </tr>
          <tr>
            <td align="center">关键描述：</td>
            <td><input name="custom_description" type="text" size="100" value="<%=rs("custom_description")%>" /></td>
          </tr>
          <tr style="display:none">
            <td align="center">部分内容：<br /></td>
            <td>
            <%
Set oFCKeditor = New FCKeditor
oFCKeditor.BasePath = "fckeditor/"
oFCKeditor.ToolbarSet = "Default"
oFCKeditor.Width = "100%"
oFCKeditor.Height = "180"
oFCKeditor.Value = rs("custom_content")
oFCKeditor.Create "custom_content"
%></td>
          </tr>
          <tr>
            <td align="center">全部内容：</td>
            <td>
            <%
Set oFCKeditor = New FCKeditor
oFCKeditor.BasePath = "fckeditor/"
oFCKeditor.ToolbarSet = "Default"
oFCKeditor.Width = "100%"
oFCKeditor.Height = "260"
oFCKeditor.Value = rs("all_custom_content")
oFCKeditor.Create "all_custom_content"
%></td>
          </tr>
          <tr align="center">
            <td colspan="2"><p class="center">
                <input type="submit" name="submit" class="submit_button" value="确认修改" />
              </p></td>
          </tr>
        </form>
        <%
rs.Close
Set rs = Nothing
conn.Close
Set conn = Nothing
%>
      </table>
    </div>
  </div>
  <div class="clear"></div>
</div>
<!--#include file="footer.asp"-->
