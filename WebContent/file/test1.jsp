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
<title>파일 등록</title>
</head>
<body>

<form action="test2.jsp" method="post" enctype="multipart/form-data">
<!-- 파일을 업로드할때 반드시 enctype 설정해줘야 한다. enctype="multipart/form-data" -->
제목: <input type="text" name="name" /><br/>
파일: <input type="file" name="upload" /><br/>
<input type="submit" value="전송" />
</form>

</body>
</html>