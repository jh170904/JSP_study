<%@page import="com.naver.NaverDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<jsp:useBean id="dto" class="com.naver.NaverDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
	String id = request.getParameter("id");
	Connection conn = DBConn.getConnection();
	NaverDAO dao = new NaverDAO(conn);
	
	if(dao.getReadData(id)!=null){
		out.print("중복 아이디가 존재합니다.");
	}
	DBConn.close();
	
	response.sendRedirect("naver.jsp");
%>
