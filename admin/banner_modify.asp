<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<%
If request.QueryString("id") = "" Or Not IsNumeric(request.QueryString("id")) Then
    response.Write "<script language=javascript>alert(""�Ƿ�������"");window.history.back();</script>"
    response.End
End If
If request.Form("submit") = "ȷ���޸�" Then
    If request.Form("uploadfile") = "" Then
        response.Write "<script language=javascript>alert(""������ͼƬ��ַ���ϴ�ͼƬ��"");window.history.back();</script>"
        response.End
    End If
    If request.Form("banner_url") = "" Then
        response.Write "<script language=javascript>alert(""���ӵ�ַ����Ϊ�գ�"");window.history.back();</script>"
        response.End
    End If
    If request.Form("banner_order") = "" Or Not IsNumeric(request.Form("banner_order")) Then
        response.Write "<script language=javascript>alert(""�������ֲ���Ϊ�գ����ұ���Ϊ���֣�"");window.history.back();</script>"
        response.End
    End If
    Set rs = server.CreateObject("adodb.recordset")
    sql = "select * from banner where id = "&request.QueryString("id")&""
    rs.Open sql, conn, 1, 3
    rs("banner_name") = request.Form("banner_name")
    rs("uploadfile") = request.Form("uploadfile")
    rs("banner_url") = request.Form("banner_url")
    rs("banner_order") = request.Form("banner_order")
    rs.update
    rs.Close
    Set rs = Nothing
    conn.Close
    Set conn = Nothing
    response.Write "<script language=javascript>alert(""�õ��޸ĳɹ���"");window.location.href=""banner.asp""</script>"
    response.End
End If
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��վ��̨����ϵͳ</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script language="javascript">
function showUploadDialog(s_Type, s_Link, s_Thumbnail){
var arr = showModalDialog("eWebEditor/dialog/i_upload.htm?style=popup&type="+s_Type+"&link="+s_Link+"&thumbnail="+s_Thumbnail, window, "dialogWidth:0px;dialogHeight:0px;help:no;scroll:no;status:no");}
</script>
</head>
<body>
<!--#include file="header.asp"-->
<div id="top_banner" class="layout"></div>
<div id="content" class="layout">
  <!--#include file="left.asp"-->
  <div id="right">
    <div class="right_title">
      <h2>�޸Ļõ�Ƭ</h2>
    </div>
    <div class="right_body">
      <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
      				<%
Set rs = server.CreateObject("adodb.recordset")
sql = "select * from banner where id = "&request.QueryString("id")&""
rs.Open sql, conn, 1, 1
If rs.EOF Then
    response.Write "<script language=javascript>alert(""�����ڴ����ݣ�"");window.history.back();</script>"
    response.End
End If
%>
        <form  name="cherry" method="post" >
          <tr>
            <td width="24%" align="center">����˵����</td>
            <td width="76%">
            <input name="banner_name" type="text" value="<%=rs("banner_name")%>" size="80" /></td>
          </tr>
          <tr>
            <td align="center">���ӵ�ַ��</td>
            <td><input name="banner_url" type="text" value="<%=rs("banner_url")%>" size="80"/></td>
          </tr>
          <tr>
            <td align="center">����ͼƬ��</td>
            <td><input name="uploadfile" type="text" size="50" value="<%=rs("uploadfile")%>" />
             <iframe src="upload.asp" width="500" height="25" scrolling="Auto" frameborder="0"></iframe></td>
          </tr>
          <tr>
            <td align="center">�š�����</td>
            <td><input name="banner_order" type="text" value="<%=rs("banner_order")%>" size="10"/></td>
          </tr>
          <tr>
            <td colspan="2"><p class="submit">
              <input name="submit" type="submit" value="ȷ���޸�" />
            </p></td>
          </tr>
        </form>
      </table>
    </div>
  </div>
  <div class="clear"></div>
</div>
<!--#include file="footer.asp"-->
