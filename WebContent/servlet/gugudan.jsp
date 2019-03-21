<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>구구단</title>
</head>
<body>
<form action="" method="post">

단 : <input type="text" name="dan"/>
<input type="submit" value="결과"/><br/>
</form>
<br>

<table>
<c:if test="${!empty param.dan }">
	<tr>
		<td align="center">${param.dan } 단</td>
	</tr>
	<c:forEach var="i" begin="1" end="9" step="1">
	<tr>
		<td>${param.dan } × ${i } = ${param.dan*i }</td>
	</tr>
	</c:forEach>
</c:if>
</table>

</body>
</html>
