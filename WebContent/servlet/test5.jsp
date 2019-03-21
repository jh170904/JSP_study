<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	//JSTL(JSP Standard Tag Library) 
	//사용자가 만든 태그를 커스텀태그라고 하는데 이들중에
	//자주 사용하는 태그를 표준으로 만들어 놓은 것(아파치가 라이브러리 만들어 배포)
	
	//처리영역 4가지
	//core, format, xml, sql
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="" method="post">
수 : <input type="text" name="su" /><br/>
<input type="submit" value="결과" /><br/>
</form>
<br/>
<c:if test="${!empty param.su }">
	<c:if test="${param.su%2==0 }">
		${param.su } : 짝수<br/>
	</c:if>
	<c:if test="${param.su%2==1 }">
		${param.su } : 홀수<br/>
	</c:if>
</c:if>
<br/>

<c:if test="${!empty param.su}">
	<c:choose>
		<c:when test="${param.su%3 == 0 && param.su%4 == 0}">
			${param.su}는 3과 4의 배수<br/>
		</c:when>
		<c:when test="${param.su%4 == 0}">
			${param.su}는 4의 배수<br/>
		</c:when>
		<c:when test="${param.su%3 == 0}">
			${param.su}는 3의 배수<br/>
		</c:when>
		<c:otherwise>
			${param.su}는 3과 4의 배수가 아니다<br/>
		</c:otherwise>
	</c:choose>
</c:if>



<br/>
<table>
<c:forEach var="i" begin="1" end="9" step="1">
<tr>
	<c:forEach var="j" begin="1" end="9" step="1">
		<td width="50">${i*j }</td>
	</c:forEach>
</tr>
</c:forEach>
</table>

<br/><br/>

<form action="" method="post">
수1: <input type="text" name="su1"/><br/>
수2: <input type="text" name="su2"/><br/>
<input type="submit" value="결과"/><br/>
</form>

<c:if test="${!empty param.su1 }">
	<c:set var="result" value="1" />
	<c:forEach var="a" begin="1" end="${param.su2 }" step="1">
		<c:set var="result" value="${result*param.su1 }"/>
		${param.su1 }^${a } = ${result }<br/>
	</c:forEach>
</c:if>

<br/><br/>

</body>
</html>