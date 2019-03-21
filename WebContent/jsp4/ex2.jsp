<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String userName = request.getParameter("userName");
	String userBirth = request.getParameter("userBirth");
	
	session.setAttribute("userName", userName);
	session.setAttribute("userBirth", userBirth);
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
			alert("아이디입력!");
			f.userName.focus();
			return;
		}		
		
		if(!f.userPwd.value){
			alert("비밀번호입력!");
			f.userBirth.focus();
			return;
		}
		
		f.submit();
	}
	
</script>

</head>
<body>


<form name="myForm" action="ex3.jsp" method="post">
아이디 : <input type="text" name="userId" size="10"/><br/>
패스워드 : <input type="text" name="userPwd" size="10"/><br/>

<!--ex1.jsp에서 입력받은 이름과 생일을 value로 바로 세팅해줌 -->
<!-- hidden은 getParameter로 받은 데이터를 숨겨놓은 상태로 보낼 수 있다 -->
<input type="hidden" name="userName" value="<%=userName %>"/> 
<input type="hidden" name="userBirth" value="<%=userBirth %>"/>

<input type="button" value="가입" onclick="sendIt()">
</form>

</body>
</html>