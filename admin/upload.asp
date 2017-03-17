<!--#include file="upload_class.asp"-->
<!--#include file="seeion.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>文件上传</title>
<style>
body {
	margin:0;
	font-family:"宋体";
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
		alert('请选择图片！');
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
    Set Upload = New AnUpLoad '创建类实例
    Upload.SingleSize = 1024 * 1024 * 1024 '设置单个文件最大上传限制,按字节计；默认为不限制
    Upload.MaxSize = 1024 * 1024 * 1024 '设置最大上传限制,按字节计；默认为不限制
    Upload.Exe = "jpg|jpeg|gif|png|zip|bmp|rar|7z|pdf|doc|flv" '设置合法扩展名,以|分割,忽略大小写
    Upload.Charset = "gb2312" '设置文本编码，默认为gb2312
    Upload.openProcesser = false '禁止进度条功能，如果启用，需配合客户端程序
    Upload.GetData() '获取并保存数据,必须调用本方法
    '===============================================================================
    If Upload.ErrorID>0 Then '判断错误号,如果myupload.Err<=0表示正常
        response.Write Upload.Description '如果出现错误,获取错误描述
    Else
        If Upload.Files( -1).Count>0 Then '这里判断你是否选择了文件
            Path = server.mappath("../uploadfile") '文件保存路径(这里是files文件夹)
            '保存文件(以新文件名保存)
            Set tempCls = Upload.Files("file1")
            tempCls.SaveToFile Path, 0
            fName = tempCls.FileName
            Set tempCls = Nothing
        Else
            response.Write "请选择要上传的图片！<a href=site.asp>点击返回</a>"
			response.End()
        End If
    End If
    Set Upload = Nothing '销毁类实例

%>
<script type ="text/javascript">
	window.parent.document.cherry.uploadfile.value='uploadfile/<%=fName%>';
 </script>
<%
Else

%>
<form name="upload" method="post" action="upload.asp?act=upload" enctype="multipart/form-data" onSubmit="return Check(this)">
	<input type ="file" name ="file1" />
	<input type ="submit" value=" 上 传 " style="vertical-align:top; line-height:10px;" />
</form>
<%
End If
%>
</body>
</html>
