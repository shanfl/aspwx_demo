<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<%
If request.Form("submit") = "ȷ�����" Then
    If request.Form("nav_name") = "" Then
        response.Write "<script language=javascript>alert(""�������Ʋ���Ϊ�գ�"");window.history.back();</script>"
        response.End
    End If
    If request.Form("nav_url") = "" Then
        response.Write "<script language=javascript>alert(""�������Ʋ���Ϊ�գ�"");window.history.back();</script>"
        response.End
    End If
    If request.Form("nav_order") = "" Or Not IsNumeric(request.Form("nav_order")) Then
        response.Write "<script language=javascript>alert(""�������Ʋ���Ϊ�գ�"");window.history.back();</script>"
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
    response.Write "<script language=javascript>alert(""��������ӳɹ�"");window.location.href=""nav.asp""</script>"
    response.End
End If
If request.Form("submit") = "�޸�" Then
    If request.Form("nav_name") = "" Then
        response.Write "<script language=javascript>alert(""�������Ʋ���Ϊ�գ�"");window.history.back();</script>"
        response.End
    End If
    If request.Form("nav_url") = "" Then
        response.Write "<script language=javascript>alert(""�������Ʋ���Ϊ�գ�"");window.history.back();</script>"
        response.End
    End If
    If request.Form("nav_order") = "" Or Not IsNumeric(request.Form("nav_order")) Then
        response.Write "<script language=javascript>alert(""�������Ʋ���Ϊ�գ�"");window.history.back();</script>"
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
    response.Write "<script language=javascript>alert(""�������޸ĳɹ�"");window.location.href=""nav.asp""</script>"
    response.End
End If
If request.Form("submit") = "ɾ��" Then
    Set rs = server.CreateObject("adodb.recordset")
    sql = "select * from nav where id="&request.Form("ID")&""
    rs.Open sql, conn, 1, 3
    rs.Delete
    rs.update
    rs.Close
    Set rs = Nothing
    conn.Close
    Set conn = Nothing
    response.Write "<script language=javascript>alert(""������ɾ���ɹ�"");window.location.href=""nav.asp""</script>"
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
      <h2>�޸ĵ�����</h2>
    </div>
    <div class="right_body">
      <table width="99%" align="center">
        <tr>
          <th width="122">��������</th>
          <th width="183">���ӵ�ַ</th>
          <th width="75">��������</th>
          <th width="88">�򿪷�ʽ</th>
          <th width="78">�Ƿ���ʾ</th>
          <th width="137">�޸Ĳ���</th>
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
                <option value="_self"<%If rs("nav_open") = "_self" Then%>selected="selected"<%End If%>>ԭ����</option>
                <option value="_blank"<%If rs("nav_open") = "_blank" Then%>selected="selected"<%End If%>>�´���</option>
              </select></td>
            <td><select name="nav_display">
                <option value="true"<%If rs("nav_display") = True Then%>selected="selected"<%End If%>>��ʾ</option>
                <option value="false"<%If rs("nav_display") = false Then%>selected="selected"<%End If%>>����</option>
              </select></td>
            <td><input name="submit" type="submit" value="�޸�" />
              <input name="submit" type="submit" value="ɾ��" onclick="return confirm('ȷ��Ҫɾ���˵�������')" /></td>
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
      <h2>��ӵ�����</h2>
    </div>
    <div class="right_body">
      <table>
        <form method="post">
          <tr>
            <td width="80" align="center">�������ƣ�</td>
            <td><input name="nav_name" type="text" size="20" />
              <span class="red">����</span></td>
          </tr>
          <tr>
            <td align="center">���ӵ�ַ��</td>
            <td><input name="nav_url" type="text" size="60" />
              <span class="red">���� �ⲿ��ַ��������д����&ldquo;http://&rdquo;</span></td>
          </tr>
          <tr>
            <td align="center">����</td>
            <td><input name="nav_order" type="text" size="10" />
              <span class="red">�����ұ���Ϊ���֣�</span></td>
          </tr>
          <tr>
            <td align="center">�򿪷�ʽ��</td>
            <td><select name="nav_open">
                <option value="_self">ԭ����</option>
                <option value="_blank">�´���</option>
              </select></td>
          </tr>
          <tr align="center">
            <td colspan="2"><input name="submit" type="submit" class="submit_button" value="ȷ�����" /></td>
          </tr>
        </form>
      </table>
    </div>
  </div>
  <div class="clear"></div>
</div>
<!--#include file="footer.asp"-->
