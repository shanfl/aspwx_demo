<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../images/css.css" rel="stylesheet" type="text/css">
</head>
<body>
<%dim dingdan,username
dingdan=request.QueryString("dan")
if not isnumeric(dingdan) then 
response.write"<script>alert(""�Ƿ�����!"");location.href=""index.asp"";</script>"
response.end
end if
Action=Request("Ac")
Content=Request("content")
If Action="add" Then
  Conn.Execute("update orders set useremail='"&Content&"'  where username='"&dingdan&"'")
  response.write"<script language=javascript>alert('���¶�����ע������ɣ�');window.close();window.opener.location.reload();</script>"
  response.end
End if
set rs=server.CreateObject("adodb.recordset")

rs.open "select * from orders where username='"&dingdan&"'",conn,1,1

if rs.eof and rs.bof then
Response.Write "��������!"
response.End
end if
   If Rs("zhuangtai")=0 or Rs("zhuangtai")=1 Then
   	response.write"<script language=javascript>alert('����ɶ������޷�������');window.close();window.opener.location.reload();</script>"
    response.end
   End if
%>
<table class="tableBorder" width="90%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF">
<form name="form1" method="post" action="?Ac=add&dan=<%=dingdan%>">
<tr> 
<td colspan="4" align="center" background="../images/admin_bg_1.gif"><b><font color="#ffffff">�༭��������ע</font></b></td>
</tr>
                          
                          <tr>
                            <td width="20%" bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'>����ע��</td>
                            <td width="80%" bgcolor="#fbf4f4">
                              <textarea name="content" cols="50" rows="10" id="content"><%=Rs("useremail")%></textarea>
                            </td>
                          </tr>
      
                          
                          
                          <tr>
						  <td height="30" bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'></td>
                            <td bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'>

							  <label>
							  <input type="submit" name="Submit" value="�ύ">
							  <input type="reset" name="Submit3" value="����">
							  </label>
						    <input type="button" name="Submit2" value="�رմ���" onClick=javascript:window.close()>                            </td>
                          </tr>
						  </form>
                        </table>
<%
Rs.Close
Set Rs=Nothing
%>						
</body>
</html>