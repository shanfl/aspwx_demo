<!--#include file="conn.asp"-->
<!--#include file="page.asp"-->
<!--#include file="seeion.asp"-->

<%dim zhuangtai,namekey
namekey=trim(request("namekey"))
zhuangtai=trim(request("zhuangtai"))
danhao=trim(request("danhao"))

if zhuangtai<>"" then
if not isnumeric(zhuangtai) then 
response.write"<script>alert(""�Ƿ�����!"");location.href=""index.asp"";</script>"
response.end
end if
end if
'if zhuangtai="" then zhuangtai=request.QueryString("zhuangtai")
'if namekey="" then namekey=request.querystring("namekey")
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
      <h2>���Ͷ�������</h2>
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
	set rs=server.CreateObject("adodb.recordset")
	select case zhuangtai
	  case "0"
	  sql="select distinct(username),userid,userzhenshiname,actiondate,useremail,zhuangtai from orders where zhuangtai=0"
	  case "1"
	  sql="select distinct(username),userid,userzhenshiname,actiondate,useremail,zhuangtai from orders where zhuangtai=1"
	  case "2"
	  sql="select distinct(username),userid,userzhenshiname,actiondate,useremail,zhuangtai from orders where zhuangtai=2"
	  case "3"
	  sql="select distinct(username),userid,userzhenshiname,actiondate,useremail,zhuangtai from orders where zhuangtai=3"
	   case "6"
	  sql="select distinct(username),userid,userzhenshiname,actiondate,useremail,zhuangtai from orders where zhuangtai=6"
	  case else
	  sql="select distinct(username),userid,userzhenshiname,actiondate,useremail,zhuangtai from orders where zhuangtai<7"
	end select
	If namekey<>"" Then
	sql=sql&" and shouhuoname='"&namekey&"' order by actiondate desc"
	Elseif danhao<>"" then
	sql=sql&" and username='"&danhao&"' order by actiondate desc"
	else
	sql=sql&" order by actiondate desc"
	End if
    rs.open sql,conn,1,1
				if err.number<>0 then
				response.write "���ݿ���������"
				end if
  				if rs.eof And rs.bof then
       				Response.Write "<p align='center' class='contents'> �Բ�����ѡ���״̬��û�ж�����</p>"
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
            			showpage totalput,MaxPerPage,"adorders.asp"
       				else
          				if (currentPage-1)*MaxPerPage<totalPut then
            				rs.move  (currentPage-1)*MaxPerPage
            				dim bookmark
            				bookmark=rs.bookmark
            				showContent
             				showpage totalput,MaxPerPage,"adorders.asp"
        				else
	        				currentPage=1
           					showContent
           					showpage totalput,MaxPerPage,"adorders.asp"
	      				end if
	   				end if
   				   				end if
   				sub showContent
       			dim i
	   			i=0
			%>
        <form method="post" name="form1" action="?act=sou">
          <tr>
            <td width="109" align="center"><select name="select2" onChange="var jmpURL=this.options[this.selectedIndex].value ; if(jmpURL!='') {window.location=jmpURL;} else {this.selectedIndex=0 ;}" >
                <option value="adorders.asp" >ȫ������״̬</option>
            <option value="adorders.asp?zhuangtai=6" >δ������</option>
            <option value="adorders.asp?zhuangtai=2" >�ѷ�������</option>
            <option value="adorders.asp?zhuangtai=1" >��ǩ�ն���</option>
            <option value="adorders.asp?zhuangtai=0" >��ȡ������</option>
          </select></td>
            <td width="91" align="center">����ϵ�ˣ�</td>
            <td width="124" align="center"><input name="namekey" type="text" id="namekey" size="15" /></td>
            <td width="115" align="center">�������ţ�            </td>
            <td width="131" align="center"><input name="danhao" type="text" id="danhao" size="15" /></td>
            <td width="190" align="left"><label>
              <input type="submit" name="submit" id="button" value="��ѯ" />
            </label></td>
          </tr>
                 </form>
                  <form action="?act=del" method="post" name="delform" id="delform">
          <tr>
            <td colspan="6" align="center"><table width="200" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="20%" align="center">������</td>
                <td width="14%" align="center">�µ��û�</td>
                <td width="13%" align="center">����״̬</td>
                <td width="14%" align="center">�µ�ʱ��</td>
                <td width="18%" align="center">����ע</td>
                <td width="21%" align="center">����</td>
                </tr>
                 <%
		do while not rs.eof
		dim Godbook,username
		  set Godbook=server.CreateObject("adodb.recordset")
		  Godbook.open "select username from [user] where userid="&rs("userid"),conn,1,1
		  if godbook.eof and godbook.bof then
		  username="�ο�"
		  else
		  username=trim(Godbook("username"))
		  end if
		  Godbook.close
		  set Godbook=nothing
		  %>
              <tr>
                <td align="center" class="dd"><a  href="javascript:;" onclick="javascript:window.open('vieworder.asp?dan=<%=trim(rs("username"))%>','','width=650,height=462,toolbar=no, status=no, menubar=no, resizable=yes, scrollbars=yes');return false;"><%=trim(rs("username"))%></a></td>
                <td align="center"><%=username%></td>
                <td align="center">
                
         ��
                  <%
				
			

	 select case rs("zhuangtai")
	case "0"
	Response.Write "<font color=""#cccccc"">��ȡ��</font>"
	case "1"

	response.write "<font color=""#008800"">��ǩ��</font>"
	case "2"
	response.write "<font color=""#CC3366"">�ѷ���</font>"
	case "6"
	response.write "<font color=""red"">δ����</font>"
	end select%>
               </td>
                <td align="center"><%=rs("actiondate")%>&nbsp;</td>
                <td align="center"><%=HtmlEnCode(Rs("useremail"))%></td>
                <td align="center" class="dd"><%If Rs("zhuangtai")=6 or Rs("zhuangtai")=2 Then%>
                      <input name="" type="button" onclick="javascript:window.open('noteorder.asp?dan=<%=trim(rs("username"))%>','','width=650,height=388,toolbar=no, status=no, menubar=no, resizable=yes, scrollbars=yes');return false;" value="���±�ע"/>
                  <%Else%>
                  <font color="#CCCCCC">���±�ע</font>
                  <%End if%></td>
                </tr>
  <%i=i+1
			if i>=MaxPerPage then Exit Do
			rs.movenext
		loop
		rs.close
		set rs=nothing%>
            </table></td>
          </tr>
  
          <tr>
            <td colspan="6" align="center"><table width="230" border="0" cellspacing="0" cellpadding="0">
              <tr>
                  <td width="35%" align="center">&nbsp;</td>
                  <td width="5%">&nbsp;</td>
                  <td width="60%">&nbsp;</td>
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
				if namekey="" then
				Response.Write "<form method=Post action="&filename&"?zhuangtai="&zhuangtai&">"  
				else
				Response.Write "<form method=Post action="&filename&"?zhuangtai="&zhuangtai&"&namekey="&namekey&">" 
				end if
				Response.Write "<p align='center' class='contents'> "  
				If CurrentPage<2 Then  
					Response.Write "<font class='contents'>��ҳ ��һҳ</font> "  
				Else  
					if namekey="" then
					Response.Write "<a href="&filename&"?page=1&zhuangtai="&zhuangtai&" class='contents'>��ҳ</a> "  
					Response.Write "<a href="&filename&"?page="&CurrentPage-1&"&zhuangtai="&zhuangtai&" class='contents'>��һҳ</a> "  
					ELSE
					Response.Write "<a href="&filename&"?page=1&zhuangtai="&zhuangtai&"&namekey="&namekey&" class='contents'>��ҳ</a> "  
					Response.Write "<a href="&filename&"?page="&CurrentPage-1&"&zhuangtai="&zhuangtai&"&namekey="&namekey&" class='contents'>��һҳ</a> "
					end if  
					End If
				If n-currentpage<1 Then  
					Response.Write "<font class='contents'>��һҳ βҳ</font>"  
				Else 
				if namekey="" then
					Response.Write "<a href="&filename&"?page="&(CurrentPage+1)&"&zhuangtai="&zhuangtai&" class='contents'>"  
					Response.Write "��һҳ</a> <a href="&filename&"?page="&n&"&zhuangtai="&zhuangtai&" class='contents'>βҳ</a>"
					else
					Response.Write "<a href="&filename&"?page="&(CurrentPage+1)&"&zhuangtai="&zhuangtai&"&namekey="&namekey&" class='contents'>"  
					Response.Write "��һҳ</a> <a href="&filename&"?page="&n&"&zhuangtai="&zhuangtai&"&namekey="&namekey&" class='contents'>βҳ</a>" 
					end if 
					End If  
					'Response.Write "<font class='contents'> ҳ�Σ�</font><font class='contents'>"&CurrentPage&"</font><font class='contents'>/"&n&"ҳ</font> "  
					'Response.Write "<font class='contents'> ����"&totalnumber&"�ʶ��� "&maxperpage&"�ʶ���/ҳ</font> " 
					'Response.Write "<font class='contents'>ת����</font><input type='text' name='page' size=2 maxlength=10 class=smallInput value="&currentpage&">"  
					'Response.Write "&nbsp;<input type='submit'  class='contents' value='GO' name='cndok'></form>"  
				End Function  
				%>

    </div>
  </div>
  <div class="clear"></div>
</div>
<!--#include file="footer.asp"-->
