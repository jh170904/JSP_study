<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>스타일시트</title>

<style type="text/css">

input.box {
	border: 1px solid #c8c8c8;
	width: 97px;
	height: 19px;
}
table {
	font-size: 10pt;
	font-family: 돋움;
	
}
</style>
</head>

<body>

<table>
<tr>
	<td><input type="text" class="box" 
	style="background: url('./image/bg_log_id.gif') no-repeat 5px 3px #ffffff" 
	onfocus="this.style.backgroundImage='';"> <!--백그라운드 이미지를 null로 만들어라  -->
	
	</td>
	<td></td>
</tr>
<tr>
	<td><input type="password" class="box" 
	style="background: url('./image/bg_log_pw.gif') no-repeat 5px 3px #ffffff" 
	onfocus="this.style.backgroundImage='';"> <!--백그라운드 이미지를 null로 만들어라  -->
	
	</td>
	<td><img src="./image/btn_login.gif"></td>
</tr>
<tr>
	<td><input type="checkbox">아이디 저장</td>
	<td><input type="checkbox">보안 접속</td>
</tr>
</table>

</body>
</html>