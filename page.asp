<%
'��ʾ������Ϣ

Sub strA(str1)
    Response.Write("<script language=""JavaScript"">alert("""&str1&""");history.go(-1);</script>")
    response.End()
End Sub

'�ɹ���ʾ��Ϣ

Sub strB(str2, url)
    Response.Write("<script language=""JavaScript"">alert("""&str2&""");window.location='"&url&"';</script>")
    response.End()
End Sub

'ҳ���Զ���ת

Sub AutoJump(str1, url)
    Response.Write("<br/>&nbsp;&nbsp;<font color=red>"&str1&"</font><br/>")
    Response.Write("<br/>&nbsp;&nbsp;������ת...<br/>")
    Response.Write("<br/>&nbsp;&nbsp;ҳ��û���Զ���ת<a href="&url&">�������</a><br/>")
    Response.Write("<meta http-equiv=refresh content=2;url='"&url&"'>")
End Sub


'��ҳ�ӳ���

Sub PageControl(iCount, pagecount, page, table_style, font_style)
    '������һҳ��һҳ����
    Dim query, a, x, temp, action
    action = "http://" & Request.ServerVariables("HTTP_HOST") & Request.ServerVariables("SCRIPT_NAME")
    query = Split(Request.ServerVariables("QUERY_STRING"), "&")
    For Each x In query
        a = Split(x, "=")
        If StrComp(a(0), "page", vbTextCompare) <> 0 Then
            temp = temp & a(0) & "=" & a(1) & "&"
        End If
    Next
    Response.Write("<table width=100% align=center border=0 cellpadding=0 cellspacing=0 >" & vbCrLf )
    Response.Write("<form method=get onsubmit=""document.location = '" & action & "?" & temp & "Page='+ this.page.value;return false;""><TR >" & vbCrLf )
    Response.Write("<TD align=left  class=hui>" & vbCrLf )
    Response.Write(font_style & vbCrLf )
    'response.Write "<A href=javascript:history.back()>������ǰҳ��</a>&nbsp;&nbsp;&nbsp;"
    If page<= 1 Then
        Response.Write ("��ҳ " & vbCrLf)
        Response.Write ("��һҳ " & vbCrLf)
    Else
        Response.Write("<A HREF=" & action & "?" & temp & "Page=1>��ҳ</A> " & vbCrLf)
        Response.Write("<A HREF=" & action & "?" & temp & "Page=" & (Page -1) & ">��һҳ</A> " & vbCrLf)
    End If
    If page>= pagecount Then
        Response.Write ("��һҳ " & vbCrLf)
        Response.Write ("βҳ " & vbCrLf)
    Else
        Response.Write("<A HREF=" & action & "?" & temp & "Page=" & (Page + 1) & ">��һҳ</A> " & vbCrLf)
        Response.Write("<A HREF=" & action & "?" & temp & "Page=" & pagecount & ">βҳ</A> " & vbCrLf)
    End If
    Response.Write("ҳ�Σ�" & page & "/" & pageCount & "ҳ"& vbCrLf)
    Response.Write(" ��" & iCount & "����¼" & vbCrLf)
    Response.Write(" ת" & "<INPUT CLASS=wenbenkuang TYEP=TEXT NAME=page SIZE=1 Maxlength=5 VALUE=" & page & ">" & "ҳ" & vbCrLf & "<INPUT CLASS=go-wenbenkuang type=submit value=ת��>")
    Response.Write("</TD>" & vbCrLf )
    Response.Write("</TR></form>" & vbCrLf )
    Response.Write("</table>" & vbCrLf )
End Sub


Sub Left1(str1, url)
    Response.Write("<br/>&nbsp;&nbsp;<font color=red>"&str1&"</font><br/>")
    Response.Write("<br/>&nbsp;&nbsp;������ת...<br/>")
    Response.Write("<br/>&nbsp;&nbsp;ҳ��û���Զ���ת<a href="&url&">�������</a><br/>")
    Response.Write("<meta http-equiv=refresh content=2;url='"&url&"'>")
End Sub
%>
