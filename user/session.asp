<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 
<%

If strUserID="" or strUserName=""  Then
 response.Write "<script language='javascript'>alert('会员不存在！');window.location.href='/user/login.asp';</script>"
  Response.End
End if

%>