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
	
	function sendIt(val){
		//var f = document.myForm;
		var f = document.forms[0];/* body에 있는 form의 순서대로 인덱스번호가 붙음. 0번째 form */
		if(!f.name.value){
			alert("이름 작성하세요!");
			f.name.focus();
			return;
		}
		
		if(val=='a'){
			f.action = "button2.jsp";	
		}else{
			f.action = "button3.jsp";		
		}
		f.submit();
		
	}
	
	function sendData() {
		var f = document.forms[1];
		
		if(!f.name.value){
			alert("이름 작성하세요!");
			f.name.focus();
			return false;
		}
		f.submit();
	}
</script>
</head>
<body>

button을 이용한 전송
<form method="post" name="myForm">
이름:<input type="text" name="name"/><br>
<input type="button" value="첫번째 전송" onclick="sendIt('a');"/>
<input type="button" value="두번째 전송" onclick="sendIt('b');"/>
</form>

<hr>
submit을 이용한 전송
<form action="" method="post" name="myForm1" onsubmit="return sendData();">
이름:<input type="text" name="name"/><br>
<input type="submit" value="첫번째 전송" onclick="this.form.action='button2.jsp';"/>
<input type="submit" value="두번째 전송" onclick="this.form.action='button3.jsp';"/>
</form>

</body>
</html>