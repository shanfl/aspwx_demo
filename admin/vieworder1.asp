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
response.write"<script>alert(""非法访问!"");location.href=""../index.asp"";</script>"
response.end
end if
Action=Request("Ac")
Select Case Action
  Case "del"
    Conn.Execute("update orders set zhuangtai=0 where username='"&dingdan&"'")
	response.write"<script language=javascript>alert('操作成功，订单已取消！');window.close();window.opener.location.reload();</script>"
    response.end
	
	 Case "delok"
	 conn.execute "delete from [orders] where username in ('"&dingdan&"') "
 	response.write"<script language=javascript>;window.close();window.opener.location.reload();</script>"
    response.end
	
  Case "way"
    Conn.Execute("update orders set zhuangtai=2 where username='"&dingdan&"'")
	response.write"<script language=javascript>alert('操作成功，订单已发货！');window.close();window.opener.location.reload();</script>"
    response.end
  Case "ok"
    Conn.Execute("update orders set zhuangtai=1 where username='"&dingdan&"'")

	response.write"<script>alert(""操作成功，订单已签收！"");location.href=""vieworder.asp?dan="&dingdan&""";</script>"

	
    response.end
End Select
username=request.QueryString("username")
if InStr(username,"'")>0 then
response.write"<script>alert(""非法访问!"");location.href=""../index.asp"";</script>"
response.end
end if
set rs=server.CreateObject("adodb.recordset")

rs.open "select * from orders where username='"&dingdan&"'",conn,1,1

if rs.eof and rs.bof then
Response.Write "订单错误!"
response.End
end if


%><!--startprint-->
<table class="tableBorder" width="612" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF">
<tr> 
<td colspan="5" align="center" background="../images/admin_bg_1.gif"><b><font color="#ffffff">处理订单</font></b></td>
</tr>
                          
                          <tr>
                            <td bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'>订单编号：</td>
                            <td width="69%" bgcolor="#fbf4f4"><%=dingdan%></td>
                            <td width="14%" bgcolor="#fbf4f4"><span style="PADDING-LEFT: 10px">
                              <input type="button" name="Submit" value="删除订单" onClick="if(confirm('您确定要删除该订单吗?')) location.href='?Ac=delok&dan=<%=dingdan%>';else return;">
                            </span></td>
                          </tr>
                          <tr>
                            <td bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'>购买类型：</td>
                            <td colspan="2" bgcolor="#fbf4f4"><%if rs("shjiaid")=1 then%><font color="#FF0000">积分兑换</font><% Else %>
<font color="#FF0000">普通购买</font><% End If %>
</td>
                          </tr>
                          <tr> 
                            <td width="17%" bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'>订单状态：</td>
                            <td colspan="2" bgcolor="#fbf4f4"> 
                              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td>
								  <%
								 
		  select case rs("zhuangtai")
	case "0"
	Response.Write "<font color=""#cccccc"">已取消</a>"
	case "1"
	response.write "<font color=""#008800"">已签收</a>"
	case "2"
	response.write "已发货"
	case "6"
	response.write "<font color=""red"">未处理</font>"
	end select%>								  </td>
                                </tr>
                              </table>                            </td>
                          </tr>
                          <tr> 
                            <td width="17%" bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'>商品列表：</td>
                            <td colspan="2" bgcolor="#fbf4f4"> 
                              <table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#CCCCCC">
                                <tr> 
                                  <td width="28%" align="center" bgcolor="#fbf4f4">商品名称</td>
                                  <td width="15%" align="center" bgcolor="#fbf4f4">订购数量</td>
                                  <td width="14%" align="center" bgcolor="#fbf4f4">曾送积分</td>
                                  <td width="14%" align="center" bgcolor="#fbf4f4">价 格</td>
                                  <td width="29%" align="center" bgcolor="#fbf4f4">金额小计</td>
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
response.Write "该产品不存在或已删除!"
end if
%>
<%end if%></td>
                                  <td bgcolor="#fbf4f4"> 
                                    <div align="center"><%=rs("bookcount")%></div>                                  </td>
                                  <td align="center" bgcolor="#fbf4f4"><%=rs("jifen")%></td>
                                  <td bgcolor="#fbf4f4"> 
                                    <div align="center"><%=rs("danjia")&"元"%></div>                                  </td>
                                  <td bgcolor="#fbf4f4"> 
                                    <div align="center"><%=rs("danjia")*rs("bookcount")&"元"%></div>                                  </td>
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
                                    <div align="right">总积分:<%=zongjf%>
                                    <%
									
	if request("ac")="fsjf" then
if rs("zhuangtai")=1  and rs("fapiao")<1 then
 	set rse=Conn.Execute("update [user] set jifen=jifen+"&zongjf&" where userid="&Rs("userid")&"")
	  Conn.Execute("update orders set fapiao=1 where username='"&dingdan&"'")
	response.write"<script language=javascript>alert('操作成功，积送已发送！');window.close();window.opener.location.reload();</script>"
    response.end
	else
	response.write"<script language=javascript>alert('积送已发送！请不了重复提交');window.close();window.opener.location.reload();</script>"
    response.end
	end if
	end if%>
　订单总额：<%=zongji%>元＋其它费用：<%=feiyong%>元　　共计：<%=zongji+feiyong%>元 
                                      &nbsp;&nbsp;&nbsp;&nbsp;</div>                                  </td>
                                </tr>
                              </table>                            </td>
                          </tr>
                          <%set snsn=server.CreateObject("adodb.recordset")
	snsn.open "select * from ordersaward where username='"&username&"' and dingdan='"&dingdan&"'",conn,1,1
	if snsn.recordcount>0 then%>
                          <tr bgcolor="#FFFFFF"> 
                            <td width="17%" style='PADDING-LEFT: 10px' bgcolor="#fbf4f4">奖品列表：</td>
                            <td colspan="2" bgcolor="#fbf4f4"> 
                              <table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" >
                                <tr> 
                                <td align="center">奖品名称</td>
                                <td align="center">所用积分</td>
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
                            <td bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'>收货人名：</td>
                            <td colspan="2" bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'><%=trim(rs("shouhuoname"))%></td>
                          </tr>
                          <tr> 
                            <td bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'>收货地址：</td>
                            <td colspan="2" bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'><%=trim(rs("shouhuodizhi"))%></td>
                          </tr>
                          
                          <tr> 
                            <td bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'>联系电话：</td>
                            <td colspan="2" bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'><%=trim(rs("usertel"))%></td>
                          </tr>
                          
                          <tr> 
                            <td bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'>下单留言：</td>
                            <td colspan="2" bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'><%=trim(rs("liuyan"))%></td>
                          </tr>
                          <tr> 
                            <td height="20" bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'>下单日期：</td>
                            <td height="20" colspan="2" bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'><%=rs("actiondate")%></td>
                          </tr>
                          <tr>
                            <td height="30" bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'>处理备注：</td>
                            <td colspan="2" bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'>
							<%=HtmlEnCode(Rs("useremail"))%>
							</td>
                          </tr>
                          <tr>
						  <td height="30" bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'></td>
                            <td colspan="2" bgcolor="#fbf4f4" style='PADDING-LEFT: 10px'>
							<%If Rs("zhuangtai")="6" Then%>
							<input type="button" name="Submit3" value="取消订单" onClick="if(confirm('您确定要取消该订单吗?')) location.href='?Ac=del&dan=<%=dingdan%>';else return;">
							<input type="button" name="Submit4" value="确认发货" onClick="if(confirm('您确定该订单已发货吗?')) location.href='?Ac=way&dan=<%=dingdan%>';else return;">
							<%Elseif Rs("zhuangtai")="2" Then%>
							<input type="button" name="Submit4" value="签收订单" onClick="if(confirm('您确定该订单客户已签收吗?')) location.href='?Ac=ok&dan=<%=dingdan%>';else return;">
							<input type="button" name="Submit3" value="取消订单" onClick="if(confirm('您确定要取消该订单吗?')) location.href='?Ac=del&dan=<%=dingdan%>';else return;">
							<%End if%>
							<input type="button" name="Submit2" value="关闭窗口" onClick=javascript:window.close()>
                            <input type="button" onClick="preview();window.close()" value="打印">      
                               <input type="button" onClick="javascript:window.location.href='?Ac=fsjf&dan=<%=dingdan%>'" value="发送积分">                        </td>
                          </tr>
                        </table><!--endprint-->
<%
Rs.Close
Set Rs=Nothing
%>						
</body>
</html>