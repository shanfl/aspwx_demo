<!--#include file="conn.asp"-->
<!--#include file="page.asp"-->
<!--#include file="seeion.asp"-->
<%

If request("action") = "add" Then
   Set rs = Server.CreateObject("ADODB.RecordSet")
    sql = "select * from guestbook where realname='"&request.Form("realname")&"'" '���ӱ�id=0��ʾ���ӱ������������
    rs.Open sql, conn, 1, 3
	if not rs.eof then
		Response.Write("<SCRIPT language=JavaScript>alert('��ʾ���������Ѵ��ڣ�');this.location.href='"&request.ServerVariables("HTTP_REFERER")&"';</SCRIPT>")
Response.End
else
    rs.addnew
    rs("realname") = request.Form("realname")
    rs("address")= request.Form("address")
    rs("Client_phone") =request.Form("Client_phone")
    rs("handtel") =request.Form("handtel")
	 rs("Card_number") =request.Form("Card_number")
	rs("Client_unit") =request.Form("Client_unit")
    rs("text0") =request.Form("text0")
   rs("aftime")=now
    rs.update
    rs.Close
    Set rs = Nothing
    conn.Close
    Set conn = Nothing
	Response.Write("<SCRIPT language=JavaScript>alert('��ʾ�������ɹ���');this.location.href='"&request.ServerVariables("HTTP_REFERER")&"';</SCRIPT>")
Response.End
end if
End If
If request("action") = "fh" Then
  id = request("id")
      sql = "select * from guestbook where id="&id
    Set rs = server.CreateObject("adodb.recordset")
    rs.Open sql, conn, 1, 3
	if request.Form("client_fax")<>"" then
    rs("chkos") = 1
 end if
	rs("client_fax")=request.Form("client_fax")'������
	 rs("fhtime") = now
	'rs("adminmsg")=request.form("adminmsg")
	'rs("realname") = request.Form("realname")
    'rs("address")= request.Form("address")
    'rs("Client_phone") =request.Form("Client_phone")
    'rs("handtel") =request.Form("handtel")
	 'rs("Run_effect") =request.Form("chkintruder")
	'rs("age")=request.Form("zonger")
    'rs("text0") =request.Form("Home_address")
	'rs("Economic_lost")=request.Form("Client_email")
    rs.update
    rs.Close
    response.Write "<script>alert('���ͳɹ���');window.location.href='guestbook.asp';</script>"
End If


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��վ��̨����ϵͳ</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script language=javascript>
function preview() { 
bdhtml=window.document.body.innerHTML; 
sprnstr="<!--startprint-->"; 
eprnstr="<!--endprint-->"; 
prnhtml=bdhtml.substr(bdhtml.indexOf(sprnstr)+17); 
prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr)); 
window.document.body.innerHTML=prnhtml; 
window.print(); 
window.document.body.innerHTML=bdhtml; 
         }
</script>
</head>
<body>
<!--#include file="header.asp"-->
<div id="top_banner" class="layout"></div>
<div id="content" class="layout">
<!--#include file="left.asp"-->
<div id="right">
  <div class="right_title">
    <h2>���Ͷ�������</h2>
  </div>
  <div class="right_body">
  <%
Set rs = server.CreateObject("adodb.recordset")
exec = "select * from guestbook where id="& request("id")
rs.Open exec, conn, 1, 1

Set rsc = server.CreateObject("adodb.recordset")
exec = "select * from guestbook where reguserid='"&rs("reguserid")&"' and regtype=1"
rsc.Open exec, conn, 1, 1
if not rsc.eof then
zjf=rsc("jf")
end if
if not rs.eof then
%><!--startprint-->
  <form name="guestbook?id=<%=rs("id")%>" method="post" action="guestbook_view.asp">
  <input name="id" type="hidden" value="<%=request.querystring("id")%>" />
  <table width="650" height="355" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr><td height=5></td></tr>
                   <% 
				   Set rsa = server.CreateObject("adodb.recordset")
sql = "select * from products where id="& rs("chkmeasure")
rsa.Open sql, conn, 1, 1

				  %>
              
                 
                  <tbody id=unknownuser name=unknownuser style="display:block">
                    <tr class="bodyfont">
                      <td width="132" align="left" height="25"> ��ʵ������&nbsp;&nbsp;&nbsp;&nbsp;</font></td>
                      <td colspan=7><input name=realname type="text" class=1 id=realname value="<%=rs("realname")%>" size=15 maxlength=10 readonly="readonly" />                        </font><% If rs("reguserid")<>"" Then %>
                        ��Ա�û�:(<font color="#CC0000"><%=rs("reguserid")%></font>) -- �û�Ա�ѻ�ã�(<font color="#CC0000"><%=zjf %></font>)����<% Else %>
