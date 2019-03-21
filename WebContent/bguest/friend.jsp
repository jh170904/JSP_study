<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

	function sendIt(){
		
		var f = document.myForm;
		f.submit();
		
		
	}


</script>

</head>
<body>
<form action="friend_ok.jsp" method="post" name="myForm">

이름 : <input type="text" name="name"/><br/> 
나이 : <input type="text" name="age"/><br/> 
성별 : <input type="radio" name="gender" value="남자" checked="checked"/>남자
<input type="radio" name="gender" value="여자" checked="checked"/>여자<br/> 
이상형 : <br/> 
<input type="checkbox" name="type" value="청순">청순<br/> 
<input type="checkbox" name="type" value="가련">가련<br/> 
<input type="checkbox" name="type" value="근육질">근육질<br/> 
<input type="checkbox" name="type" value="핸섬">핸섬<br/> 

<input type="button" value="등록" onclick="sendIt()">
</form>


</body>
</html>