<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자바스크립트</title>

<script type="text/javascript">

	var str;//특별히 자료형을 선언해줄 필요가 없다.
	str = "변수 선언!!";
	document.write(str + " : " + typeof(str) + "<br/>");//body 부분에 출력
	
	str = 123;
	document.write(str + " : " + typeof(str) + "<br/>");
	
	str = true;
	document.write(str + " : " + typeof(str) + "<br/>");
	
	document.write("----------------------------------<br/>");
	
	var num1=20; 
	var num2=5;
	
	document.write("num1 + num2 = " + (num1+num2) + "<br/>" );
	document.write("num1 - num2 = " + (num1-num2) + "<br/>" );
	document.write("num1 / num2 = " + (num1/num2) + "<br/>" );
	document.write("num1 * num2 = " + (num1*num2) + "<br/>" );
	document.write("num1 % num2 = " + (num1%num2) + "<br/>" );
	document.write("num1 > num2 = " + (num1>num2) + "<br/>" );
	
	document.write("----------------------------------<br/>");
	
	var hello = "함수 밖 전역변수(hello)" ;
	
	function thisFunction(){
		
		var hello = "함수 안 지역변수(hello)";	
		global = "함수 안 전역변수(global)";
		var local = "함수 안 지역변수(local)";
		
		document.write("함수 안에서 출력-----------<br/>");
		document.write(hello + "<br/>");
		document.write(global + "<br/>");
		document.write(local + "<br/>");
		document.write("<br/><br/>");
	}
	
	thisFunction();	//함수 호출 명령어는 script 어디서 써도 실행 가능
	document.write("함수 밖에서 출력-----------<br/>");
	document.write(hello + "<br/>"); //전역변수 호출
	document.write(global + "<br/>");
	document.write(local + "<br/>"); //지역변수는 찍히지 않음.
	document.write("<br/><br/>");
	document.write("----------------------------------<br/>");

	
</script>


</head>
<body>

</body>
</html>