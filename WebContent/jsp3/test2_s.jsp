<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String msg = (String)request.getAttribute("msg"); 
	//request는 java에서 관리함. 받을때 getAttribute메소드를 사용해야하며
	//가장 큰 객체인 object 로 전달하므로 downcast 작업을 해줘야 한다
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>리다이렉트 또는 포워딩한 페이지</h2>
name : <%=name %> | msg : <%=msg %>
</body>
</html>