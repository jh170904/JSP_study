<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

	function fLocation_opener(){
		window.opener.location.href="lotte_member.jsp"//opener 자기자신의 창을 닫아주고 페이지를 변환시켜줌
		window.close();
	}
	
</script>


</head>

<h2>Lotte Family 로그인</h2>
<br/>
<br/>
회원ID <input type="text"><br/>
비밀번호 <input type="password"><br/>
<br/>
<input type="button" value="로그인"><br/>
<br/>
<br/>
<a href="javascript:fLocation_opener();">회원가입</a><br/>
<br/>
<br/>
<a href="javascript:window.close();">종료</a>
</body>
</html>