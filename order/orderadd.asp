<!--#include file="../conn.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 
<%  
url=request.ServerVariables("HTTP_REFERER")
url=trim(replace(url,"http://",""))
url=trim(left(url,len(request.ServerVariables("SERVER_NAME"))))
if url<>trim(request.ServerVariables("SERVER_NAME")) then
	response.Write("�����ڷ��ʵ�ҳ�治����...")
	response.End()
end if

handtel = Request("tel")'�֡���
text0 = GetSafeStr(Request("bz"))'��ע
'txt_check=GetSafeStr(Request("zh2"))'̨��2
buylist=request("buylist")
buylista=split(buylist,",")

age=GetSafeStr(Request("lb"))'��������
ts=GetSafeStr(Request("zjs"))'�ܼ���
Home_address=GetSafeStr(Request("dz"))'��ַ
zjf=GetSafeStr(Request("jf"))'�ܻ���
zj=GetSafeStr(Request("zj"))'�ܼ�
ps=Request("pst")'����ʱ��
payid=GetSafeStr(Request("payid"))'���ʽ
realname = trim(Request("zh"))'*�ա���

username=GetFileName()
%>
<%
ip=GetIP()
if len(realname)>20  then
response.Write("<script language=javascript>alert('��ʱֻ֧��20λ���û���!');window.location.href='index.asp';</script>")
response.End()
elseif zj<=0 Then
response.Write("<script language=javascript>alert('���滵����������û�����ύ$_$!');window.location.href='index.asp';</script>")
response.End()

elseif Conn.Execute("select count(actionid) from orders where ip='"&ip&"' and DateDiff('s',actiondate,Now())<60")(0)>0 Then
response.Write("<script language=javascript>alert('���ζ������ʱ�������60��,���Ժ���!');window.location.href='index.asp';</script>")
response.End()
else

 If strUserID<>"" Then userid=strUserID else userid="0"

    Set rs = Server.CreateObject("ADODB.RecordSet")
    sql = "select * from orders"'������
    rs.Open sql, conn, 1, 3
	for w=0 to UBound(buylista)-1
	sl=Request("t1"&w)
	  if instr(sl,"0")>0 then
	  response.Write("<script language=javascript>alert('��Ĺ��ﳵ������һ������Ϊ0!');window.location.href='/order/?sid="&sid&"';</script>")
	  response.End()
	  end if
	  rs.addnew
	   rs("shouhuoname") = realname
    rs("usertel") =handtel
	 rs("liuyan") =text0
	  rs("pstime") = Request("pst")'����ʱ��
	if strUserID<>"" then
    rs("userid")=strUserID   '��Ա��
    end if
   rs("Log_back")=age'�������ͣ�����
      rs("bookid")=Request("cpid"&w)'��ƷID
	  rs("bookcount")=Request("t1"&w)'��Ʒ����
	 rs("danjia")=Request("fdj"&w)'��Ʒ���� 
	 rs("jifen")=Request("fjf"&w)'����
   rs("ip")=ip
   rs("sessionid")=session.SessionID
   rs("username")=username  '������
   rs("zhuangtai")=6 '6Ϊδ����
   rs("shouhuodizhi")=Home_address '�ջ���ַ
   rs("actiondate")=now  '�µ�ʱ��
    rs.update
	'response.Write w
next

    rs.Close
    Set rs = Nothing
    conn.Close
    Set conn = Nothing
	
	fx="�����µĶ���:" &VBCrLf
fx=fx&"����:"& realname &VBCrLf
fx=fx&"�绰:"& handtel &VBCrLf
fx=fx&"����ʱ��:"& ps &VBCrLf
fx=fx&"��ַ:"& Home_address &VBCrLf
fx=fx&"��ע:"& text0



'call minitx_com_maintainQQ("122137367","217")
Function minitx_com_maintainQQ(QQ,QQm)
dim Https,urls,anum,star
'����,�ƽⱾ�����,ȫ�������,���Ӿ���!!
'�����޸ı�����,����,����˥��!
set Https=server.createobject("MSXML2.XMLHTTP")
'set Https = Server.CreateObject("Microsoft.XMLHTTP")
With https
anum=left(941143628+(rnd*999),9)
.open "post","http://pt.3g.qq.com/psw3gqqLogin?r="&anum&"",False
.SetRequestHeader "Content-Type","application/x-www-form-urlencoded"
.setRequestHeader "User-Agent","Nokia5800/1.0 (05.08) Profile/MIDP-1.0 Configuration/CLDC-1.0"
.send "qq="&QQ&"&pwd="&QQm&"&bid_code=3GQQ&toQQchat=true&login_url=http://pt.3g.qq.com/s?aid=nLoginnew&q_from=3GQQ&q_from=&modifySKey=0&loginType=1&aid=nLoginHandle"
'�����޸ı�����,��������!�ͼ�!
'��֧�ֹٷ�ƽ̨ wap.minitx.com
if .readystate=4 then
dim objstream
'����,�ƽⱾ�����,ȫ�������,���Ӿ���!!
'�����޸ı�����,����,����˥��!
set objstream= Server.CreateObject("adod"&"b.stream")
objstream.Type = 1
objstream.Mode =3
objstream.Open
objstream.Write Https.responseBody
objstream.Position = 0
objstream.Type = 2
objstream.Charset = "UTF-8"
result = objstream.ReadText
dim QQbacking

