<!--#include file="../conn.asp"-->
<%  
Dim rs, sql, realname, handtel, text0, address, chkintruder, Home_address
realname = trim(Request("nc"))'*�ա�����
'handtel = Request("KS_dianhua")'�֡���

text0 = GetSafeStr(Request("nr"))'����
txt_check=GetSafeStr(Request("txt_check"))
Run_effect=GetSafeStr(Request("fs"))'���
'Card_number=Request.Form("KS_fangshi")'���ѷ�ʽ
age=GetSafeStr(Request("ycid"))'��ƷID
%>
<%
ip=GetIP()
If CStr(Session("psn"))<>CStr(Request.Form("txt_check")) or Request.Form("txt_check")="" Then
    response.Write("<script language=javascript>alert('��֤�����!');history.back(1)</script>")
elseif Conn.Execute("select count(id) from pinglun where Economic_lost='"&ip&"' and DateDiff('s',aftime,Now())<60")(0)>0 Then
response.Write("<script language=javascript>alert('�����������ʱ�������60��,���Ժ���!');history.back(1)</script>")
else
    Set rs = Server.CreateObject("ADODB.RecordSet")
    sql = "select * from pinglun" '���ӱ�id=0��ʾ���ӱ������������
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
  response.Write("<script language=javascript>alert('�ύ�ɹ�!');history.back(1)</script>")
%>

<%
end if
%>
