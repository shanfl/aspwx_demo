<%
'----------------------------------------------------------------------
'*******************    ��SQLע��   ********************************

Dim CFSql_i,CFSql_Sqlchr,CFSql_ChrContent
CFSql_Sqlchr = "select*|and'|or'|insertinto|delete|altertable|update|createtable|createview|dropview|createindex|dropindex|createprocedure|dropprocedure|createtrigger|droptrigger|createschema|dropschema|createdomain|alterdomain|dropdomain|);|select@|declare@|print@|char(|select|execute"
CFSql_Sqlchrs = split(CFSql_Sqlchr,"|")


'======================================================
'Post��ʽ����
'======================================================
If Request.Form<>"" Then
   For Each CFSql_ChrContent In Request.Form
     For CFSql_i=0 to Ubound(CFSql_Sqlchrs)
	   Select Case CFSql_Sqlchrs(CFSql_i)
	   Case "select"'Ϊ����select�Ķ�������ѯ
	      If Instr(LCase(replace(Request.Form(CFSql_ChrContent)," ","")),"select")>0 and Instr(LCase(replace(Request.Form(CFSql_ChrContent)," ","")),"from")>0 Then
		    Call CFSql_PromptTitle()
		  End IF	   
	   Case "update"'update�����⴦��,��update..set..
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
'Get��ʽ����
'======================================================
If Request.QueryString<>"" Then
   For Each CFSql_ChrContent In Request.QueryString
     For CFSql_i=0 to Ubound(CFSql_Sqlchrs)
	   Select Case CFSql_Sqlchrs(CFSql_i)
	   Case "select"'Ϊ����select�Ķ�������ѯ
	      If Instr(LCase(replace(Request.QueryString(CFSql_ChrContent)," ","")),"select")>0 and Instr(LCase(replace(Request.QueryString(CFSql_ChrContent)," ","")),"from")>0 Then
		    Call CFSql_PromptTitle()
		  End IF	   
	   Case "update"'update�����⴦��,��update..set..
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
Response.Write "<Script Language=JavaScript>alert('���ύ�˲�������ַ�,����������ύ!');</Script>"
response.Write "<script LANGUAGE='javascript'>history.go(-1);</script>"
response.End()'��ʾ�ͽ������
End Sub
%>