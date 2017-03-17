<!--#include file="../conn.asp"-->

<% Response.charset="GB2312" %>

<% 
pagea = request.QueryString("page")


id=GetSafeStr(request("id"))
 Set rsp = Server.CreateObject("ADODB.RecordSet")
    sqlp = "select * from pinglun where Card_number='1' and cpid='"&id&"'"'连接表，id=0表示不从表里面输出数据
    rsp.Open sqlp, conn, 1, 1
	If rsp.EOF and rsp.bof Then
	response.Write("no")
	else        
rsp.pagesize=5
if pagea<>"" then
  epage=cint(request("page"))
   if epage<1 then epage=1
   'if epage>rsp.pagecount then epage=rsp.pagecount
else
epage=1
end if
rsp.absolutepage=epage

if epage>rsp.pagecount then
response.Write("no")
else
For  i=0 to rsp.pagesize-1

%>
  		   <dl>
			<dt>
			  <img src="../images/test_1.png" alt=""></dt>
			<dd>
			  <span class="ymname">
				<strong><%= rsp("realname") %></strong> 
				<span>  
                 <% If rsp("Run_effect")=1 Then %>★<% ElseIf  rsp("Run_effect")=2 Then %>★★<% ElseIf  rsp("Run_effect")=3 Then %>★★★<% ElseIf  rsp("Run_effect")=4 Then %>★★★★<% ElseIf  rsp("Run_effect")=5 Then %>★★★★★</span><%= rsp("aftime") %>
			  <% End If %>
</span>
			  <p>
				<%= rsp("text0") %>
 			  </p>
			</dd>
		   </dl>
                       <%
					   
rsp.movenext
Next
end if
rsp.Close
Set rsp = Nothing 
end if

%>