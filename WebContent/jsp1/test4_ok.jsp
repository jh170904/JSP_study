<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8"); //post방식 한글깨짐 방지
	
	//test4의 submit을 통해 넘어오는 값(Parameter)을 받아줘야 함.  
	//request에 su1 , su2가 담겨서 이동. 이때, 넘겨오는 모든 값들은 String으로 넘어온다.
	//response로 처리한 결과값을 응답 
/* 	
	String su1 = request.getParameter("su1"); 
	String su2 = request.getParameter("su2");

	int s1 = Integer.parseInt(su1);
	int s2 = Integer.parseInt(su2);
*/
	int s1 = Integer.parseInt(request.getParameter("su1"));
	int s2 = Integer.parseInt(request.getParameter("su2"));
	String age = request.getParameter("age");
	String name= request.getParameter("name");
	int sum;
	
	sum = s1 + s2;
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

합:<%=s1 %> + <%=s2 %> = <%=sum %><br/>
나이: <%=age %>살<br/>
이름: <%=name %> 
</body>
</html>