<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
  	String str = (String)request.getAttribute("result"); 
%>
<%=str %><br/>
${result }