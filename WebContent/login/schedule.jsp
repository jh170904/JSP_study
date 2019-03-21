<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String sID = session.getId();				  //유일값, 동일한 번호 또 생기지 않음
	int sTime = session.getMaxInactiveInterval(); //세션의 유효시간 30분. 이 시간이 지나면 자동 로그아웃
	//웹은 들어오는 것을 인식해도 나가는 것은 인식하지 못함. 그래서 시간을 지정하는 것.
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>일정관리 페이지</h3>

세션 아이디(sID) :  <%=sID %><br/>
세션 유효기간(sTime) : <%=sTime %>초<br/>

</body>
</html>