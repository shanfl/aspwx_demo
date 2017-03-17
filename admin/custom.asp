<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<!--#include file="fckeditor/fckeditor.asp"-->
<%
If request.Form("submit") = "确认添加" Then
    If request.Form("custom_name") = "" Then
        response.Write "<script language=javascript>alert(""单页名称不能为空！"");window.history.back();</script>"
        response.End
    End If
    If request.Form("custom_order") = "" Or Not IsNumeric(request.Form("custom_order")) Then
        response.Write "<script language=javascript>alert(""排序数字不能为空而且必须为数字！"");window.history.back();</script>"
        response.End
    End If
    Set rs = server.CreateObject("adodb.recordset")
    sql = "select * from custom"
    rs.Open sql, conn, 1, 3
    rs.addnew
    rs("custom_name") = request.Form("custom_name")
    rs("custom_order") = request.Form("custom_order")
    rs("custom_parent") = request.Form("custom_parent")
    rs("custom_keywords") = request.Form("custom_keywords")
    rs("custom_description") = request.Form("custom_description")
    rs("custom_content") = request.Form("custom_content")
    rs("all_custom_content") = request.Form("all_custom_content")
    rs.update
    rs.Close
    Set rs = Nothing
    conn.Close
    Set conn = Nothing
    response.Write "<script language=javascript>alert(""单页添加成功！"");window.location.href=""custom.asp""</script>"
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
      <h2>修改单页</h2>
    </div>
    <div class="right_body">
      <table>
        <tr>
          <th width="40">ID</th>
          <th width="200">单页名称</th>
          <th width="60">排序数字</th>
          <th>导航调用地址</th>
          <th width="120">修改</th>
        </tr>
        <%
Dim rs, sql, close_rs, rss
Set rs = server.CreateObject("adodb.recordset")
sql = "select * from custom where custom_parent = 0 order by custom_order asc"
rs.Open sql, conn, 1, 1
Do While Not rs.EOF
%>
        <tr align="center">
          <td><%=rs("ID")%></td>
          <td align="left"><span class="red">[主]<%=rs("custom_name")%></span></td>
          <td><span class="red"><%=rs("custom_order")%></span></td>
          <td><a href="../about.asp?id=<%=rs("ID")%>" target="_blank">about.asp?id=<%=rs("ID")%></a></td>
          <td>[<a href="custom_modify.asp?id=<%=rs("ID")%>">修改</a>] [<a href="custom_delete.asp?id=<%=rs("ID")%>" onclick="return confirm('确定要删除此单页吗？删除后将不可恢复！')">删除</a>]</td>
        </tr>
        <%
Set rss = server.CreateObject("adodb.recordset")
sql = "select * from custom where custom_parent = "&rs("ID")&" order by custom_order asc"
rss.Open sql, conn, 1, 1
Do While Not rss.EOF
%>
        <tr align="center">
          <td><%=rss("ID")%></td>
          <td align="left">└<%=rss("custom_name")%></td>
          <td><%=rss("custom_order")%></td>
          <td><a href="../about.asp?id=<%=rss("ID")%>" target="_blank">about.asp?id=<%=rss("ID")%></a></td>
          <td>[<a href="custom_modify.asp?id=<%=rss("ID")%>">修改</a>] [<a href="custom_delete.asp?id=<%=rss("ID")%>" onclick="return confirm('确定要删除此单页吗？删除后将不可恢复！')">删除</a>]</td>
        </tr>
        <%
rss.movenext
Loop
rss.Close
Set rss = Nothing
rs.movenext
Loop
rs.Close
Set rs = Nothing
%>
      </table>
    </div>
    <div class="right_title">
      <h2>添加单页</h2>
    </div>
    <div class="right_body">
      <table width="100%">
        <form method="post">
          <tr>
            <td width="72" align="center">单页名称：</td>
            <td width="701"><input name="custom_name" type="text" size="40" />
              <span class="red">必填</span></td>
          </tr>
          <tr>
            <td align="center">排序数字：</td>
            <td><input name="custom_order" type="text" size="10" />
              <span class="red">必填且必须为数字！</span></td>
          </tr>
          <tr>
            <td align="center">所属单页：</td>
            <td><select name="custom_parent">
                <option value="0">作为主单页</option>
                <%
Set rs = server.CreateObject("adodb.recordset")
sql = "select * from custom where custom_parent = 0 order by custom_order"
rs.Open sql, conn, 1, 1
Do While Not rs.EOF
    response.Write("<option value='"&rs("ID")&"'>"&rs("custom_name")&"</option>")
    rs.movenext
Loop
rs.Close
Set rs = Nothing
conn.Close
Set conn = Nothing
%>
              </select></td>
          </tr>
          <tr>
            <td align="center">关键字：</td>
            <td><input name="custom_keywords" type="text" size="100" value="请尽量填写有助于搜索引擎收录" onfocus="if (value =='请尽量填写有助于搜索引擎收录'){value =''}" onblur="if (value ==''){value='请尽量填写有助于搜索引擎收录'}" /></td>
          </tr>
          <tr>
            <td align="center">关键描述：</td>
            <td><input name="custom_description" type="text" size="100" value="请尽量填写有助于搜索引擎收录" onfocus="if (value =='请尽量填写有助于搜索引擎收录'){value =''}" onblur="if (value ==''){value='请尽量填写有助于搜索引擎收录'}" /></td>
          </tr>
          <tr style="display:none">
            <td align="center">部分内容：</td>
            <td><%
Set oFCKeditor = New FCKeditor
oFCKeditor.BasePath = "fckeditor/"
oFCKeditor.ToolbarSet = "Default"
oFCKeditor.Width = "100%"
oFCKeditor.Height = "180"
oFCKeditor.Value = ""
oFCKeditor.Create "custom_content"
%></td>
          </tr>
          <tr>
            <td align="center">全部内容：</td>
            <td><%
Set oFCKeditor = New FCKeditor
oFCKeditor.BasePath = "fckeditor/"
oFCKeditor.ToolbarSet = "Default"
oFCKeditor.Width = "100%"
oFCKeditor.Height = "260"
oFCKeditor.Value = ""
oFCKeditor.Create "all_custom_content"
%></td>
          </tr>
          <tr align="center">
            <td colspan="2"><p class="center">
                <input type="submit" name="submit" class="submit_button" value="确认添加" />
              </p></td>
          </tr>
        </form>
      </table>
    </div>
  </div>
  <div class="clear"></div>
</div>
<!--#include file="footer.asp"-->