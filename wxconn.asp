
<%

On Error Resume Next '程序遇到错误还会向下执行
db = "data/!@#$%cherry.mdb"
connstr = "DBQ=" + server.mappath(""&db&"") + ";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"
Set conn = server.CreateObject("ADODB.CONNECTION")
conn.Open connstr
If Err<>0 Then
    Err.Clear
    Set conn = Nothing
    Response.Write("不能连接到数据库！")
    Response.End()
End If
function HTMLEncode(fString)
   if not isnull(fstring) then
    fString = replace(fString, ">", ">")
    fString = replace(fString, "<", "<")
    fString = Replace(fString, CHR(32), " ")
    fString = Replace(fString, CHR(13), "")
    fString = Replace(fString, CHR(10) & CHR(10), "</P><P>")
    fString = Replace(fString, CHR(10), "<BR>")
    fString = Replace(fString,"'","''")
	fString = Replace(fString,"&nbsp;","")
    HTMLEncode = fString
 end if
end function
%>

<%
Dim GetFlag Rem(提交方式)
Dim ErrorSql Rem(非法字符)
Dim RequestKey Rem(提交数据)
Dim ForI Rem(循环标记)
ErrorSql = "'~;~and~(~)~exec~update~count~*~%~<~>~chr~mid~master~truncate~char~declare" Rem(每个敏感字符或者词语请使用半角 "~" 格开)
ErrorSql = Split(ErrorSql, "~")
If Request.ServerVariables("REQUEST_METHOD") = "GET" Then
    GetFlag = True
Else
    GetFlag = False
End If
If GetFlag Then
    For Each RequestKey In Request.QueryString
        For ForI = 0 To UBound(ErrorSql)
            If InStr(LCase(Request.QueryString(RequestKey)), ErrorSql(ForI))<>0 Then
                response.Write "<script language=javascript>alert('非法操作！');window.history.back();</script>"
                response.End
            End If
        Next
    Next
Else
    For Each RequestKey In Request.Form
        For ForI = 0 To UBound(ErrorSql)
            If InStr(LCase(Request.Form(RequestKey)), ErrorSql(ForI))<>0 Then
                response.Write "<script language=javascript>alert('非法操作！');window.history.back();</script>"
                response.End
            End If
        Next
    Next
End If
Sql_in = "and |or |on |in |select |insert |update |delete |exec |declare |'"
Sql = Split(Sql_in, "|")
If Request.QueryString<>"" Then
    For Each Sql_Get In Request.QueryString
        For Sql_Data = 0 To UBound(Sql)
            If InStr(LCase(Request.QueryString(Sql_Get)), Sql(Sql_Data))<>0 Then
                response.Write "<script language=javascript>alert('非法操作！');window.history.back();</script>"
                response.End
            End If
        Next
    Next
End If
If Request.Form<>"" Then
    For Each Sql_Post In Request.Form
        For Sql_Data = 0 To UBound(Sql)
            If InStr(LCase(Request.Form(Sql_Post)), Sql(Sql_Data))<>0 Then
                Call infoback("非法操作！")
            End If
        Next
    Next
End If

%>
<%
'得到安全字符
Function GetSafeStr(str)
	GetSafeStr = Replace(Replace(Replace(Trim(str), "'", ""), Chr(34), ""), ";", "")
End Function

Function GrateRs(SqlStr,wr)
	'On Error Resume Next
	Set GrateRs=Server.CreateObject("ADODB.Recordset")
	GrateRs.Open SqlStr,conn,1,wr
	If Err Then
		Response.Write "rs->"&err.description&"->"&SqlStr
		err.Clear
		Response.End
	End If
End Function

'得到IP地址
Function GetIP()
    UserTrueIP=Request.ServerVariables("HTTP_X_FORWARDED_FOR")
    If UserTrueIP="" Then UserTrueIP=Request.ServerVariables("REMOTE_ADDR")
    GetIP=UserTrueIP
End Function

sid=GetSafeStr(Request("sid"))

if len(sid)=32 Then
  Set Rs=Conn.Execute("select UserID,cxmoney,vipkh,UserName,useradder,showre,usertel,jifen from [user] where homepage='"&sid&"'")
  If Rs.eof And Rs.bof Then
  sid="null"
  else
    strUserID=Rs("UserID")
	strUserName=Rs("UserName")
	strShowre=Rs("showre")
	strtel=rs("usertel")
    strjf=rs("jifen")
	strdz=rs("useradder")
	strvip=rs("vipkh")
	strmoney=rs("cxmoney")
  End if
  Rs.Close
  Set Rs=Nothing
else
sid="null"
end if



Set site = server.CreateObject("adodb.recordset")
exec = "select * from site"
site.Open exec, conn, 1, 1
fxzh=site("site_mobile")
fxmm=site("site_fax")
site_copyright=site("site_copyright")
emname=site("site_qq")
fjname=site("site_msn")
fjpass=site("site_email")
sjname=site("site_icp")
site_address=site("site_address")
faname=fjname
if site_copyright=1 then
if instr(LCase(Request.ServerVariables("Http_User_Agent")),"micromessenger") = 0 then
	Response.Clear
	Response.Write "非微信浏览器禁止浏览"
	Response.end
end if
end if

Function GetFileName()  '创建订单号
Dim fNumber
GetFileName=Year(Now())
If Len(Month(Now()))=2 Then
GetFileName=GetFileName&Month(Now())
Else
GetFileName=GetFileName&"0"&Month(Now())&""
End if
If Len(Day(Now()))=2 Then
GetFileName=GetFileName&Day(Now())
Else
GetFileName=GetFileName&"0"&Day(Now())&""
End if
If Len(Hour(Now()))=2 Then
GetFileName=GetFileName&Hour(Now())
Else
GetFileName=GetFileName&"0"&Hour(Now())&""
End if
If Len(Minute(Now()))=2 Then
GetFileName=GetFileName&Minute(Now())
Else
GetFileName=GetFileName&"0"&Minute(Now())&""
End if
If Len(Second(Now()))=2 Then
GetFileName=GetFileName&Second(Now())
Else
GetFileName=GetFileName&"0"&Second(Now())&""
End if
Randomize
fNumber=Int((99-11+1)*Rnd)+11
GetFileName=GetFileName&fNumber
End Function


function isInteger(para) '判断数字是否整形
       on error resume next
       dim str
       dim l,i
       if isNUll(para) then 
          isInteger=false
          exit function
       end if
       str=cstr(para)
       if trim(str)="" then
          isInteger=false
          exit function
       end if
       l=len(str)
       for i=1 to l
           if mid(str,i,1)>"9" or mid(str,i,1)<"0" then
              isInteger=false 
              exit function
           end if
       next
       isInteger=true
       if err.number<>0 then err.clear
end function
%>
