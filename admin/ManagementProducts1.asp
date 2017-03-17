<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<!--#include file="page.asp"-->
<%
If request("act") = "del" Then
    Set rs = server.CreateObject("adodb.recordset")
    id = request.QueryString("id")
    sql = "select * from products where id="&id
    rs.Open sql, conn, 1, 3
    rs.Delete
    rs.update
    response.Redirect "ManagementProducts.asp"
End If

  ac=request("ac")
  cpid=request("cpid")
  if ac="sj" then
 Conn.Execute("update [products] set ssqy='1' where id="&cpid&"")
 elseif ac="xj" then
 
Conn.Execute("update [products] set ssqy='2' where id="&cpid&"")

end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>网站后台管理系统</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!--#include file="header.asp"-->
<div id="top_banner" class="layout"></div>
<div id="content" class="layout">
  <!--#include file="left.asp"-->
  <div id="right">
    <div class="right_title">
      <h2>管理产品</h2>
    </div>
    <div class="right_body">
    <div class="saafd"><form method="post" name="form1" action="?act=sou">
          <tr>
            <td width="103" align="center">&nbsp;</td>
            <td width="93" align="center">按标题关键词查询：</td>
            <td width="99" align="center"><input name="key" type="text" id="key" size="20" /></td>
            <td width="111" align="center">&nbsp;</td>
            <td width="68" align="left"><label>
              <input type="submit" name="submit" id="button" value="查询" />
            </label></td>
          </tr>
                 </form></div>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
        <form method="post" name="news_category" id="news_category">
          <tr>
            <td width="7%" height="24" align="center" style="color:#FFF; background:#248fd7;">ID</td>
            <td width="15%" align="center" style="color:#FFF; background:#248fd7;">产品缩略图</td>
            <td width="22%" align="center" style="color:#FFF; background:#248fd7;">产品名称</td>
            <td width="12%" align="center" style="color:#FFF; background:#248fd7;">类别</td>
            <td width="11%" align="center" style="color:#FFF; background:#248fd7;">状态</td>
            <td colspan="2" align="center" style="color:#FFF; background:#248fd7;">操作</td>
          </tr>
          
                  <%
				  act=request("act")
				  key=request("key")
				
				  if request.QueryString("flid")<>"" then
				sql = "from products where main_id="&request.QueryString("flid")&""
				elseif act="sou" then
				sql = "from products where title like '%"&key&"%' "
				else
sql = "from products where 1=1"
end if
page_size = 20
total = conn.Execute("select Count(*) "&sql)(0)
If total = 0 Then
    Response.Write("暂无产品！！")
Else
    page = request.QueryString("page")
    If page<>"" And IsNumeric(page) Then page = CInt(page) Else page = 1
    If total Mod page_size = 0 Then pages = total / page_size Else pages = total \ page_size + 1
    If page>pages Then page = pages
    If page>1 Then Set rs = conn.Execute("select Top "&page_size&" * "&sql&" and id>(select max(id) from (select top "&page_size * (page -1)&" id "&sql&") as maxId)") Else Set rs = conn.Execute("select Top "&page_size&" * "&sql&" order by id desc")
    Do While Not rs.EOF
	Set rsf = server.CreateObject("adodb.recordset")
    sql = "select * from products_category_main where main_id="&rs("main_id")
    rsf.Open sql, conn, 1, 1
%>

          <tr>
            <td align="center"><%=rs("id")%></td>
            <td width="15%" align="center"><img src="/<%=rs("uploadfile")%>" width="50" height="20" title="<%=rs("title")%>" alt="<%=rs("title")%>" /></td>
            <td width="22%" align="center" ><%=rs("title")%></td>
            <td width="12%" align="center" ><a style="color:#00F;" href="?flid=<%= rs("main_id") %>"><%=rsf("main_title")%></a></td>
            <td width="11%" align="center" > 
            
            <% If rs("ssqy")=1 Then %>
            <input  type="button" class="xj" value="点击下架" onclick="javascript:window.location.href='ManagementProducts.asp?ac=xj&cpid=<%=rs("id")%>';" />
            <% Else %>

            <input  type="button" class="sj" value="点击上架" onclick="javascript:window.location.href='ManagementProducts.asp?ac=sj&cpid=<%=rs("id")%>';" />
            <% End If %>

            </td>
            <td width="14%" align="center"><input type="button" name="update" value="修改内容" onclick="window.location.href='products_update.asp?id=<%=rs("id")%>' " /></td>
            <td width="19%" align="left"><input type="button" name="delete" value="删除产品" onclick="javascript:if(confirm('确定要删除此类产品吗？删除后不可恢复!')){window.location.href='ManagementProducts.asp?act=del&amp;id=<%=rs("id")%>';}else{history.go(0);}" /></td>
          </tr>
        </form>
        <%
rs.movenext
Loop
rs.Close
Set rs = Nothing
End If
%>
      </table>
          <p>&nbsp; </p>
<%'以下显示分页
Call PageControl(total, pages, page, "border=0 align=center", "<p align=center>")
%>
    </div>
  </div>
  <div class="clear"></div>
</div>
<!--#include file="footer.asp"-->
