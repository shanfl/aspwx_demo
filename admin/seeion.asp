<%if session("user_name")<>"" then%>
<%
Else
    response.Write "<script>alert('�Ƿ�������');window.location.href='login.asp';</script>"
End If
%>
