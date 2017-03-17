<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<%
If request.Form("submit") = "确认添加" Then
    If request.Form("uploadfile") = "" Then
        response.Write "<script language=javascript>alert(""请输入图片地址或上传图片！"");window.history.back();</script>"
        response.End
    End If
    If request.Form("banner_url") = "" Then
        response.Write "<script language=javascript>alert(""链接地址不能为空！"");window.history.back();</script>"
        response.End
    End If
    If request.Form("banner_order") = "" Or Not IsNumeric(request.Form("banner_order")) Then
        response.Write "<script language=javascript>alert(""排序数字不能为空！而且必须为数字！"");window.history.back();</script>"
        response.End
    End If
    Set rs = server.CreateObject("adodb.recordset")
    sql = "select * from banner"
    rs.Open sql, conn, 1, 3
    rs.addnew
    rs("banner_name") = request.Form("banner_name")
    rs("uploadfile") = request.Form("uploadfile")
    rs("banner_url") = request.Form("banner_url")
    rs("banner_order") = request.Form("banner_order")
    rs.update
    rs.Close
    Set rs = Nothing
    conn.Close
    Set conn = Nothing
    response.Write "<script language=javascript>alert(""幻灯添加成功！"");window.location.href=""banner.asp""</script>"
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
      <h2>修改幻灯片</h2>
    </div>
    <div class="right_body">
      <table>
        <tr>
          <th width="220">图片预览</th>
          <th>幻灯名称</th>
          <th width="40">排序</th>
          <th width="200">链接地址</th>
          <th width="120">修改操作</th>
        </tr>
        <%
Set rs = server.CreateObject("adodb.recordset")
sql = "select * from banner order by banner_order"
rs.Open sql, conn, 1, 1
Do While Not rs.EOF
%>
        <tr align="center">
          <td><img src="../<%=rs("uploadfile")%>" width="200" height="40" /></td>
          <td><%=rs("banner_name")%></td>
          <td><%=rs("banner_order")%></td>
          <td><%=rs("banner_url")%></td>
          <td>[<a href="banner_modify.asp?id=<%=rs("ID")%>">修改</a>] [<a href="banner_delete.asp?id=<%=rs("ID")%>" onclick="return confirm('确定要删除此幻灯吗？')">删除</a>]</td>
        </tr>
        <%
rs.movenext
Loop
rs.Close
Set rs = Nothing
conn.Close
Set conn = Nothing
%>
      </table>
    </div>
    <div class="right_title">
      <h2>添加幻灯片</h2>
    </div>
    <div class="right_body">
      <table class="table">
        <form name="cherry" method="post">
          <tr>
            <td width="80" align="center">文字说明：</td>
            <td><input name="banner_name" type="text" size="40" /></td>
          </tr>
          <tr>
            <td rowspan="2" align="center">动画图片：</td>
            <td><input type="text" name="uploadfile" size="40" />
              <span class="red">请输入图片地址，或直接上传。</span></td>
          </tr>
          <tr>
            <td><iframe src="upload.asp" width="500" height="25" scrolling="Auto" frameborder="0"></iframe></td>
          </tr>
          <tr>
            <td align="center">链接地址：</td>
            <td><input name="banner_url" type="text" size="80"/></td>
          </tr>
          <tr>
            <td align="center">排　　序：</td>
            <td><input name="banner_order" type="text" size="10"/></td>
          </tr>
          <tr>
            <td colspan="2"><p class="submit">
              <input name="submit" type="submit" value="确认添加" />
            </p></td>
          </tr>
        </form>
      </table>
    </div>
  </div>
  <div class="clear"></div>
</div>
<!--#include file="footer.asp"-->
