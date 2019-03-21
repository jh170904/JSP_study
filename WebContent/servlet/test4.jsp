<%-- <%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	//EL(Expression Language)
	//표현언어(EL)는 표현식(<%=..)을 대신하는 효과를 가지며
	//null 값을 가지는 변수에 대해 좀 더 관대하고
	//데이터형을 자동으로 변환해준다	
	request.setAttribute("result", "테스트");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="" method="post">
수1: <input type="text" name= "su1" /><br/>
수2: <input type="text" name= "su2" /><br/>
<input type="submit" value="결과"/><br/>
</form>

<br/>
<%=request.getAttribute("result") %><br/>
${result }<br/>

<!-- su1의 값 받기 -->
su1 : <%=request.getAttribute("su1") %><br/>
su1 : ${param.su1 }<br/>

<%
/* 	
	int su1 = Integer.parseInt(request.getParameter("su1"));
	int su2 = Integer.parseInt(request.getParameter("su2"));
	int sum = 0;
	sum = su1+su2;	
	 */
%>

합: <%=sum %>
결과 : ${param.su1 + param.su2 }<br/>
${param.su1 }은 ${param.su1%2==0?"짝수":"홀수" }<br/>
${10*20 } <br/>
</body>
</html> --%>