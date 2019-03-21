<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String memo = request.getParameter("memo");
	String gender = request.getParameter("gender");
	String hobby[] = request.getParameterValues("hobby");
	String major[] = request.getParameterValues("major");
	
	memo = memo.replaceAll("\n", "<br/>");//textarea의 줄바꿈을 인식하기 위함
	
	String str = "";
	if(hobby!=null){
		
		for(String temp: hobby){
			str+= (temp + " ");
		}
	}
	
	String str1 = "";
	if(major!=null){
		
		for(String temp: major){
			str1 += (temp + " ");
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>입력 조회</title>
</head>
<body>
이름: <%=name %><br/>
메모: <%=memo %><br/>
성별: <%=gender %><br/>
취미: <%=hobby %><br/><!-- 이렇게 작성하면 해쉬코드가 조회됨  -->
취미: <%=str %><br/>
전공: <%=str1 %><br/>

</body>
</html>