<%@page import="com.calc.CalcVO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	//변수명 java의 class파일과 동일하다면 생략해도 오류 생기지 않음
	//int su1 = Integer.parseInt(request.getParameter("su1"));
	//int su2 = Integer.parseInt(request.getParameter("su2"));
	//String oper = request.getParameter("oper");

/* 	
	//DB를 사용하지 않았으므로 vo클래스의 객체 생성
	CalcVO vo = new CalcVO();
	
	//setter를 이용해서 변수값 할당
	vo.setSu1(su1);
	vo.setSu2(su2);
	vo.setOper(oper);
	
	String str = vo.toString();
 */	
	
%>
<!-- 액션태그 -->
<!-- vo는 해당페이지 안에서만 사용이 되므로 충돌이 일어나지 않는다 -->
<!-- setter의 이름과 변수의 이름이 동일하면 value 입력을 생략해도 실행된다. -->
<!-- 변수의 개수가 몇개가 되든 모든 속성들을 setter를 실행하도록 함 -->

<jsp:useBean id="vo" class="com.calc.CalcVO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="vo"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=vo.toString() %>
</body>
</html>