��ע���û�<% End If %>
</td>
                    </tr>
                       <tr class="bodyfont" >
                      <td width="132" align="left" height="25"></font>����ʱ�䣺</td>
                      <td colspan=7><input name=chkintruder type="text" class=1 id=typename value="<%=rs("aftime")%>" size=40 maxlength=100 readonly="readonly" />                        </font></td>
                    </tr>
                       <tr class="bodyfont" >
                      <td width="132" align="left" height="25"></font>���͵�ַ��</td>
                      <td colspan=7><input name=Home_address type="text" class=1 id=Home_address value="<%=rs("home_address")%>" size=40 maxlength=100 readonly="readonly" />                        </font></td>
                    </tr>
                    <tr class="bodyfont">
                      <td width="132" align="left" height="25">��ϵ�绰��</font></td>
                      <td colspan=7>
                        <INPUT name=handtel type="text" class=1 id=handtel value="<%=rs("handtel")%>

" size=30 maxlength=50 readonly="readonly"></td>
                    </tr>
                    <tr class="bodyfont">
                      <td width="132" align="left" height="25"></font>��Ʒ���ƣ�</td>
                      <td colspan=7><input name=address type="text" class=1 id=address value="<%=rsa("title")%>" size=40 maxlength=100 readonly="readonly" />                        </font></td>
                    </tr>
                    
                       <tr class="bodyfont" >
                         <td align="left" height="25">����:</td>
                         <td colspan=7><label>
                           <input name="Client_email" type="text" id="pay" value="<%= rs("Publisher_netclue") %>" readonly="readonly" />
                        ���ۣ�(<font color="#CC0000">
                        <% =rsa("gsmt")  %>
                        </font>)--�ϼƣ�
                        (
                       <font color="#CC0000"> <% hj=rs("Publisher_netclue")*rsa("gsmt") 
				response.Write hj %></font>
                        )
Ԫ </label></td>
                       </tr>
                       <tr class="bodyfont">
                         <td align="left" height="25">����ʱ�䣺</td>
                         <td colspan=7><input name="zonger" type="text" id="pay2" value="<%=rs("chkpcbrand")%>" readonly="readonly" /></td>
                       </tr>
                       <tr class="bodyfont" style="display:none">
                      <td width="132" align="left" height="25"></font>�������ڣ�</td>
                      <td colspan=7><input name=aftime type="text" class=1 id=aftime value="" size=40 maxlength=100 readonly="readonly" />                        </font></td>
                    </tr>
                        <tr class="bodyfont">
                      <td width="132" align="left" height="25"></font>�������ڣ�</td>
                      <td colspan=7><input name=fhtime type="text" class=1 id=fhtime value="<%=rs("fhtime")%>" size=40 maxlength=100 readonly="readonly" />                        </font></td>
                    </tr>
                     
                        <tr class="bodyfont" style="display:none">
                      <td width="132" align="left" height="25"></font>���ѷ�ʽ��</td>
                      <td colspan=7><input name=Card_number type="text" class=1 id=Card_number value="" size=40 maxlength=100 />                        </font></td>
                    </tr>
                        <tr class="bodyfont">
                      <td width="132" align="left" height="25"></font>���͵��ţ�</td>
                      <td colspan=7><input name=client_fax type="text" class=1 id=client_fax value="<%=rs("client_fax")%>" size=40 maxlength=100 />                        </font></td>
                    </tr>
                     <tr class="bodyfont" style="display:none">
                          <td align="left" height="25">�ͻ���ע��</td>
                          <td colspan=7><textarea name="textarea2" cols="45" rows="5" readonly="readonly" id="textarea2"><%=rs("text0")%></textarea></td>
                    </tr>
                     <tr class="bodyfont">
                      <td width="132" align="left" height="25"></font>�ظ��ͻ���</td>
                      <td colspan=7>
                        <label>
                          <textarea name="adminmsg" id="adminmsg" cols="45" rows="5"><%=rs("adminmsg")%></textarea>
                       </label></td>
                    </tr>
                        <tr class="bodyfont">
                          <td align="left" height="25">&nbsp;</td>
                          <td width="88" align="center"><label>
                        <INPUT class="button" type="submit" value="����" onClick="form.action='?action=fh';"/>
                          </label></td>
                          <td align="center"><input type="reset" name="button" id="button" value="����" /></td>
                          <td align="center"><input type="button" onClick="preview();window.close()" value="��ӡ" /></td>
                          <td width="262">&nbsp;</td>
                          <td width="42">&nbsp;</td>
                          <td width="42">&nbsp;</td>
                          <td width="42">&nbsp;</td>
                        </tr>
                  </tbody>
                  <tbody style="display:block;" id=reguser0 name=reguser0>
                    
                  </tbody>
                  <tbody>
                  </tbody>
                </table>
                             </form>
                             
                             
                             
                             <!--endprint-->
                             <% Else
							 
							 Response.Write("<SCRIPT language=JavaScript>alert('��ʾ������');this.location.href='"&request.ServerVariables("HTTP_REFERER")&"';</SCRIPT>")
							  End If %>


  </div>
</div>
<div class="clear"></div>
</div>
<!--#include file="footer.asp"-->
