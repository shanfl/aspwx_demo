<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<!--#include file="md5.asp"-->
<%
If request.Form("submit") = "��ӹ���Ա" Then
    Set rs = server.CreateObject("adodb.recordset")
    sql = "select * from admin where user_name='"&request.Form("user_name")&"'"
    rs.Open sql, conn, 1, 1
    If Not rs.EOF Then
        rs.Close
        Set rs = Nothing
        conn.Close
        Set conn = Nothing
        response.Write "<script language=javascript>alert(""�Ѿ����ڴ˹���Ա��������û�����"");window.history.back();</script>"
        response.End
    End If
    If request.Form("user_name") = "" Then
        response.Write "<script language=javascript>alert(""�û�������Ϊ�գ�"");window.history.back();</script>"
        response.End
    End If
    If request.Form("password") = "" Then
        response.Write "<script language=javascript>alert(""���벻��Ϊ�գ�"");window.history.back();</script>"
        response.End
    End If
    If request.Form("password") <> request.Form("password_again") Then
        response.Write "<script language=javascript>alert(""��������������벻һ�£����������룡"");window.history.back();</script>"
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
    response.Write "<script language=javascript>alert(""����Ա��ӳɹ���"");window.location.href=""admin.asp""</script>"
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
      <h2>����Ա����</h2>
    </div>
    <div class="right_body">
      <table class="table">
        <tr>
          <th width="40">ID</th>
          <th width="424">�û���</th>
          <th width="231">����</th>
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
          <td>[<a href="admin_modify.asp?id=<%=rs("id")%>">�޸�</a>][<a href="admin_delete.asp?id=<%=rs("ID")%>"onclick="return confirm('ȷ��Ҫɾ���˹���Ա��ɾ���󽫲��ɻָ���')">ɾ��</a>]</td>
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
      <h2>��ӹ���Ա</h2>
    </div>
    <div class="right_body">
      <table class="table">
        <form method="post" action="admin.asp">
          <tr>
            <td width="80" align="center">�û�������</td>
            <td><input name="user_name" type="text" size="40" maxlength="60" />
              <span class="red">*����</span></td>
          </tr>
          <tr>
            <td align="center">�ܡ����룺</td>
            <td><input name="password" type="password" size="40" maxlength="16" />
              <span class="red">*����</span></td>
          </tr>
          <tr>
            <td align="center">ȷ�����룺</td>
            <td><input name="password_again" type="password" size="40" maxlength="16" />
            <span class="red">*����</span></td>
          </tr>
          <tr align="center">
            <td colspan="2"><input name="submit" type="submit" class="submit_button" value="��ӹ���Ա" /></td>
          </tr>
        </form>
      </table>
    </div>
  </div>
  <div class="clear"></div>
</div>
<!--#include file="footer.asp"-->
