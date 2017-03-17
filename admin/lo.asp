<!--#include file="conn.asp"-->
<!--#include file="md5.asp"-->
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
Dim rs, user_name, password, code
user_name = request.Form("user_name")
password = md5(Request("password"))
code = request.Form("code")
If user_name = "" Then
    response.Write("<script language=javascript>alert('用户名不能为空!');history.back(1)</script>")
    response.End
End If

If password = "" Then
    response.Write("<script language=javascript>alert('密码不能为空!');history.back(1)</script>")
    response.End
End If

If code = "" Then
    response.Write("<script language=javascript>alert('验证码不能为空!');history.back(1)</script>")
    response.End
End If

If CStr(Session("GetCode"))<>CStr(Request.Form("code")) Then
    response.Write("<script language=javascript>alert('验证码错误!');history.back(1)</script>")
    response.End
End If

Set rs = Conn.Execute("Select user_name,Password from admin where user_name='"&user_name&"' And Password='"&password&"'")
If rs.EOF And rs.bof Then
    response.Write "<script language=javascript>"
    response.Write "alert('帐号或者密码错误，请重新输入!');"
    response.Write "javascript:history.back(1);"
    response.Write "</script>"
Else

    session("user_name") = user_name
    response.redirect "site.asp"
End If

%>
