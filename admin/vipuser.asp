<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<!--#include file="md5.asp"-->
<%
UserID=Trim(Request("ID"))
Action=Trim(Request("ac"))
Password=Trim(Request("pass"))
vip=Trim(Request("vipkh"))
ktvip=Trim(Request("ktvip"))
if ktvip="" then ktvip=0
vip2=Trim(Request("vipkh2"))
Set Rs=Conn.Execute("select * from [user] where userid="&userid&"")
If Rs.eof and Rs.bof Then
  Response.write "<script language=javascript>alert('�û���Ϣ����');window.close();window.opener.location.reload();</script>"
  Response.End 
Else
  UserID=Rs("UserID")
	UserName=Rs("UserName")
	rShowre=Rs("showre")
	usertel=rs("usertel")
   jifen=rs("jifen")
    vipkh=rs("vipkh")
	useradder=rs("useradder")
End if

If Action="add" Then
 
  If Password<>"" Then
  Conn.Execute("update [user] set UserPassword='"&md5(Password)&"',vipkh='"&vip&"' where userid="&userid&"")
     Conn.Execute("update [user] set vipkh='"&vip&"' where userid="&userid&"")
  Response.write "<script language=javascript>alert('�������óɹ���������Ϊ��"&HtmlEnCode(Password)&"');window.close();window.opener.location.reload();</script>"
  else
   Conn.Execute("update [user] set vipkh='"&vip&"',cxmoney="&vip2&",vip="&ktvip&" where userid="&userid&"")
  Response.write "<script language=javascript>alert('���óɹ���');window.close();window.opener.location.reload();</script>"

  End if
End if
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css.css" rel="stylesheet" type="text/css">
</head>
<body>

<form name="form1" method="post" action="?ID=<%=userid%>&Ac=add" OnSubmit="return checkdata()" onReset="return ResetForm();">
  <table  width="90%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF">
    <tr > 
      <td colspan="4" align="center" background="images/admin_bg_1.gif"><b><font color="#ffffff">��Ա[<%=HtmlEnCode(UserName)%>]�˻���ϸ��Ϣ</font></b></td>
    </tr>
    <tr > 
      <td align="right" valign="top" class="tableBorder">���������룺</td>
      <td class="tableBorder">
        <input name="pass" type="text" id="pass" maxlength="20"></td>
    </tr>
    <tr >
      <td align="right" valign="top" class="tableBorder">�ֻ����룺</td>
      <td class="tableBorder"><%=rs("usertel")%></td>
    </tr>
    <tr >
      <td align="right" valign="top">ע��ʱ�䣺</td>
      <td><%= rs("addDate") %></td>
    </tr>
    <tr >
      <td align="right" valign="top">��½������</td>
      <td><%=Conn.Execute("select count(id) from log where user='"&UserName&"'")(0) %></td>
    </tr>
    <tr >
      <td align="right" valign="top">����½IP��</td>
      <td><%=Conn.Execute("select ip from log order by time desc")(0)%></td>
    </tr>
    <tr >
      <td align="right" valign="top">ӵ�л��֣�</td>
      <td><%=jifen%></td>
    </tr>
    <tr >
      <td align="right" valign="top">�����</td>
      <td><input name="vipkh2" type="text" id="vipkh2" value="<%=rs("cxmoney")%>" maxlength="20">
      </td>
    </tr>
    <tr >
      <td align="right" valign="top">�û����䣺</td>
      <td><%=rs("UserEmail")%></td>
    </tr>
    <tr >
      <td align="right" valign="top">�û���ַ��</td>
      <td><%= useradder %></td>
    </tr>
    <tr >
      <td align="right" valign="top">�Ƿ�ͨVIP��</td>
      <td>
        <select name="ktvip" id="ktvip">
          <option value="1" <% If rs("vip")=1 Then %> selected="selected"<% End If %>>��ͨVIP</option>
          <option value="0" <% If rs("vip")=0 Then %> selected="selected"<% End If %>>ȡ��VIP</option>
        </select>
      </label></td>
    </tr>
    <tr >
      <td align="right" valign="top">��Ա���ţ�</td>
      <td><input name="vipkh" type="text" id="vipkh" value="<%=rs("vipkh")%>" maxlength="20">
      Ŀǰֻ�ܺ�̨�ֶ�����Ա���ͻ�Ա��</td>
    </tr>
    <tr >
      <td align="right" valign="top">&nbsp;</td>
      <td><input type="submit" value="�ύ����" name="Submit" class="unnamed5"></td>
    </tr>
  </table>
</form>
</body>
</html>
