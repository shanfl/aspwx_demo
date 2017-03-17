<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<!--#include file="fckeditor/fckeditor.asp"-->
<%
If request("submit") = "确定添加" Then
    title = request.Form("title")
    main_id = request.Form("main_id")
    sub_id = request.Form("sub_id")
    thumbnail = request.Form("thumbnail")
    body = request.Form("body")
    recommendatory = request.Form("recommendatory")
	uploadfile=request.Form("uploadfile")
	tzed= request.Form("tzed")
	jfgmid= request.Form("jfgmid")
	  Provi = request.Form("Provi")
    City = request.Form("City")
    gsmt = request.Form("gsmt")
    lxdh = request.Form("lxdh")
    If title = "" or body="" or tzed=""  or gsmt="" or lxdh=""Then
        response.Write("<script language=javascript>alert('信息不能为空!');history.back(1)</script>")
   else

    Set rs = server.CreateObject("adodb.recordset")
    sql = "select * from products"
    rs.Open sql, conn, 1, 3
    rs.addnew
    rs("title") = title
    rs("main_id") = main_id
    rs("uploadfile") = uploadfile
    rs("body") = body
 rs("ssqy") = 1
   rs("date") = now()
    rs("recommendatory") = recommendatory
	rs("tzed")=tzed
	rs("jfgmid")=jfgmid
   rs("Provi") =Provi
   rs("City") =City
    rs("gsmt")=gsmt
	
    rs("lxdh")=lxdh
    rs.update
    rs.Close
    Set rs = Nothing
	end if
    Response.Write "<script>alert('成功添加产品，点击“确定”继续添加！');window.location.href='products.asp';</script>"
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
      <h2>添加产品</h2>
    </div>
    <div class="right_body">
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
        <form name="cherry" method="post" >
          <tr>
            <td width="12%">产品名称：</td>
            <td width="88%"><input name="title" type="text" size="40" /></td>
          </tr>
          <tr >
            <td>积分兑换：</td>
            <td>
              <input name="tzed" type="text" id="tzed" size="20" />
              <label>
                <input name="jfgmid" type="checkbox" id="jfgmid" value="1" />
            是否可以用积分购买，打沟则可以用积分购买</label></td>
          </tr>
          <tr style="display:none">
            <td>所属区域：</td>
            <td><script type="text/javascript" src="images/selectcity.js"></script>
<select id="selProvince" name="Provi" onChange = "getCity(this.options[this.selectedIndex].value)"></select>
<select id="selCity" name="City" ><option>-城市-</option></select> &nbsp;<span id="checkcity">&nbsp;</span>
<script type="text/javascript">
initProvince();
function jsSelectItemByValue(objSelect,objItemText)
{    
    //判断是否存在
    var isExit = false;
    for(var i=0;i<objSelect.options.length;i++)
    {
        if(objSelect.options[i].text == objItemText)
        {
            objSelect.options[i].selected = true;
            isExit = true;
            break;
        }
    }      
}
window.onload=function(){
jsSelectItemByValue(searchform.selProvince,"");
}
</script></td>
          </tr>
          <tr>
            <td>单价：</td>
            <td><input name="gsmt" type="text" id="gsmt" size="40" /></td>
          </tr>
          <tr>
            <td>送积分：</td>
            <td><input name="lxdh" type="text" id="lxdh" size="40" /></td>
          </tr>
          <tr>
            <td>产品分类：</td>
            <td><select name="main_id" id="main_id" onChange="changelocation(document.cherry.main_id.options[document.cherry.main_id.selectedIndex].value,document.cherry)">
                <%
i = 0
Set rs = Conn.Execute("select * from products_category_main order by order_id")
Do While Not rs.EOF
    If i = 0 Then main_id = rs(0)
    Response.Write("<option value="""&rs(0)&""">"&rs(1)&"</option>")
    i = i + 1
    rs.movenext
Loop
rs.Close
Set rs = Nothing
%>
              </select></td>
          </tr>
          <tr>
            <td rowspan="2">产品缩略图：</td>
            <td><input type="text" name="uploadfile" size="40" /></td>
          </tr>
          <tr>
            <td><iframe src="upload.asp" width="600" height="25" scrolling="Auto" frameborder="0"></iframe></td>
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
oFCKeditor.Value = ""
oFCKeditor.Create "body"
%></td>
          </tr>
          <tr>
            <td valign="middle">产品推荐
              <p>&nbsp;</p></td>
            <td><input name="recommendatory" type="radio" value="1" />
              推荐
              <input name="recommendatory" type="radio" checked="checked" value="0" />
              不推荐</td>
          </tr>
          <tr>
            <td colspan="2"><p class="submit">
                <input name="submit" type="submit" value="确定添加" />
              </p></td>
          </tr>
        </form>
      </table>
    </div>
  </div>
  <div class="clear"></div>
</div>
<!--#include file="footer.asp"-->