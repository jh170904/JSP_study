<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();	
	//쿠키 받아오기(배열로 받음)
	Cookie[] c = request.getCookies();
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//쿠키가 있을때만 실행
	if(c!=null){
		
		for(Cookie cc : c){
			
			//내장객체 이용하여 출력
			out.print("쿠키이름: ");
			out.print(cc.getName());
			out.print(", 쿠키값: ");
			
			String str = cc.getValue();
			
			if(cc.getName().equals("addr")){
				str = URLDecoder.decode(str,"UTF-8");
			}
			out.print(str+"<br/>");
		}
	}
%>
</body>
</html>