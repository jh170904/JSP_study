<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//request.setCharacterEncoding("UTF-8");
	String eng = "test";//영문입력
	String kor = "테스트";//한글입력

	String han = URLEncoder.encode(kor, "UTF-8");//한글은 인코딩을 꼭 해줘야 한다
%>
<jsp:forward page="for2.jsp">
	<jsp:param value="<%=eng %>" name="eng"/>
	<jsp:param value="<%=han %>" name="kor"/><!--한글은 포워드 방식으로 전송하면 오류남  -->
</jsp:forward>