<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="test5_ok.jsp" method="post">

이름: <input type="text" name="name"><br/>
메모: <textarea rows="5" cols="30" name="memo"></textarea><br/>
성별: <input type="radio" name="gender" value="남자" checked="checked">남자
 <input type="radio" name="gender" value="여자" checked="checked">여자<br/>
취미: <br/>
<input type="checkbox" name="hobby" value="여행">여행<br/>
<input type="checkbox" name="hobby" value="음악감상">음악감상<br/>
<input type="checkbox" name="hobby" value="영화감상">영화감상<br/>
<input type="checkbox" name="hobby" value="게임">게임<br/>
<input type="checkbox" name="hobby" value="책">책<br/>
<input type="checkbox" name="hobby" value="운동">운동<br/>

전공:<br/>
<select name="major" size="4" multiple="multiple">
	<option value="수학과">수학과</option>
	<option value="영어과">영어과</option>
	<option value="물리학과">물리학과</option>
	<option value="컴퓨터공학과">컴퓨터공학과</option>
</select>

<input type="submit" value="전송"/><br/>

<br/><br/><br/>

</form>

</body>
</html>