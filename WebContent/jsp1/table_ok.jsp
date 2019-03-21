<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<%
	int su1 = Integer.parseInt(request.getParameter("su1"));
	int su2 = Integer.parseInt(request.getParameter("su2"));
	int n1 =0;
	int n2 =0;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="1" >
<!-- 사용자가 입력하기 전까지 테이블의 가로,세로 크기를 알 수 없음. 
그래서 jsp로 코딩해줘야 함 -->
<%
	for(int i=1; i<=su1; i++){
		out.print("<tr>");//가로
		for(int j=1;j<=su2; j++){
			n1++;
			out.print("<td align='center'>"+ n1 +"</td>");
		}
		out.print("</tr>");
	}

%>
</table>

<br/>

<!-- html 과 jsp를 섞어서 쓸 수 있음 -->
<table border="1" >
<%
	for(int i=1; i<=su1; i++){
		out.print("<tr>");//가로
		for(int j=1;j<=su2; j++){
			n2++;
%>
			<td width="50" align="center"><%=n2 %></td>
<%
		}
%>			
	</tr>
<%
	}
%>	
</table>
</body>
</html>