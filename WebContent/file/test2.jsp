<%@page import="java.io.DataInputStream"%>
<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	//String name = request.getParameter("name"); 파일은 getParameter로 전달할 수 없다.
	//String upload = request.getParameter("upload");
	
	String contentType = request.getContentType();//넘어오는 파일의 데이터타입을 확인하기 위함
	//열거형 원소를 다루기 위한 인터페이스
	Enumeration e = request.getHeaderNames();//넘어오는 파일은 두개의 파트로 나뉘어짐(Header-파일의정보, data-파일의내용)
	
	out.print("전송받은 헤더정보...<br/>");
	while(e.hasMoreElements()){
		String key = (String)e.nextElement();
		String value = request.getHeader(key);
		out.print(key+":"+value+"<br/>");
	}
	out.print("전송받은 데이터정보...<br/>");
	DataInputStream is = new DataInputStream(request.getInputStream());
	String str;
	while((str=is.readLine())!=null){
		out.print(new String(str.getBytes("ISO-8859-1"),"euc-kr")+"<br/>");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>등록된 파일정보 조회(header,data)</title>
</head>
<body>
<%-- 이름: <%=name %><br/> --%>
<%-- 파일: <%=upload %><br/> --%>
</body>
</html>

