<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="test4_ok.jsp" method="post">
<!-- method="post" post방식이란? 데이터를 넘기는 방법. 사용자한테 값을 받을땐 post 방식 이용 -->
<!-- method="get" get방식이란? 데이터를 넘길 때 주소에 모든 값을 가지고 넘어감. 
데이터가 모두 노출이 된다. 프로그래머가 사용할 땐 get방식 사용
파일명?변수1=value값&변수2=value값&변수3=value값-->
<!-- http://192.168.16.16:8080/study/jsp1/test4_ok.jsp?su1=5&su2=88&age=&%EA%B2%B0%EA%B3%BC=%EC%A0%9C%EC%B6%9C -->

수1: <input type="text" name="su1"/><br/> 
수2: <input type="text" name="su2"/><br/>
나이: <input type="text" name="age"/><br/>
이름: <input type="text" name="name"/><br/>
<!-- button과 submit의 차이점. submit은 무조건 action을 찾아간다. 
action에 값을 가져갈 페이지를 지정해주면 된다. -->
<input type="submit" name="결과"/><br/> 

</form>

Get방식: <a href="test4_ok.jsp?su1=1000&su2=200&age=25&name=%EC%88%98%EC%A7%80">Get방식</a>

</body>
</html>