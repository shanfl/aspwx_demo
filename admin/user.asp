<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<!--#include file="page.asp"-->
<%
If request("act") = "del" Then
  ID=request("ID")

for each ss in request("ID")
set rs=createobject("adodb.recordset")
sql="delete from [user] where userid="&ss
    rs.open sql,conn,1,3
	next

End If
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
      <h2>��Ա����</h2>
    </div>
    <div class="right_body">
      <table width="200" border="0" align="center" class="table">
   <%
				Const MaxPerPage=20 
   				dim totalPut   
   				dim CurrentPage
   				dim TotalPages
   				dim j
   				dim sql
    				if Not isempty(request("page")) then
      				currentPage=Cint(request("page"))
   				else
      				currentPage=1
   				end if 
		  dim namekey,checkbox,action
		  action=request.QueryString("action")
		  checkbox=request("checkbox")
		  namekey=request("namekey")
		  if InStr(namekey,"'")>0 then
response.write"<script>alert(""�Ƿ�����!"");location.href=""index.asp"";</script>"
response.end
end if
		  if namekey="" then namekey=request.QueryString("namekey")
		  if checkbox="" then checkbox=request.querystring("checkbox")
		 '//
		 set rs=server.CreateObject("adodb.recordset")
		 if namekey="" then
		  'select case action
		  'case "all"
		 	rs.open "select * from [user]  where niming=0 order by adddate desc",conn,1,1
   		  'case "niming"
		 '	rs.open "select username,userid,UserEmail,logins,adddate from [user]  where niming=1 order by adddate desc",conn,1,1
		  'case "huiyuan"
		 '	rs.open "select username,userid,UserEmail,logins,adddate from [user] where reglx=1  order by adddate desc",conn,1,1
		  'case "vip"
		 '	rs.open "select username,userid,UserEmail,logins,adddate from [user] where reglx=2  order by adddate desc",conn,1,1
		  'end select
		  else
		  if checkbox=1 then
		  rs.open "select * from [user] where username like '%"&namekey&"%'  order by adddate desc ",conn,1,1
		  else
		  rs.open "select * from [user] where username='"&namekey&"'  order by adddate desc ",conn,1,1
		  end if
		  end if
				if err.number<>0 then
				response.write "���ݿ���������"
				end if
  				if rs.eof And rs.bof then
       				Response.Write "<p align='center' class='contents'> �Բ���û���ҵ����û���</p>"
					
   				else
	  				totalPut=rs.recordcount
      				if currentpage<1 then
          				currentpage=1
      				end if
      				if (currentpage-1)*MaxPerPage>totalput then
	   					if (totalPut mod MaxPerPage)=0 then
	     					currentpage= totalPut \ MaxPerPage
	   					else
	      					currentpage= totalPut \ MaxPerPage + 1
	   					end if
      				end if
       				if currentPage=1 then
            			showContent
            			showpage totalput,MaxPerPage,"user.asp"
       				else
          				if (currentPage-1)*MaxPerPage<totalPut then
            				rs.move  (currentPage-1)*MaxPerPage
            				dim bookmark
            				bookmark=rs.bookmark
            				showContent
             				showpage totalput,MaxPerPage,"user.asp"
        				else
	        				currentPage=1
           					showContent
           					showpage totalput,MaxPerPage,"user.asp"
	      				end if
	   				end if
   				   				end if
   				sub showContent
       			dim i
	   			i=0
			%>
            
        <form method="post" name="form1" action="?act=sou">
          <tr>
            <td width="119" align="center">���û������ң�</td>
            <td width="136" align="center"><input name="namekey" type="text" id="namekey" size="20" /></td>
            <td width="34" align="center"><input name="checkbox" type="checkbox" id="checkbox" value="1" checked></td>
            <td width="75" align="center">ģ����ѯ            </td>
            <td width="81" align="center"><input type="submit" name="submit" id="button" value="��ѯ" /></td>
            <td width="315" align="left">&nbsp;</td>
          </tr>
                 </form>
                  <form action="?act=del" method="post" name="delform" id="delform">
          <tr>
            <td colspan="6" align="center"><table width="200" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="6%" align="center">ѡ��</td>
                <td width="5%" align="center">ID</td>
                <td width="10%" align="center">��Ա��</td>
                <td width="11%" align="center">�ֻ�����</td>
                <td width="12%" align="center">ע��ʱ��</td>
                <td width="8%" align="center">��½����</td>
                <td width="12%" align="center">����½IP</td>
                <td width="8%" align="center">ӵ�л���</td>
                <td width="9%" align="center">������</td>
                <td width="19%" align="center">�û�����</td>
              </tr>
              <%do while not rs.eof%>
              
              <tr>
                <td align="center"><input type="checkbox" name="ID" value="<%=rs("userid")%>" /></td>
                <td align="center"><%=rs("Userid")%></td>
                <td align="center" class="dd"><a  href="javascript:;" onclick="javascript:window.open('vipuser.asp?id=<%=trim(rs("Userid"))%>','','width=650,height=462,toolbar=no, status=no, menubar=no, resizable=yes, scrollbars=yes');return false;"><%=trim(rs("username"))%></a></td>
                <td align="center"><%=rs("usertel")%></a></td>
                <td align="center"><%= rs("addDate") %>&nbsp;</td>
                <td align="center"><%=Conn.Execute("select count(id) from log where user='"&rs("UserName")&"'")(0) %></td>
                <td align="center"><%=Conn.Execute("select ip from log order by time desc")(0)%></td>
                <td align="center"><%=rs("jifen")%></td>
                <td align="center"><%=rs("cxmoney")%></td>
                <td align="center"><%=rs("UserEmail")%></td>
              </tr>
