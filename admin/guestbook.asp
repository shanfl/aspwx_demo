<!--#include file="conn.asp"-->
<!--#include file="page.asp"-->
<!--#include file="seeion.asp"-->
<%
If request("act") = "del" Then
  ID=request("ID")

for each ss in request("ID")
set rs=createobject("adodb.recordset")
sql="delete from guestbook where id="&ss
    rs.open sql,conn,1,3
	next

End If
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>网站后台管理系统</title>
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
	  alert('请至少选择一条记录！');
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
      <h2>外送订单管理</h2>
    </div>
    <div class="right_body">
      <table width="200" border="0" align="center" class="table">
        <%
		act=request("act")
		s=request("s")
		user=request.Form("user")
		username=request.Form("username")
		danhao=request.Form("danhao")
Set rs=server.CreateObject("adodb.recordset")
if act="sou" and user<>"" then
sql = "select * from guestbook where Log_back='1' and realname like '%"&user&"%' order by id desc"
elseif act="sou" and danhao<>"" then
sql = "select * from guestbook where Log_back='1' and client_fax like '%"&danhao&"%' order by id desc "
elseif act="sou" and username<>"" then
sql = "select * from guestbook where Log_back='1' and reguserid like '%"&username&"%' order by id desc "
elseif act="sou" and s<>"" then
sql = "select * from guestbook where Log_back='1' and hytype=1 order by id desc "
else
sql = "select * from guestbook where Log_back='1' order by id desc"
end if
rs.Open sql, conn, 1, 1
if rs.eof then
response.Write "暂无订单!"
else
if rs.recordcount>0 then
      
  rs.PageSize=20 '每页记录条数 
  iCount=rs.RecordCount '记录总数 
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
            <td width="103" align="center"><input type="button" name="update" value="只看会员订单" onclick="window.location.href='?act=sou&s=hy' "/></td>
            <td width="93" align="center">按会员查询：</td>
            <td width="99" align="center"><input name="username" type="text" id="username" size="10" /></td>
            <td width="88" align="center">按联系人：</td>
            <td width="93" align="center"><input name="user" type="text" id="user" size="10" /></td>
            <td width="97" align="center">按发货单号：            </td>
            <td width="111" align="center"><input name="danhao" type="text" id="danhao" size="15" /></td>
            <td width="68" align="left"><label>
              <input type="submit" name="submit" id="button" value="查询" />
            </label></td>
          </tr>
                 </form>
                  <form action="?act=del" method="post" name="delform" id="delform">
          <tr>
            <td colspan="8" align="center"><table width="200" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="6%" align="center">选择</td>
                <td width="9%" align="center">联系人</td>
                <td width="9%" align="center">电话</td>
                <td width="16%" align="center">商品名称</td>
                <td width="7%" align="center">数量</td>
                <td width="12%" align="center">派餐地址</td>
                <td width="7%" align="center">订餐时间</td>
                <td width="8%" align="center">合计</td>
                <td width="8%" align="center">状态</td>
                <td width="8%" align="center">操作</td>
                <td width="10%" align="center">删除</td>
              </tr>
                  <%  for i=1 to x
				   Set rsa = server.CreateObject("adodb.recordset")
sql = "select * from products where id="& rs("chkmeasure")
rsa.Open sql, conn, 1, 1
if not rsa.eof then
				  %>
              <tr>
                <td align="center"><input type="checkbox" name="ID" value="<%=rs("id")%>" /></td>
                <td align="center"><%=rs("realname")%></td>
                <td align="center"><%=rs("handtel")%></td>
                <td align="center"><a href="../show/?id=<%= rsa("id") %>"><font color="#3399FF"><%=rsa("title")%></font></a></td>
                <td align="center"><%= rs("Publisher_netclue") %>&nbsp;</td>
                <td align="center"><%= rs("home_address") %></td>
                <td align="center"><%= rs("aftime") %></td>
                <td align="center"><%hj=rs("Publisher_netclue")*rsa("gsmt") 
				response.Write hj%></td>
                <td align="center"><% if rs("chkos")=1 then%><font color="#FF0000">已派送</font><% Else %>
                  未派送<% End If %>
</td>
                <td><input type="button" name="update" value="查看" onclick="window.location.href='guestbook_view.asp?id=<%=rs("id")%>' "/></td>
                <td><input name="delete" type="button" value="删除" onclick="javascript:if(confirm('确定要删除此条订单吗？删除后不可恢复!')){window.location.href='guestbook.asp?act=del&amp;id=<%=rs("id")%>';}else{history.go(0);}" /></td>
              </tr>
              <%
			  end if
rs.movenext
next
Set rs = Nothing
End If

end if
%>
            </table></td>
          </tr>
  
          <tr>
            <td colspan="8" align="center"><table width="230" border="0" cellspacing="0" cellpadding="0">
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
<%'以下显示分页
call PageControl(iCount,maxpage,page,"border=0 align=center","<center>")
%>

    </div>
  </div>
  <div class="clear"></div>
</div>
<!--#include file="footer.asp"-->
