<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>form 사용</title>

<script type="text/javascript">

	function idpwcheck(){
		
		var f = document.myForm;
		
		//alert("로그인 시도");
		if(f.id.value==""){
			alert("아이디를 입력하세요!");
			f.id.focus();
			return;
		}
		if(f.pwd.value==""){
			alert("패스워드를 입력하세요!");
			f.pwd.focus();
			return;
		}
		
		document.write("로그인 성공!!");		
	}
	
	function fopen(){
		
		window.open("addr.jsp", "newwindow","width=400,height=200,status=yes");
		
	}
	
	function flogin(){
		
		window.open("lotte_login.jsp", "lotte","width=300,height=300,status=yes,top=300,left=600");
		
	}
	

</script>

</head>
<body>


<form action="" name="myForm">
<table>
<tr>
	<td colspan="3" height="1" bgcolor="gray"></td>
</tr>
<tr>
	<td>아이디</td>
	<td><input type="text" name="id" style="width: 100px; height: 22px;" >	
	</td>
	<td></td>
</tr>
<tr>
	<td>비밀번호</td>
	<td><input type="password" name="pwd" style="width: 100px; height: 22px;">
	</td>
	<td><a href="javascript:idpwcheck();" ><img src="./image/btn_login.gif"></a></td>
</tr>
<tr>
	<td><input type="checkbox">아이디 저장</td>
	<td><input type="checkbox">보안 접속</td>
</tr>
</table>
<hr/>

<h3>새로운 창 열기</h3>
거주지역 <a href="javascript:fopen();"><img alt="" src="./image/bt_internal.gif" style="height: 25px;"></a>
<br/>
<br/>
<a href="javascript:flogin();">Lotte Family 로그인</a>

</form>

<hr/>
</body>
</html>