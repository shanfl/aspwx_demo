<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<!--#include file="fckeditor/fckeditor.asp"-->
<%
If request.Form("submit") = "ȷ�����" Then
    If request.Form("custom_name") = "" Then
        response.Write "<script language=javascript>alert(""��ҳ���Ʋ���Ϊ�գ�"");window.history.back();</script>"
        response.End
    End If
    If request.Form("custom_order") = "" Or Not IsNumeric(request.Form("custom_order")) Then
        response.Write "<script language=javascript>alert(""�������ֲ���Ϊ�ն��ұ���Ϊ���֣�"");window.history.back();</script>"
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
    response.Write "<script language=javascript>alert(""��ҳ��ӳɹ���"");window.location.href=""custom.asp""</script>"
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
      <h2>�޸ĵ�ҳ</h2>
    </div>
    <div class="right_body">
      <table>
        <tr>
          <th width="40">ID</th>
          <th width="200">��ҳ����</th>
          <th width="60">��������</th>
          <th>�������õ�ַ</th>
          <th width="120">�޸�</th>
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
          <td align="left"><span class="red">[��]<%=rs("custom_name")%></span></td>
          <td><span class="red"><%=rs("custom_order")%></span></td>
          <td><a href="../about.asp?id=<%=rs("ID")%>" target="_blank">about.asp?id=<%=rs("ID")%></a></td>
          <td>[<a href="custom_modify.asp?id=<%=rs("ID")%>">�޸�</a>] [<a href="custom_delete.asp?id=<%=rs("ID")%>" onclick="return confirm('ȷ��Ҫɾ���˵�ҳ��ɾ���󽫲��ɻָ���')">ɾ��</a>]</td>
        </tr>
        <%
Set rss = server.CreateObject("adodb.recordset")
sql = "select * from custom where custom_parent = "&rs("ID")&" order by custom_order asc"
rss.Open sql, conn, 1, 1
Do While Not rss.EOF
%>
        <tr align="center">
          <td><%=rss("ID")%></td>
          <td align="left">��<%=rss("custom_name")%></td>
          <td><%=rss("custom_order")%></td>
          <td><a href="../about.asp?id=<%=rss("ID")%>" target="_blank">about.asp?id=<%=rss("ID")%></a></td>
          <td>[<a href="custom_modify.asp?id=<%=rss("ID")%>">�޸�</a>] [<a href="custom_delete.asp?id=<%=rss("ID")%>" onclick="return confirm('ȷ��Ҫɾ���˵�ҳ��ɾ���󽫲��ɻָ���')">ɾ��</a>]</td>
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
      <h2>��ӵ�ҳ</h2>
    </div>
    <div class="right_body">
      <table width="100%">
        <form method="post">
          <tr>
            <td width="72" align="center">��ҳ���ƣ�</td>
            <td width="701"><input name="custom_name" type="text" size="40" />
              <span class="red">����</span></td>
          </tr>
          <tr>
            <td align="center">�������֣�</td>
            <td><input name="custom_order" type="text" size="10" />
              <span class="red">�����ұ���Ϊ���֣�</span></td>
          </tr>
          <tr>
            <td align="center">������ҳ��</td>
            <td><select name="custom_parent">
                <option value="0">��Ϊ����ҳ</option>
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
            <td align="center">�ؼ��֣�</td>
            <td><input name="custom_keywords" type="text" size="100" value="�뾡����д����������������¼" onfocus="if (value =='�뾡����д����������������¼'){value =''}" onblur="if (value ==''){value='�뾡����д����������������¼'}" /></td>
          </tr>
          <tr>
            <td align="center">�ؼ�������</td>
            <td><input name="custom_description" type="text" size="100" value="�뾡����д����������������¼" onfocus="if (value =='�뾡����д����������������¼'){value =''}" onblur="if (value ==''){value='�뾡����д����������������¼'}" /></td>
          </tr>
          <tr style="display:none">
            <td align="center">�������ݣ�</td>
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
            <td align="center">ȫ�����ݣ�</td>
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
                <input type="submit" name="submit" class="submit_button" value="ȷ�����" />
              </p></td>
          </tr>
        </form>
      </table>
    </div>
  </div>
  <div class="clear"></div>
</div>
<!--#include file="footer.asp"-->