<%i=i+1
		if i>=MaxPerPage then Exit Do
		rs.movenext
		loop%>
            </table></td>
          </tr>
  
          <tr>
            <td colspan="6" align="center"><table width="230" border="0" cellspacing="0" cellpadding="0">
              <tr>
                  <td width="35%" align="center">&nbsp;</td>
                  <td width="5%"><input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);" style="border:0px;" /></td>
                  <td width="60%"><input name="image" type="image" style="width:94px; height:20px; border:0px;" onclick="return CheckOne();" src="del_all.jpg" /></td>
                </tr>
            </table></td>
          </tr>      
     </form>
  
      </table>
     <%  
				End Sub   
				Function showpage(totalnumber,maxperpage,filename)  
  				Dim n
				If totalnumber Mod maxperpage=0 Then  
					n= totalnumber \ maxperpage  
				Else
					n= totalnumber \ maxperpage+1  
				End If
				Response.Write "<form method=Post action="&filename&"?action="&action&"&checkbox="&checkbox&"&namekey="&namekey&">"  
				Response.Write "<p align='center' class='contents'> "  
				If CurrentPage<2 Then  
					Response.Write "<font class='contents'>��ҳ ��һҳ</font> "  
				Else  
					Response.Write "<a href="&filename&"?action="&action&"&page=1&checkbox="&checkbox&"&namekey="&namekey&" class='contents'>��ҳ</a> "  
					Response.Write "<a href="&filename&"?action="&action&"&page="&CurrentPage-1&"&checkbox="&checkbox&"&namekey="&namekey&" class='contents'>��һҳ</a> "  
				End If
				If n-currentpage<1 Then  
					Response.Write "<font class='contents'>��һҳ βҳ</font>"  
				Else  
					Response.Write "<a href="&filename&"?action="&action&"&page="&(CurrentPage+1)&"&checkbox="&checkbox&"&namekey="&namekey&" class='contents'>"  
					Response.Write "��һҳ</a> <a href="&filename&"?action="&action&"&page="&n&"&checkbox="&checkbox&"&namekey="&namekey&" class='contents'>βҳ</a>"  
				End If  
					Response.Write "<font class='contents'> ҳ�Σ�</font><font class='contents'>"&CurrentPage&"</font><font class='contents'>/"&n&"ҳ</font> "  
					Response.Write "<font class='contents'> ����"&totalnumber&"��ע���û� " 
					Response.Write "<font class='contents'>ת����</font><input type='text' name='page' size=2 maxlength=10 class=smallInput value="&currentpage&">"  
					Response.Write "&nbsp;<input type='submit'  class='contents' value='GO' name='cndok'></form>"  
				End Function  
			%>


    </div>
  </div>
  <div class="clear"></div>
</div>
<!--#include file="footer.asp"-->
