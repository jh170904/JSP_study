<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CSS 기초</title>

<!-- 스타일 시트 -->
<style type="text/css">

body{
	font-size: 10pt; /* body부분안에 있는 데이터에 대한 스타일 설정 가능. 하지만 테이블은 별도 적용해야함 */
}

td{
	font-family: 바탕;
}

tr{

}

table{

}

.c01{
	color: green;
}

span.c02{
	color: purple;
}

</style>

</head>
<body>

<font size="7">폰트 사이즈 7</font><br/>
<font size="8">폰트 사이즈 8</font><br/> 
폰트사이즈는 7이 가장 크고, 그 이상은 7로 표현된다.<br/><br/>

CSS 태그 내부 삽입 방법<br/>
<font style="font-size:9pt" ">폰트 사이즈 9pt </font><br/>
<font style="font-size:60pt" ">폰트 사이즈 60pt </font>

<hr/>

테이블에는 size속성이 존재하지 않음. font태그를 이용하여 반영해야 한다.<br/>
<table border="1" cellpadding="1" cellspacing="0" >
<tr>
	<td width="300"><font color="blue" size="2">
	특히 블루투스(Bluetooth)를 탑재한 헤드셋이 눈에 띈다. 
블루투스란 가까운 거리에 있는 데스크톱 PC나 노트북, 휴대폰, 가전기기 등을
연결해 주는 일종의 무선 통신 규격으로 사용 분야가 점차 넓어지는 추세다.
이런 블루투스는 헤드셋에도 적합해서 지저분한 유선 케이블이 필요 없고 
무엇보다 가지고 다니면서 사용하기에 편리하다.</font>
	</td>
	<td width="300"><font color="blue" size="2">
	특히 블루투스(Bluetooth)를 탑재한 헤드셋이 눈에 띈다. 
블루투스란 가까운 거리에 있는 데스크톱 PC나 노트북, 휴대폰, 가전기기 등을
연결해 주는 일종의 무선 통신 규격으로 사용 분야가 점차 넓어지는 추세다.
이런 블루투스는 헤드셋에도 적합해서 지저분한 유선 케이블이 필요 없고 
무엇보다 가지고 다니면서 사용하기에 편리하다.</font>
	</td>
</tr>
</table>

<br/><br/>
CSS를 이용하여 폰트 설정
<table border="1" cellpadding="1" cellspacing="0" style="font-size: 10pt; color: purple;">
<tr>
	<td width="300">
	특히 블루투스(Bluetooth)를 탑재한 헤드셋이 눈에 띈다. 
블루투스란 가까운 거리에 있는 데스크톱 PC나 노트북, 휴대폰, 가전기기 등을
연결해 주는 일종의 무선 통신 규격으로 사용 분야가 점차 넓어지는 추세다.
이런 블루투스는 헤드셋에도 적합해서 지저분한 유선 케이블이 필요 없고 
무엇보다 가지고 다니면서 사용하기에 편리하다.
	</td>
	<td width="300">
	특히 블루투스(Bluetooth)를 탑재한 헤드셋이 눈에 띈다. 
블루투스란 가까운 거리에 있는 데스크톱 PC나 노트북, 휴대폰, 가전기기 등을
연결해 주는 일종의 무선 통신 규격으로 사용 분야가 점차 넓어지는 추세다.
이런 블루투스는 헤드셋에도 적합해서 지저분한 유선 케이블이 필요 없고 
무엇보다 가지고 다니면서 사용하기에 편리하다.
	</td>
</tr>
</table>

<br/><br/>

테이블의 폰트를 한꺼번에 CSS로 설정 가능.<br/>
input 태그를 동일하게 size를 설정해도 크기가 달라지는 경우 style 속성으로 동일하게 지정하면 됨<br/>
<table style="font-family: 돋움;font-size: 10pt;" cellpadding="3">
<tr>
	<td><b>아이디</b></td>
	<td><input type="text" style="width: 100px; height: 15px;"/></td>
	<td></td>
</tr>
<tr>
	<td><b>비밀번호 확인</b></td>
	<td><input type="password" style="width: 100px; height: 15px;"/></td>
	<td><img src="./image/btn_login.gif"></td>
</tr>
<tr height="1">
	<td colspan="3" bgcolor="gray"></td>
</tr>
</table>

<br/><br/>

<hr/>
<h2>&lt; span &gt;태그</h2>
특히 <span style="color: blue">블루투스(Bluetooth)</span>를 탑재한 <span style="color: red;">헤드셋</span>이 눈에 띈다. 
<span style="color: blue">블루투스</span>란 가까운 거리에 있는 데스크톱 PC나 노트북, 휴대폰, 가전기기 등을
연결해 주는 일종의 무선 통신 규격으로 사용 분야가 점차 넓어지는 추세다.
이런 블루투스는 <span style="color: red;">헤드셋</span>에도 적합해서 지저분한 유선 케이블이 필요 없고 
무엇보다 가지고 다니면서 사용하기에 편리하다.

<hr/>
특히 <span class="c01">블루투스(Bluetooth)</span>를 탑재한 <span class="c02">헤드셋</span>이 눈에 띈다. 
<span class="c01">블루투스</span>란 가까운 거리에 있는 데스크톱 PC나 노트북, 휴대폰, 가전기기 등을
연결해 주는 일종의 무선 통신 규격으로 사용 분야가 점차 넓어지는 추세다.
이런 블루투스는 <span class="c02">헤드셋</span>에도 적합해서 지저분한 유선 케이블이 필요 없고 
무엇보다 가지고 다니면서 사용하기에 편리하다.

</body>
</html>