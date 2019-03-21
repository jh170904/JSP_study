<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자바스크립트</title>
<script type="text/javascript">

var num1=20; 
var num2=5;

document.write("num1 + num2 = " + (num1+num2) + "<br/>" );
document.write("num1 - num2 = " + (num1-num2) + "<br/>" );
document.write("num1 / num2 = " + (num1/num2) + "<br/>" );
document.write("num1 * num2 = " + (num1*num2) + "<br/>" );
document.write("num1 % num2 = " + (num1%num2) + "<br/>" );
document.write("num1 > num2 = " + (num1>num2) + "<br/>" );
document.write("num1 < num2 = " + (num1<num2) + "<br/>" );
document.write("<hr/>");

//if문
var ans = 0;
if(ans>0){
	
	document.write("입력한 숫자 "+ ans + "은 양수입니다.");
	
}else if(ans<0){
	
	document.write("입력한 숫자 "+ ans + "은 음수입니다.");
	
}else{
	
	document.write("입력한 숫자 "+ ans + "은 0입니다.");	
	
}

document.write("<hr/>");

//반복문
for(var i=1;i<=10;i++){
	document.write(i+"<br/>");
}

var j=0;
while(j<10){
	j++;	
	document.write(j +"\t");
}

document.write("<hr/>");

test1();
document.write("이 부분은 함수 밖!! <br/>");

function test1(){
	document.write("이 부분은 함수 안!! <br/>");
}

function test2(){
	alert("여기는 자바스크립트 입니다."); //호출될 때 알람창 생성
}

function test3(color){
	window.document.bgColor = color; //자바스크립트 객체의 계층구조 
}

document.write("<hr/>");


</script>
</head>
<body onload="test2();">

여기는 HTML BODY 부분 입니다. (가장 마지막에 출력되므로 자바스크립트가 먼저 실행된다는 것을 알수있다.)<br/>
<hr/>
페이지 배경색 변경하기 <br/>
<input type="radio" name="r1" onclick="test3('white')" checked="checked"/>white 
<input type="radio" name="r1" onclick="test3('red')"/>red 
<input type="radio" name="r1" onclick="test3('skyblue')"/>skyblue 
<input type="radio" name="r1" onclick="test3('green')"/>green 
<input type="radio" name="r1" onclick="test3('yellow')"/>yellow 
<hr/>

</body>
</html>