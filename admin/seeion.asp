<%if session("user_name")<>"" then%>
<%
Else
    response.Write "<script>alert('·Ç·¨²Ù×÷£¡');window.location.href='login.asp';</script>"
End If
%>
