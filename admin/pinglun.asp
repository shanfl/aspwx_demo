<!--#include file="conn.asp"-->
<!--#include file="page.asp"-->
<!--#include file="seeion.asp"-->
<%
If request("act") = "del" Then
  ID=request("ID")

for each ss in request("ID")
set rs=createobject("adodb.recordset")
sql="delete from pinglun where id="&ss
    rs.open sql,conn,1,3
	next

End If
If request("act") = "ok" Then
  ID=request("ID")
  set rs=createobject("adodb.recordset")
sql="update pinglun set Card_number='1' where id="&id
 rs.open sql,conn,1,3
	
End If
if request("act") = "on" Then
  ID=request("ID")
	  set rs=createobject("adodb.recordset")
	sql="update pinglun set Card_number='0' where id="&id
	 rs.open sql,conn,1,3
	 end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��վ��̨����ϵͳ</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<script language="javascript">
function CheckAll(form)  
{
  for (var i=0;i<form.elements.length;i++)    
  {
    var e = form.elements[i];
    if (e.name != 'chkall')
	e.checked = form.chkall.checked; 
  }
}
function CheckOne()
{   
	var   flag=false;   
	var   ID=document.getElementsByName("ID");   
	for(i=0;i<ID.length;i++)
	{   
		if (ID(i).checked)
		{   
			flag=true;   
			break;   
		}   
	}   
	if (!flag)   
	{     
	  alert('������ѡ��һ����¼��');
	  return false;   
	}      
}   
</script>
<!--#include file="header.asp"-->
<div id="top_banner" class="layout"></div>
<div id="content" class="layout">
  <!--#include file="left.asp"-->
  <div id="right">
    <div class="right_title">
      <h2>���۹���</h2>
    </div>
    <div class="right_body">
      <table width="200" border="0" align="center" class="table">
        <%
		act=request("act")
		user=request("user")
		danhao=request("danhao")
Set rs=server.CreateObject("adodb.recordset")
if act="sou" and user<>"" then
sql = "select * from pinglun where Card_number='"&user&"'"
elseif act="sou" and danhao<>"" and  user<>"" then
sql = "select * from pinglun where Economic_lost like '%"&danhao&"%' and Card_number='"&user&"'"
else
sql = "select * from pinglun where 1=1 "
end if
rs.Open sql, conn, 1, 1
if rs.eof then
response.Write "��������!"
else
if rs.recordcount>0 then
      
  rs.PageSize=20 'ÿҳ��¼���� 
  iCount=rs.RecordCount '��¼���� 
  iPageSize=rs.PageSize 
  maxpage=rs.PageCount 
  page=request("page") 
  if Not IsNumeric(page) or page="" then 
   page=1 
  else 
   page=cint(page) 
  end if 
  if page<1 then 
   page=1 
  elseif page>maxpage then 
   page=maxpage 
  end if 
rs.AbsolutePage=Page 
    if page=maxpage then 
      x=iCount-(maxpage-1)*iPageSize 
    else 
      x=iPageSize 
    end if
   
%>
        <form method="post" name="form1" action="?act=sou">
          <tr>
            <td width="74" align="center">��˲�ѯ��</td>
            <td width="99" align="center"><label>
              <select name="user" id="user">
                <option value="0">δ���</option>
                <option value="1">�����</option>
              </select>
            </label></td>
            <td width="82" align="center">IP��ѯ��            </td>
            <td width="160" align="center"><input type="text" name="danhao" id="danhao" /></td>
            <td width="349" align="left"><label>
              <input type="submit" name="submit" id="button" value="��ѯ" />
            </label></td>
          </tr>
                 </form>
                  <form action="?act=del" method="post" name="delform" id="delform">
          <tr>
            <td colspan="5" align="center"><table width="200" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="4%" align="center">ѡ��</td>
                <td width="8%" align="center">�ǳ�</td>
                <td width="9%" align="center">�鿴��Ʒ</td>
                <td width="10%" align="center">���</td>
                <td width="24%" align="center">����</td>
                <td width="19%" align="center">����IP</td>
                <td width="8%" align="center">״̬</td>
                <td width="8%" align="center">���</td>
                <td width="10%" align="center">ɾ��</td>
              </tr>
              <%  for i=1 to x%>
              <tr>
                <td align="center"><input type="checkbox" name="ID" value="<%=rs("id")%>" /></td>
                <td align="center"><%=rs("realname")%></td>
                <td align="center"><a href="../show/?id=<%=rs("cpid")%>#evaluation" target="_blank"><font color="#993333">�������</font></a></td>
                <td align="center">&nbsp;<%=rs("Run_effect")%></td>
                <td align="center"><%=rs("text0")%></td>
                <td align="center"><%=rs("Economic_lost")%></td>
                <td align="center"><% if rs("Card_number")=1 then%><font color="#FF0000">�����</font><% Else %>
                  δ���<% End If %>
</td>
                <td><% if rs("Card_number")=0 then%>
                <input name="ok" type="submit" id="ok" onclick="form.action='?act=ok&id=<%=rs("id")%>';" value="���ͨ��" />
                <% Else %>
  <input name="oka" type="submit" id="oka" onclick="form.action='?act=on&id=<%=rs("id")%>';" value="ȡ��ͨ��" />
  <% End If %>

                </td>
                <td><input name="delete" type="button" value="ɾ��" onclick="javascript:if(confirm('ȷ��Ҫɾ������������ɾ���󲻿ɻָ�!')){window.location.href='?act=del&amp;id=<%=rs("id")%>';}else{history.go(0);}" /></td>
              </tr>
                <%
rs.movenext
next
Set rs = Nothing
End If
end if
%>
            </table></td>
          </tr>
  
          <tr>
            <td colspan="5" align="center"><table width="230" border="0" cellspacing="0" cellpadding="0">
              <tr>
                  <td width="35%" align="center">&nbsp;</td>
                  <td width="5%"><input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);" style="border:0px;" /></td>
                  <td width="60%"><input name="image" type="image" style="width:94px; height:20px; border:0px;" onclick="return CheckOne();" src="del_all.jpg" /></td>
                </tr>
            </table></td>
          </tr>      
     </form>
  
      </table>
           <p>&nbsp; </p>
<%call PageControl(iCount,maxpage,page,"border=0 align=center","<center>") %>

    </div>
  </div>
  <div class="clear"></div>
</div>
<!--#include file="footer.asp"-->
