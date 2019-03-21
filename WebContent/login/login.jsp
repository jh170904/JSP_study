<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	//세션에 올라와있는 데이터를 받음. 이 데이터는 30분간 보관
	String userId = (String)session.getAttribute("userId");

	
	//세션 기간 변경(5초)
	session.setMaxInactiveInterval(5*60);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function sendIt(){
		
		var f = document.myForm;
		if(!f.userId.value){
			alert("아이디 입력!");
			f.userId.focus();
			return;
		}
		if(!f.userPwd.value){
			alert("패스워드 입력!");
			f.userPwd.focus();
			return;
		}	
		f.submit();	
	}

</script>

</head>
<body style="font-size: 10pt;">

<table border="1" width="600" height="600">
<tr height="20">
	<td colspan="2" align="right">	
		|게시판|
		<%if(userId==null){%>
		일정관리
		<%}else{ %>
		<a href="schedule.jsp">일정관리</a>
		<%} %>
		|
	</td>
</tr>
<tr height="400">
	<%if(userId==null){%>
	<td width="200" valign="top">	
	<form action="login_ok.jsp" method="post" name="myForm">
		아이디:<input type="text" name="userId" size="10"/><br/>
		패스워드:<input type="password" name="userPwd" size="10"/><br/>
		<input type="button" value="로그인" onclick="sendIt();"/>
	</form>
	<% }else{ %>	
		<font color="blue"><b><%=userId %></b></font>님 방가방가...
		<a href="logout.jsp">로그아웃</a>
	<%} %>
	</td>
	<td valign="middle" align="center">
	<font color="blue"><b>로그인하면 새로운 세상이 보입니다.</b></font>
	</td>
</tr>
</table>

</body>
</html>