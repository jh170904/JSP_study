<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page buffer="8kb" autoFlush="true"%> <!-- 웹사이즈도 한번에 표현할 수 있는 용량이 존재. 작성안하면 디폴트값은 8kb, true -->
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
<%for(int i=1; i<=1000; i++){ %>
1234		
<%
}
%>
</body>
</html>