<%
Sub PageControl(iCount,pagecount,page,table_style,font_style) 
'������һҳ��һҳ���� 
Dim query, a, x, temp 
action = "http://" & Request.ServerVariables("HTTP_HOST") & Request.ServerVariables("SCRIPT_NAME") 

query = Split(Request.ServerVariables("QUERY_STRING"), "&") 
For Each x In query 
a = Split(x, "=") 
If StrComp(a(0), "page", vbTextCompare) <> 0 Then 
temp = temp & a(0) & "=" & a(1) & "&" 
End If 
Next 

Response.Write("<div " & Table_style & ">" & vbCrLf ) 
Response.Write("<form method=get onsubmit=""document.location = '" & action & "?" & temp & "Page='+ this.page.value;return false;"">" & vbCrLf ) 
Response.Write("" & vbCrLf ) 
Response.Write(font_style & vbCrLf ) 

if page<=1 then 
Response.Write ("��ҳ " & vbCrLf) 
Response.Write ("��ҳ " & vbCrLf) 
else 
Response.Write("<a href=" & action & "?" & temp & "Page=1>��ҳ</a> " & vbCrLf) 
Response.Write("<a href=" & action & "?" & temp & "Page=" & (Page-1) & ">��ҳ</a> " & vbCrLf) 
end if 

if page>=pagecount then 
Response.Write ("��ҳ " & vbCrLf) 
Response.Write ("βҳ " & vbCrLf) 
else 
Response.Write("<a href=" & action & "?" & temp & "Page=" & (Page+1) & ">��ҳ</a> " & vbCrLf) 
Response.Write("<a href=" & action & "?" & temp & "Page=" & pagecount & ">βҳ</a> " & vbCrLf) 
end if 

Response.Write(" ҳ�Σ�" & page & "/" & pageCount & "ҳ" & vbCrLf) 
Response.Write(" ����" & iCount & "����¼" & vbCrLf) 
Response.Write(" ת��" & "<input type='text' name=page size=1 Maxlength=5 value=" & page & " class='InputText' />" & "ҳ" & vbCrLf & "<input type='submit' value='GO' class='InputButton' />") 
Response.Write("" & vbCrLf ) 
Response.Write("</form>" & vbCrLf ) 
Response.Write("</div>" & vbCrLf ) 
End Sub
%>
