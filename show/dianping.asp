<!--#include file="../conn.asp"-->
<%  
Dim rs, sql, realname, handtel, text0, address, chkintruder, Home_address
realname = trim(Request("nc"))'*姓　名：
'handtel = Request("KS_dianhua")'手　机

text0 = GetSafeStr(Request("nr"))'内容
txt_check=GetSafeStr(Request("txt_check"))
Run_effect=GetSafeStr(Request("fs"))'打分
'Card_number=Request.Form("KS_fangshi")'消费方式
age=GetSafeStr(Request("ycid"))'产品ID
%>
<%
ip=GetIP()
If CStr(Session("psn"))<>CStr(Request.Form("txt_check")) or Request.Form("txt_check")="" Then
    response.Write("<script language=javascript>alert('验证码错误!');history.back(1)</script>")
elseif Conn.Execute("select count(id) from pinglun where Economic_lost='"&ip&"' and DateDiff('s',aftime,Now())<60")(0)>0 Then
response.Write("<script language=javascript>alert('两次评论相隔时间差少于60秒,请稍后尝试!');history.back(1)</script>")
else
    Set rs = Server.CreateObject("ADODB.RecordSet")
    sql = "select * from pinglun" '连接表，id=0表示不从表里面输出数据
    rs.Open sql, conn, 1, 3

	  rs.addnew
	 
    rs("realname") = realname
    'rs("handtel") =handtel
	 rs("text0") =text0
   rs("cpid")=age
   rs("Economic_lost")=ip

	rs("Run_effect")=Run_effect
 rs("Card_number")=0
   rs("aftime")=now
   	
    rs.update

    rs.Close
    Set rs = Nothing
    conn.Close
    Set conn = Nothing
  response.Write("<script language=javascript>alert('提交成功!');history.back(1)</script>")
%>

<%
end if
%>
