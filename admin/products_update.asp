<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<!--#include file="fckeditor/fckeditor.asp"-->
<%
If request("submit") = "确定修改" Then
    id = request("id")
    sql = "select * from products where id="&id
    Set rs = server.CreateObject("adodb.recordset")
    rs.Open sql, conn, 1, 3
    rs("title") = request.Form("title")
    rs("body") = request.Form("body")
    rs("main_id") = request.Form("main_id")
    rs("uploadfile") = request.Form("uploadfile")
    rs("recommendatory") = request.Form("recommendatory")
	rs("tzed")= request.Form("tzed")
	rs("jfgmid")=request.Form("jfgmid")
	 rs("Provi") = request.Form("Provi")
    rs("City") = request.Form("City")
    rs("gsmt") = request.Form("gsmt")
    rs("lxdh") = request.Form("lxdh")
	rs("date") = now()
    rs.update
    rs.Close
    response.Write "<script>alert('产品修改成功！');window.location.href='ManagementProducts.asp';</script>"
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
<!--#include file="header.asp"-->
<div id="top_banner" class="layout"></div>
<div id="content" class="layout">
  <!--#include file="left.asp"-->
  <div id="right">
    <div class="right_title">
      <h2>修改产品</h2>
      <%
Set rs = server.CreateObject("adodb.recordset")
exec = "select * from products where id="& request("id")
rs.Open exec, conn, 1, 3
%>
    </div>
    <div class="right_body">
    <table width="98%" border="0" cellpadding="0" cellspacing="0" class="table">
      <form name="cherry" method="post" action="products_update.asp">
        <tr>
          <td width="9%">产品名称</td>
          <td width="91%"><input name="id" type="hidden" value="<%=request.querystring("id")%>" />
            <input name="title" type="text" onblur='value=value.replace(/[>"<]/g,"")' value="<%=rs("title")%>" size="80"></td>
        </tr>
        <tr >
          <td>积分兑换：</td>
          <td><input name="tzed" type="text" id="tzed" value="<%=rs("tzed")%>" size="20" />
          
              <input name="jfgmid" type="checkbox" id="jfgmid" value="1" <% If rs("jfgmid")=1 Then %>checked="checked"  <% End If %>
/>
            是否可以用积分购买，打沟则可以用积分购买</td>
        </tr>
        <tr style="display:none">
          <td>所属区域：</td>
          <td><input name="Provi" type="text" id="Provi" value="<%=rs("Provi")%>" size="10" />
            -
            <input name="City" type="text" id="City" value="<%=rs("City")%>" size="10" /></td>
        </tr>
        <tr>
          <td>单价：</td>
          <td><input name="gsmt" type="text" id="gsmt" value="<%=rs("gsmt")%>" size="40" /></td>
        </tr>
        <tr>
          <td>送积分：</td>
          <td><input name="lxdh" type="text" id="lxdh" value="<%=rs("lxdh")%>" size="40" /></td>
        </tr>
        <tr>
          <td>产品分类</td>
          <td><select name="main_id" id="main_id" >

           
            
              <%
Set rss = conn.Execute("select * from products_category_main order by order_id")
Do While Not rss.EOF
    If rs("main_id") = rss("main_id") Then
        response.Write("<option value=""" & rss("main_id") & """ selected>" & rss("main_title") & "</option>")
    Else
        response.Write("<option value=""" & rss("main_id") & """>" & rss("main_title") & "</option>")
    End If
    rss.movenext
Loop
rss.Close
Set rss = Nothing

%> </select></td>
        </tr>
        <tr>
          <td rowspan="2">产品缩略图</td>
          <td><input name="uploadfile" type="text" value="<%=rs("uploadfile")%>" size="80"/></td>
        </tr>
        <tr>
          <td><iframe src="upload.asp" width="600" height="25" scrolling="auto" frameborder="0"></iframe></td>
        </tr>
        <tr>
          <td height="258">内容详情</td>
          <td><%
Dim oFCKeditor
Set oFCKeditor = New FCKeditor
oFCKeditor.BasePath = "fckeditor/"
oFCKeditor.ToolbarSet = "Default"
oFCKeditor.Width = "100%"
oFCKeditor.Height = "360"
oFCKeditor.Value = rs("body")
oFCKeditor.Create "body"
%>
</td>
        </tr>
        <tr>
          <td>产品推荐
            <p>&nbsp;</p></td>
          <td><input name="recommendatory" type="radio" value="1" <% If rs("recommendatory")=1 Then %>checked="checked"<% End If %>
 />
            推荐
            <input name="recommendatory" type="radio" value="0" <% If rs("recommendatory")=0 Then %>checked="checked"<% End If %>/>
            不推荐</td>
        </tr>
        <tr>
          <td colspan="2"><p class="submit">
              <input name="submit" type="submit" value="确定修改" />
            </p></td>
        </tr>
      </form>
    </table>
    </div>
  </div>
  <div class="clear"></div>
</div>
<!--#include file="footer.asp"-->
