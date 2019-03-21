<%@page import="com.join.CustomInfo"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	//CustomInfo info = (CustomInfo)session.getAttribute("customInfo");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인덱스</title>
</head>
<body>
<c:choose>
	<c:when test="${empty sessionScope.customInfo.userId }">
	<b>로그인하면 새로운 세상이 보입니다...</b><br/><br/>
	</c:when>
	<c:otherwise>
		<b>${sessionScope.customInfo.userName }님</b> 반가워요!<br/><br/>
	</c:otherwise>
</c:choose>

<c:choose>
	<c:when test="${empty sessionScope.customInfo.userId }">
	1. 성적처리(JSP)<br/>
	2. 게시판(JSP)<br/>
	3. 방명록(JSP)<br/>
	4. 게시판(Servlet)<br/>
	</c:when>
	<c:otherwise>
	<!--jsp파일의 위치가 서로다를 때 contextpath를 이용하면 됨  -->
	1.<a href="<%=cp %>/score/list.jsp">성적처리(JSP)</a><br/>
	2.<a href="<%=cp %>/board/list.jsp">게시판(JSP)</a><br/>
	3.<a href="<%=cp %>/guest/guest.jsp">방명록(JSP)</a><br/>
	4.<a href="<%=cp %>/bbs/list.do">게시판(Servlet)</a><br/>	
	</c:otherwise>
</c:choose>
	5.<a href="<%=cp %>/sung/list.do">성적처리(Servlet)</a><br/>	

<br/><br/>

<c:choose>
	<c:when test="${empty sessionScope.customInfo.userId }">
		<a href="<%=cp%>/join/created.do">회원가입</a><br/>
		<a href="<%=cp%>/join/login.do">로그인</a><br/>
	</c:when>
	<c:otherwise>
		<a href="<%=cp %>/join/updated.do">정보수정</a><br/>
		<a href="<%=cp %>/join/logout.do">로그아웃</a><br/>
	</c:otherwise>
</c:choose>

</body>
</html>