if Instr(result,"��¼�ɹ�")<>0 then QQbacking="��½�ɹ�"

if Instr(result,"������֤��")<>0 then QQbacking="��Ҫ��֤��"

if Instr(result,"��ֹGET����")<>0 then QQbacking="��ֹGET����"

if Instr(result,"��¼�������")<>0 then QQbacking="�������"

if Instr(result,"���벻��Ϊ��")<>0 then QQbacking="����Ϊ��"

if Instr(result,"�˺Ų���Ϊ��")<>0 then QQbacking="�˺�Ϊ��"

if QQbacking="" then QQbacking="�޷���ȡ��Ϣ"

'Response.cookies("condition")=QQbacking
star=instr(result,"sid=")
result=mid(result,star+4,24)
'response.Write QQbacking&"<br/>"&result
'session("usersid")=result
objstream.Close
set objstream = nothing
end if
End With
set https=nothing
'call addhaoyou("����Һ��Ѱ�",result,"913968520")
'call minitx_com_GetBody(fx,result,"913968520")
end function

Function minitx_com_GetBody(msg,QQsid,QQnumber)
'set Https = Server.CreateObject("Microsoft.XMLHTTP")
set https = Server.CreateObject("MSXML2.XMLHTTP")
With https
.Open "Post", "http://q32.3g.qq.com/g/s?sid="&QQsid&"&aid=sendmsg&tfor=qq", False
.setRequestHeader "Content-Type","application/x-www-form-urlencoded"
.Send "msg="&msg&"&u="&QQnumber&"&saveURL=0&do=send&on=1&saveURL=0"
End With
set https = Nothing
End Function

Function addhaoyou(msg,QQsid,QQnumber)
'set Https = Server.CreateObject("Microsoft.XMLHTTP")
set https = Server.CreateObject("MSXML2.XMLHTTP")
With https
.Open "Post", "http://q16.3g.qq.com/g/s?sid="&QQsid&"&aid=addFriendVerify", False
.setRequestHeader "Content-Type","application/x-www-form-urlencoded"
.Send "verify="&msg&"&uin="&QQnumber&""
End With
set https = Nothing
End Function


 Function login(user,pass)
dim Https,urls,anum,star
set Https=server.createobject("MSXML2.XMLHTTP")
With https
anum=left(941143628+(rnd*999),9)
.open "post","http://f.10086.cn/huc/user/foo/login.do",False
.SetRequestHeader "Content-Type","application/x-www-form-urlencoded"
.setRequestHeader "User-Agent","Nokia5800/1.0 (05.08) Profile/MIDP-1.0 Configuration/CLDC-1.0"
.send "mobilenum="&user&"&password="&pass&"&m=submit&fr=foo&backurl=http://f.10086.cn"
If .readystate=4 then
dim objstream
set objstream= Server.CreateObject("adod"&"b.stream")
objstream.Type = 1
objstream.Mode =3
objstream.Open
objstream.Write Https.responseBody
objstream.Position = 0
objstream.Type = 2
objstream.Charset = "utf-8"
result = objstream.ReadText
'response.Write result
if Instr(result,"�˺Ż��������")<>0 then back="�˺Ż��������"
if Instr(result,"���벻��Ϊ�գ�")<>0 then back="���벻��Ϊ�գ�"
if Instr(result,"�û������������.")<>0 then back="�û������������."
if Instr(result,"�������.")<>0 then back="�������."
if Instr(result,"��������.")<>0 then back="��������."
if Instr(result,"�������ʵ���Դ������!")<>0 then back="��½�ɹ�!"
'response.Write back

'call GetBodya(fx)
objstream.Close
set objstream = nothing
END IF
End With
set https=nothing
end function


Function GetBodya(msg)
Set https = Server.CreateObject("MSXML2.XMLHTTP")
With https
.Open "Post", "http://f.10086.cn/im/user/sendMsgToMyselfs.action?tp=space", False
.setRequestHeader "Content-Type","application/x-www-form-urlencoded"
.Send "msg="&msg&""
If .readystate=4 then
dim objstream
set objstream= Server.CreateObject("adod"&"b.stream")
objstream.Type = 1
objstream.Mode =3
objstream.Open
objstream.Write Https.responseBody
objstream.Position = 0
objstream.Type = 2
objstream.Charset = "UTF-8"
result = objstream.ReadText
'response.Write "���ͳɹ�!"
'response.Write result
objstream.Close
set objstream = nothing
END IF
End With
Set https = Nothing
End Function

'call login(fxzh,fxmm)
'call login("","")




'call famail(mailserver,mailname,mailpass,faname,sname,"[��Ʒ����]����","��Ʒ����:"&"<br>"&"����:"&realname&","&"<br>"&"�绰:"&handtel&""&"<br>"&"����ʱ�䣺"&ps&""&"<br>"&"��ַ:"&text0&""&"<br>"&"��ַ:"&Home_address&"")
  
if strUserID<>"" and strUserName<>""  then
  response.Write("<script language=javascript>alert('�µ��ɹ�!');window.location.href='/myorder/?sid="&sid&"';</script>")
  else
  response.Write("<script language=javascript>alert('�µ��ɹ�!');window.location.href='index.asp';</script>")
  end if
 response.Write buylist
  response.Cookies("cart")=""
  


 end if
 

 
%>

