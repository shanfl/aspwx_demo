<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<%
main_id = request("main_id")
If request("submit") = "修改分类" Then
    If Not IsNumeric(request("order_id")) Then
        response.Write("<script>alert(""排序字符必须为数字！""); history.back();</script>")
        response.End()
    End If
    Set rs = server.CreateObject("adodb.recordset")
    sql = "select * from products_category_main where main_id="&main_id
    rs.Open sql, conn, 1, 3
    rs("main_title") = request.Form("main_title")
    rs("order_id") = request.Form("order_id")
    rs.update
    rs.Close
    Set rs = Nothing
    conn.Close
    Set conn = Nothing
    response.Write "<script language=javascript>alert(""修改分类成功！"");window.location.href=""CategoryManagement.asp""</script>"
    response.End
End If
If request("act") = "del" Then
    Set rs = server.CreateObject("adodb.recordset")
    sql = "select * from products_category_main where main_id="&main_id
    rs.Open sql, conn, 1, 3
    rs.Delete
    rs.update
    rs.Close
    Set rs = Nothing
    conn.Close
    Set conn = Nothing
    response.Write "<script language=javascript>alert(""删除分类成功！"");window.location.href=""CategoryManagement.asp""</script>"
    response.End
End If
If request.Form("submit") = "添加分类" Then
    If request.Form("main_title") = "" Then
        response.Write "<script language=javascript>alert(""分类名称不能为空！"");window.history.back();</script>"
        response.End
    End If
    If request.Form("order_id") = "" Or Not IsNumeric(request.Form("order_id")) Then
        response.Write "<script language=javascript>alert(""排序数字不能为空！而且必须为数字！"");window.history.back();</script>"
        response.End
    End If
    Set rs = server.CreateObject("adodb.recordset")
    sql = "select * from products_category_main"
    rs.Open sql, conn, 1, 3
    rs.addnew
    rs("main_title") = request.Form("main_title")
    rs("order_id") = request.Form("order_id")
    rs.update
    rs.Close
    Set rs = Nothing
    conn.Close
    Set conn = Nothing
    response.Write "<script language=javascript>alert(""分类添加成功！"");window.location.href=""CategoryManagement.asp""</script>"
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
      <h2>主分类调整</h2>
    </div>
    <div class="right_body">
      <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="42%" align="center">分类名称</td>
            <td width="21%" align="center">排序</td>
            <td width="37%" align="center">修改删除操作</td>
          </tr>
          <%
set rs = server.CreateObject("adodb.recordset")
sql = "select * from products_category_main order by order_id "
rs.open sql,conn,1,1
If rs.EOF Then
    response.Write "<font style=color:#F00;>&nbsp;暂无主分类！</font>"
Else
    Do While Not rs.EOF
%>
        <form method="post">
          <tr>
            <td align="center"><input name="main_id" type="hidden" value="<%=rs("main_id")%>" />
              <input type="text" class="ce" name="main_title" value="<%=rs("main_title")%>"/>
              <input name="ckpc" type="button" value="查看对应产品" onclick="javascript:window.location.href='ManagementProducts.asp?flid=<%=rs("main_id")%>';" /></td>
            <td align="center"><input name="order_id" class="ce" type="text" value="<%=rs("order_id")%>" size="6"/></td>
            <td align="center"><input type="submit" name="submit" value="修改分类" />
            <input name="delete" type="button" value="删除" onclick="javascript:if(confirm('确定要删除此分类吗？删除后不可恢复!')){window.location.href='CategoryManagement.asp?act=del&amp;main_id=<%=rs("main_id")%>';}else{history.go(0);}" /></td>
          </tr>
        </form>
          <%
rs.movenext
Loop
End If
rs.Close
Set rs = Nothing
%>
      </table>
    </div>
    <div class="right_title">
      <h2>添加主分类</h2>
    </div>
    <div class="right_body">
      <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
        <form method="post" name="CategoryManagement">
          <tr>
            <td width="13%" align="center">分类名称：</td>
            <td width="87%"><input name="main_title" type="text" size="30" /></td>
          </tr>
          <tr>
            <td align="center">排　　序：</td>
            <td><input name="order_id" type="text" size="5" /></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><input type="submit" name="submit" value="添加分类" /></td>
          </tr>
        </form>
      </table>
    </div>
  </div>
  <div class="clear"></div>
</div>
<!--#include file="footer.asp"-->
