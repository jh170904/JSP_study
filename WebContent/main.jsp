<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body style="font-size: 10pt;" >
<table width="600" border="1">
<tr>
	<td colspan="2">
	<jsp:include page="/layout/top.jsp"/>
	</td>
</tr>
<tr height="300">
	<td valign="top" width="100">
	<jsp:include page="/layout/left.jsp"/>
	</td>
	<td valign="top" width="300">
	메인화면
	</td>
</tr>	
<tr>
	<td colspan="2">
	<jsp:include page="/layout/bottom.jsp"/>
	</td>
</tr>
</table>
</body>
</html>