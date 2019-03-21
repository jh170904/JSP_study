<%@page import="com.score.ScoreDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dto" class="com.score.ScoreDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<% 
	Connection conn = DBConn.getConnection();

	ScoreDAO dao = new ScoreDAO(conn);
	int result = dao.insertData(dto);//반환값 1 이면 잘 등록됨
	if(result!=0){
		response.sendRedirect("list.jsp");//DB에 데이터 입력이 정상적으로 이뤄질경우 리스트.jsp로 이동
	}
%>
<!-- 오류가 발생할 경우에 redirect가 실행되지 않아 입력오류가 웹페이지에 조회됨 -->
입력오류!!