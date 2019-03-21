<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	//쿠키 생성
	Cookie c1 = new Cookie("name","shin");
	Cookie c2 = new Cookie("age","30");
	Cookie c3 = new Cookie("addr","Pusan");
	Cookie c4 = new Cookie("tel","010-1234-1234");
	
	//쿠키도 유효기간이 존재한다(설정 가능)
	c1.setMaxAge(0); //바로 지워짐
	c2.setMaxAge(-1);//끝까지 유지
	c3.setMaxAge(10);//10초후 삭제
	
	//c2.setPath("/");//프로젝트내 어느 페이지에서든 접근 가능
	//c4.setPath("/board");//board에서만 접근 가능
	
	//쿠키 전달
	response.addCookie(c1);
	response.addCookie(c2);
	response.addCookie(c3);
	response.addCookie(c4);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="c4.jsp">확인</a>
</body>
</html>