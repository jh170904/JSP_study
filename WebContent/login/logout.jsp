<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	session.removeAttribute("userId"); //아이디만 삭제. 들어있는 suzi라는 정보
	session.invalidate();			   //변수도 삭제
	response.sendRedirect("login.jsp");//다시 로그인화면으로 돌아가도록 redirect. 
%>
