<%@page import="com.svt.DataVO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<tr>
	<td width="100">이름</td>
	<td width="100">나이</td>
</tr>
<c:forEach var="vo" items="${lists }">
<tr>
	<td>${vo.name }</td>
	<td>${vo.age }</td>
</tr>
</c:forEach>
</table>
</body>
</html>