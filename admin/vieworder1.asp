<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../images/css.css" rel="stylesheet" type="text/css">
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
<%


dim dingdan,username
dingdan=request.QueryString("dan")
if not isnumeric(dingdan) then 
response.write"<script>alert(""�Ƿ�����!"");location.href=""../index.asp"";</script>"
response.end
end if
Action=Request("Ac")
Select Case Action
  Case "del"
    Conn.Execute("update orders set zhuangtai=0 where username='"&dingdan&"'")
	response.write"<script language=javascript>alert('�����ɹ���������ȡ����');window.close();window.opener.location.reload();</script>"
    response.end
	
	 Case "delok"
	 conn.execute "delete from [orders] where username in ('"&dingdan&"') "
 	response.write"<script language=javascript>;window.close();window.opener.location.reload();</script>"
    response.end
	
  Case "way"
    Conn.Execute("update orders set zhuangtai=2 where username='"&dingdan&"'")
	response.write"<script language=javascript>alert('�����ɹ��������ѷ�����');window.close();window.opener.location.reload();</script>"
    response.end
  Case "ok"
    Conn.Execute("update orders set zhuangtai=1 where username='"&dingdan&"'")

	response.write"<script>alert(""�����ɹ���������ǩ�գ�"");location.href=""vieworder.asp?dan="&dingdan&""";</script>"

	
    response.end
End Select
username=request.QueryString("username")
if InStr(username,"'")>0 then
response.write"<script>alert(""�Ƿ�����!"");location.href=""../index.asp"";</script>"
response.end
end if
set rs=server.CreateObject("adodb.recordset")

rs.open "select * from orders where username='"&dingdan&"'",conn,1,1

if rs.eof and rs.bof then
Response.Write "��������!"
response.End
end if


%><!--startprint-->
<table class="tableBorder" width="612" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF">
<tr> 
<td colspan="5" align="center" background="../images/admin_bg_1.gif"><b><font color="#ffffff">������</font></b></td>
</tr>
                          
                          <tr>
                            <td bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'>������ţ�</td>
                            <td width="69%" bgcolor="#fbf4f4"><%=dingdan%></td>
                            <td width="14%" bgcolor="#fbf4f4"><span style="PADDING-LEFT: 10px">
                              <input type="button" name="Submit" value="ɾ������" onClick="if(confirm('��ȷ��Ҫɾ���ö�����?')) location.href='?Ac=delok&dan=<%=dingdan%>';else return;">
                            </span></td>
                          </tr>
                          <tr>
                            <td bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'>�������ͣ�</td>
                            <td colspan="2" bgcolor="#fbf4f4"><%if rs("shjiaid")=1 then%><font color="#FF0000">���ֶһ�</font><% Else %>
<font color="#FF0000">��ͨ����</font><% End If %>
</td>
                          </tr>
                          <tr> 
                            <td width="17%" bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'>����״̬��</td>
                            <td colspan="2" bgcolor="#fbf4f4"> 
                              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td>
								  <%
								 
		  select case rs("zhuangtai")
	case "0"
	Response.Write "<font color=""#cccccc"">��ȡ��</a>"
	case "1"
	response.write "<font color=""#008800"">��ǩ��</a>"
	case "2"
	response.write "�ѷ���"
	case "6"
	response.write "<font color=""red"">δ����</font>"
	end select%>								  </td>
                                </tr>
                              </table>                            </td>
                          </tr>
                          <tr> 
                            <td width="17%" bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'>��Ʒ�б�</td>
                            <td colspan="2" bgcolor="#fbf4f4"> 
                              <table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#CCCCCC">
                                <tr> 
                                  <td width="28%" align="center" bgcolor="#fbf4f4">��Ʒ����</td>
                                  <td width="15%" align="center" bgcolor="#fbf4f4">��������</td>
                                  <td width="14%" align="center" bgcolor="#fbf4f4">���ͻ���</td>
                                  <td width="14%" align="center" bgcolor="#fbf4f4">�� ��</td>
                                  <td width="29%" align="center" bgcolor="#fbf4f4">���С��</td>
                                </tr>
                                <%zongji=0
								zongjf=0
								do while not rs.eof%>
                                <tr> 
                                  <td bgcolor="#fbf4f4" style='PADDING-LEFT: 5px'>
<%if rs("bookid")<>"" then%>
<%set rsf=Conn.Execute("select title from products where id="&Rs("bookid")&"")
if not rsf.eof then
response.Write rsf(0)
else
response.Write "�ò�Ʒ�����ڻ���ɾ��!"
end if
%>
<%end if%></td>
                                  <td bgcolor="#fbf4f4"> 
                                    <div align="center"><%=rs("bookcount")%></div>                                  </td>
                                  <td align="center" bgcolor="#fbf4f4"><%=rs("jifen")%></td>
                                  <td bgcolor="#fbf4f4"> 
                                    <div align="center"><%=rs("danjia")&"Ԫ"%></div>                                  </td>
                                  <td bgcolor="#fbf4f4"> 
                                    <div align="center"><%=rs("danjia")*rs("bookcount")&"Ԫ"%></div>                                  </td>
                                </tr>
                                
                                <%
								Set Rsc=Conn.Execute("select sum(jifen) as jf from orders where zhuangtai=1 and username='"&dingdan&"'")
		if not rsc.eof then		
	dzjf=rsc("jf")
	end if

								zongjf=rs("jifen")*rs("bookcount")+zongjf
								zongji=rs("danjia")*rs("bookcount")+zongji
								feiyong=rs("feiyong")
		rs.movenext
		loop
		rs.movefirst%>
                                <tr> 
                                  <td colspan="5" bgcolor="#fbf4f4"> 
                                    <div align="right">�ܻ���:<%=zongjf%>
                                    <%
									
	if request("ac")="fsjf" then
if rs("zhuangtai")=1  and rs("fapiao")<1 then
 	set rse=Conn.Execute("update [user] set jifen=jifen+"&zongjf&" where userid="&Rs("userid")&"")
	  Conn.Execute("update orders set fapiao=1 where username='"&dingdan&"'")
	response.write"<script language=javascript>alert('�����ɹ��������ѷ��ͣ�');window.close();window.opener.location.reload();</script>"
    response.end
	else
	response.write"<script language=javascript>alert('�����ѷ��ͣ��벻���ظ��ύ');window.close();window.opener.location.reload();</script>"
    response.end
	end if
	end if%>
�������ܶ<%=zongji%>Ԫ���������ã�<%=feiyong%>Ԫ�������ƣ�<%=zongji+feiyong%>Ԫ 
                                      &nbsp;&nbsp;&nbsp;&nbsp;</div>                                  </td>
                                </tr>
                              </table>                            </td>
                          </tr>
                          <%set snsn=server.CreateObject("adodb.recordset")
	snsn.open "select * from ordersaward where username='"&username&"' and dingdan='"&dingdan&"'",conn,1,1
	if snsn.recordcount>0 then%>
                          <tr bgcolor="#FFFFFF"> 
                            <td width="17%" style='PADDING-LEFT: 10px' bgcolor="#fbf4f4">��Ʒ�б�</td>
                            <td colspan="2" bgcolor="#fbf4f4"> 
                              <table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" >
                                <tr> 
                                <td align="center">��Ʒ����</td>
                                <td align="center">���û���</td>
                                </tr>
	<%
	while not snsn.eof%>
                                <tr> 
                                  <td bgcolor="#fbf4f4"> 
                                    <div align="center">
                                      <%
	set snsn1=server.CreateObject("adodb.recordset")
	snsn1.open "select * from jiangpin where bookid="&snsn("bookid"),conn,1,1
	if snsn1.recordcount=1 then
	response.write snsn1("bookname")
	end if
	rs_sh.close
	set rs_sh=nothing
	snsn1.close
	set snsn1=nothing%>
                                    </div></td>
                                  <td align="center" bgcolor="#fbf4f4"><%=snsn("jifen")%></td>
                                </tr>
	<%
	snsn.movenext
	wend%>
                              </table>                            </td>
                          </tr>
                          <%end if
snsn.close
set snsn=nothing%>
                          <tr> 
                            <td bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'>�ջ�������</td>
                            <td colspan="2" bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'><%=trim(rs("shouhuoname"))%></td>
                          </tr>
                          <tr> 
                            <td bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'>�ջ���ַ��</td>
                            <td colspan="2" bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'><%=trim(rs("shouhuodizhi"))%></td>
                          </tr>
                          
                          <tr> 
                            <td bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'>��ϵ�绰��</td>
                            <td colspan="2" bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'><%=trim(rs("usertel"))%></td>
                          </tr>
                          
                          <tr> 
                            <td bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'>�µ����ԣ�</td>
                            <td colspan="2" bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'><%=trim(rs("liuyan"))%></td>
                          </tr>
                          <tr> 
                            <td height="20" bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'>�µ����ڣ�</td>
                            <td height="20" colspan="2" bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'><%=rs("actiondate")%></td>
                          </tr>
                          <tr>
                            <td height="30" bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'>����ע��</td>
                            <td colspan="2" bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'>
							<%=HtmlEnCode(Rs("useremail"))%>
							</td>
                          </tr>
                          <tr>
						  <td height="30" bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'></td>
                            <td colspan="2" bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'>
							<%If Rs("zhuangtai")="6" Then%>
							<input type="button" name="Submit3" value="ȡ������" onClick="if(confirm('��ȷ��Ҫȡ���ö�����?')) location.href='?Ac=del&dan=<%=dingdan%>';else return;">
							<input type="button" name="Submit4" value="ȷ�Ϸ���" onClick="if(confirm('��ȷ���ö����ѷ�����?')) location.href='?Ac=way&dan=<%=dingdan%>';else return;">
							<%Elseif Rs("zhuangtai")="2" Then%>
							<input type="button" name="Submit4" value="ǩ�ն���" onClick="if(confirm('��ȷ���ö����ͻ���ǩ����?')) location.href='?Ac=ok&dan=<%=dingdan%>';else return;">
							<input type="button" name="Submit3" value="ȡ������" onClick="if(confirm('��ȷ��Ҫȡ���ö�����?')) location.href='?Ac=del&dan=<%=dingdan%>';else return;">
							<%End if%>
							<input type="button" name="Submit2" value="�رմ���" onClick=javascript:window.close()>
                            <input type="button" onClick="preview();window.close()" value="��ӡ">      
                               <input type="button" onClick="javascript:window.location.href='?Ac=fsjf&dan=<%=dingdan%>'" value="���ͻ���">                        </td>
                          </tr>
                        </table><!--endprint-->
<%
Rs.Close
Set Rs=Nothing
%>						
</body>
</html>