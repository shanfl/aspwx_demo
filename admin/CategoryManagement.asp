<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<%
main_id = request("main_id")
If request("submit") = "�޸ķ���" Then
    If Not IsNumeric(request("order_id")) Then
        response.Write("<script>alert(""�����ַ�����Ϊ���֣�""); history.back();</script>")
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
    response.Write "<script language=javascript>alert(""�޸ķ���ɹ���"");window.location.href=""CategoryManagement.asp""</script>"
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
    response.Write "<script language=javascript>alert(""ɾ������ɹ���"");window.location.href=""CategoryManagement.asp""</script>"
    response.End
End If
If request.Form("submit") = "��ӷ���" Then
    If request.Form("main_title") = "" Then
        response.Write "<script language=javascript>alert(""�������Ʋ���Ϊ�գ�"");window.history.back();</script>"
        response.End
    End If
    If request.Form("order_id") = "" Or Not IsNumeric(request.Form("order_id")) Then
        response.Write "<script language=javascript>alert(""�������ֲ���Ϊ�գ����ұ���Ϊ���֣�"");window.history.back();</script>"
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
    response.Write "<script language=javascript>alert(""������ӳɹ���"");window.location.href=""CategoryManagement.asp""</script>"
    response.End
End If

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��վ��̨����ϵͳ</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!--#include file="header.asp"-->
<div id="top_banner" class="layout"></div>
<div id="content" class="layout">
  <!--#include file="left.asp"-->
  <div id="right">
    <div class="right_title">
      <h2>���������</h2>
    </div>
    <div class="right_body">
      <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="42%" align="center">��������</td>
            <td width="21%" align="center">����</td>
            <td width="37%" align="center">�޸�ɾ������</td>
          </tr>
          <%
set rs = server.CreateObject("adodb.recordset")
sql = "select * from products_category_main order by order_id "
rs.open sql,conn,1,1
If rs.EOF Then
    response.Write "<font style=color:#F00;>&nbsp;���������࣡</font>"
Else
    Do While Not rs.EOF
%>
        <form method="post">
          <tr>
            <td align="center"><input name="main_id" type="hidden" value="<%=rs("main_id")%>" />
              <input type="text" class="ce" name="main_title" value="<%=rs("main_title")%>"/>
              <input name="ckpc" type="button" value="�鿴��Ӧ��Ʒ" onclick="javascript:window.location.href='ManagementProducts.asp?flid=<%=rs("main_id")%>';" /></td>
            <td align="center"><input name="order_id" class="ce" type="text" value="<%=rs("order_id")%>" size="6"/></td>
            <td align="center"><input type="submit" name="submit" value="�޸ķ���" />
            <input name="delete" type="button" value="ɾ��" onclick="javascript:if(confirm('ȷ��Ҫɾ���˷�����ɾ���󲻿ɻָ�!')){window.location.href='CategoryManagement.asp?act=del&amp;main_id=<%=rs("main_id")%>';}else{history.go(0);}" /></td>
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
      <h2>���������</h2>
    </div>
    <div class="right_body">
      <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
        <form method="post" name="CategoryManagement">
          <tr>
            <td width="13%" align="center">�������ƣ�</td>
            <td width="87%"><input name="main_title" type="text" size="30" /></td>
          </tr>
          <tr>
            <td align="center">�š�����</td>
            <td><input name="order_id" type="text" size="5" /></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><input type="submit" name="submit" value="��ӷ���" /></td>
          </tr>
        </form>
      </table>
    </div>
  </div>
  <div class="clear"></div>
</div>
<!--#include file="footer.asp"-->
