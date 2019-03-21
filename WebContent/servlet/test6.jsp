<%@page import="java.util.ArrayList"%>
<%@page import="com.svt.DataVO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	List<DataVO> lists = new ArrayList<DataVO>();
	DataVO vo = new DataVO("배수지",25);
	lists.add(vo);
	
	vo = new DataVO("안상희",30);
	lists.add(vo);
	
	vo = new DataVO("이슬기",32);
	lists.add(vo);
	
	vo = new DataVO("천송이",40);
	lists.add(vo);

	request.setAttribute("lists", lists);
%>
<jsp:forward page="result.jsp"/>
