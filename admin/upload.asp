<!--#include file="upload_class.asp"-->
<!--#include file="seeion.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ļ��ϴ�</title>
<style>
body {
	margin:0;
	font-family:"����";
	font-size:12px;
	background:#bdecfe;
}
input, select, textarea {
	font-size:12px;
	padding:2px 0;
}
</style>
<script type="text/javascript">
function Check(o){
	if(o.file1.value==''){
		alert('��ѡ��ͼƬ��');
		o.file1.focus();
		return false;
	}
	return true;
}
</script>
</head>
<body>
<%
If request.QueryString("act") = "upload" Then
    Dim Upload, Path, tempCls, fName
    '===============================================================================
    Set Upload = New AnUpLoad '������ʵ��
    Upload.SingleSize = 1024 * 1024 * 1024 '���õ����ļ�����ϴ�����,���ֽڼƣ�Ĭ��Ϊ������
    Upload.MaxSize = 1024 * 1024 * 1024 '��������ϴ�����,���ֽڼƣ�Ĭ��Ϊ������
    Upload.Exe = "jpg|jpeg|gif|png|zip|bmp|rar|7z|pdf|doc|flv" '���úϷ���չ��,��|�ָ�,���Դ�Сд
    Upload.Charset = "gb2312" '�����ı����룬Ĭ��Ϊgb2312
    Upload.openProcesser = false '��ֹ���������ܣ�������ã�����Ͽͻ��˳���
    Upload.GetData() '��ȡ����������,������ñ�����
    '===============================================================================
    If Upload.ErrorID>0 Then '�жϴ����,���myupload.Err<=0��ʾ����
        response.Write Upload.Description '������ִ���,��ȡ��������
    Else
        If Upload.Files( -1).Count>0 Then '�����ж����Ƿ�ѡ�����ļ�
            Path = server.mappath("../uploadfile") '�ļ�����·��(������files�ļ���)
            '�����ļ�(�����ļ�������)
            Set tempCls = Upload.Files("file1")
            tempCls.SaveToFile Path, 0
            fName = tempCls.FileName
            Set tempCls = Nothing
        Else
            response.Write "��ѡ��Ҫ�ϴ���ͼƬ��<a href=site.asp>�������</a>"
			response.End()
        End If
    End If
    Set Upload = Nothing '������ʵ��

%>
<script type ="text/javascript">
	window.parent.document.cherry.uploadfile.value='uploadfile/<%=fName%>';
 </script>
<%
Else

%>
<form name="upload" method="post" action="upload.asp?act=upload" enctype="multipart/form-data" onSubmit="return Check(this)">
	<input type ="file" name ="file1" />
	<input type ="submit" value=" �� �� " style="vertical-align:top; line-height:10px;" />
</form>
<%
End If
%>
</body>
</html>
