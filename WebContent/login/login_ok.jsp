<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	
	//원래는 DataBase와 연동하여 아이디와 비밀번호 검증 작업 필요.
	if(userId.equals("suzi")&&userPwd.equals("123")){	
		session.setAttribute("userId", userId);//세션에 해당 데이터를 올려라
		
		response.sendRedirect("login.jsp"); //login페이지로 돌아가라. 서버가 클라이언트에게 시키는 것. 
		
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
아이디 또는 패스워드 오류
<a href="login.jsp">돌아가기</a>
</body>
</html>