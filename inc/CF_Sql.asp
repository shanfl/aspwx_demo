<%
'----------------------------------------------------------------------
'*******************    防SQL注入   ********************************

Dim CFSql_i,CFSql_Sqlchr,CFSql_ChrContent
CFSql_Sqlchr = "select*|and'|or'|insertinto|delete|altertable|update|createtable|createview|dropview|createindex|dropindex|createprocedure|dropprocedure|createtrigger|droptrigger|createschema|dropschema|createdomain|alterdomain|dropdomain|);|select@|declare@|print@|char(|select|execute"
CFSql_Sqlchrs = split(CFSql_Sqlchr,"|")


'======================================================
'Post方式处理
'======================================================
If Request.Form<>"" Then
   For Each CFSql_ChrContent In Request.Form
     For CFSql_i=0 to Ubound(CFSql_Sqlchrs)
	   Select Case CFSql_Sqlchrs(CFSql_i)
	   Case "select"'为避免select的多表关联查询
	      If Instr(LCase(replace(Request.Form(CFSql_ChrContent)," ","")),"select")>0 and Instr(LCase(replace(Request.Form(CFSql_ChrContent)," ","")),"from")>0 Then
		    Call CFSql_PromptTitle()
		  End IF	   
	   Case "update"'update作额外处理,因update..set..
	      If Instr(LCase(replace(Request.Form(CFSql_ChrContent)," ","")),"update")>0 and Instr(LCase(replace(Request.Form(CFSql_ChrContent)," ","")),"set")>0 Then
		    Call CFSql_PromptTitle()
		  End IF		  
	   Case Else
	      If Instr(LCase(replace(Request.Form(CFSql_ChrContent)," ","")),CFSql_Sqlchrs(CFSql_i))>0 Then
		    Call CFSql_PromptTitle()
		  End IF
	   End Select
     Next
   Next	   
End IF



'======================================================
'Get方式处理
'======================================================
If Request.QueryString<>"" Then
   For Each CFSql_ChrContent In Request.QueryString
     For CFSql_i=0 to Ubound(CFSql_Sqlchrs)
	   Select Case CFSql_Sqlchrs(CFSql_i)
	   Case "select"'为避免select的多表关联查询
	      If Instr(LCase(replace(Request.QueryString(CFSql_ChrContent)," ","")),"select")>0 and Instr(LCase(replace(Request.QueryString(CFSql_ChrContent)," ","")),"from")>0 Then
		    Call CFSql_PromptTitle()
		  End IF	   
	   Case "update"'update作额外处理,因update..set..
	      If Instr(LCase(replace(Request.QueryString(CFSql_ChrContent)," ","")),"update")>0 and Instr(LCase(replace(Request.QueryString(CFSql_ChrContent)," ","")),"set")>0 Then
		    Call CFSql_PromptTitle()
		  End IF		  
	   Case Else
	      If Instr(LCase(replace(Request.QueryString(CFSql_ChrContent)," ","")),CFSql_Sqlchrs(CFSql_i))>0 Then
		    Call CFSql_PromptTitle()
		  End IF
	   End Select
     Next
   Next	   
End IF


Sub CFSql_PromptTitle()
Response.Write "<Script Language=JavaScript>alert('您提交了不允许的字符,请检查后重新提交!');</Script>"
response.Write "<script LANGUAGE='javascript'>history.go(-1);</script>"
response.End()'提示就结束输出
End Sub
%>