<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>管理系统_用户登录</title>
<style type="text/css">
<!--
body {
	margin: 0px;
	background-color: #016aa9;
	overflow:hidden;
}
.STYLE1 {
	color: #000000;
	font-size: 12px;
}
-->
</style>
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td><table background="images/index.jpg" width="899" height="508" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="235">&nbsp;</td>
        </tr>
        <tr>
          <td height="53"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="343" height="53">&nbsp;</td>
                <td width="245" ><table width="99%" border="0" cellspacing="0" cellpadding="0">
                <form action="lo.asp" method="post" name="login" >
                    <tr>
                      <td width="12%" height="25"><div align="right"></div></td>
                      <td height="25" colspan="2"><div align="center">
                          <input type="text" name="user_name" onBlur="value=value.replace(/[^0-9a-z]/gi,'')" style="width:125px; height:17px; background-color:#292929; border:solid 1px #7dbad7; font-size:12px; color:#6cd0ff">
                        </div></td>
                      <td width="26%" height="25">&nbsp;</td>
                    </tr>
                    <tr>
                      <td height="12"><div align="right"></div></td>
                      <td height="12" colspan="2"><div align="center">
                          <input type="password" name="password" style="width:125px; height:17px; background-color:#292929; border:solid 1px #7dbad7; font-size:12px; color:#6cd0ff">
                        </div></td>
                      <td height="12"><div align="left"><a href="main.html"></a></div></td>
                    </tr>
                    <tr>
                      <td height="13" align="right" class="STYLE1">&nbsp;</td>
                      <td width="30%" height="13" align="left"><input type="text" name="code" onBlur="value=value.replace(/[^0-9a-z]/gi,'')" style="width:55px; height:17px; background-color:#292929; border:solid 1px #7dbad7; font-size:12px; margin-left:13px; color:#6cd0ff"></td>
                      <td width="32%" align="left"><img src="code.asp" width="38" height="17" style="display:block;border:0;width:65px;height:17px;background-color:#000000;color:#fff; onclick="this.src='code.asp?key='+Math.random()"/></td>
                      <td height="13"><input name="Submit" type="image" src="images/dl.gif"></td>
                    </tr>
                    </form>
                  </table></td>
                <td width="311">&nbsp;</td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td height="213">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
