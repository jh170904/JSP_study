<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>구구단 입력</title>
</head>
<body>

<form action="gugudan_ok.jsp" method="post">
단: <input type="text" name="dan"></br>
<input type="submit" name="제출">
</form>

</body>
</html>