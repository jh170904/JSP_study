<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 메뉴</title>
</head>
<body>


<h2>아이디 검색 화면</h2>
<table>
<tr>
	<td><img alt="" src="./image/tit_h1_0201.gif"></td>
</tr>

<tr height="1">
	<td colspan="2" bgcolor="#dad6d7"></td>
</tr>
</table>
<table style="font-size:10pt; font-family: 돋움;" cellpadding="3">
<tr>
	<td><b>이름</b></td>
	<td><input type="text"></td>
</tr>
<tr>
	<td><b>주민등록번호</b></td>
	<td><input type="text" size="12">-<input type="password" size="12"></td>	
</tr>

<tr height="1">
	<td colspan="2" bgcolor="#dad6d7"></td>
</tr>

<tr>
	<td align="center" colspan="2" >
		<img alt="" src="./image/btn_ok01.gif"/>
	</td>
</tr>
</table>


<hr/>
<h2>로그인 화면</h2>
<table style="font-size: 10pt; font-family: 돋움" cellpadding="0">
<tr>
	<td><b>아이디</b></td>
	<td><input type="text" style="width: 100px; height: 22;"/></td>
	<td></td>
</tr>

<tr>
	<td><b>비밀번호</b></td>
	<td><input type="password" style="width: 100px; height: 22;"/></td>
	<td><img alt="" src="./image/btn_login.gif"/></td>
</tr>

<tr>
	<td colspan="3" align="center">
		<input type="checkbox"/>아이디 저장
		<input type="checkbox" checked="checked"/>보안접속
	</td>
</tr>

<tr height="1">
	<td colspan="3" bgcolor="#dad6d7"></td>
</tr>
</table>


<br/>
<h2>검색 화면</h2>
<table background="./image/bg_575x84.gif" width="575" height="84">
<tr>
	<td align="center">
	<table style="font-size: 10pt; font-family: 돋움;" cellpadding="3">
	<tr>
		<td>
			<input type="text" style="width: 300px; height: 22px;"/>
			<img alt="" src="./image/btn_search.gif" align="top"/>
		</td>
	</tr>
	<tr>
		<td align="center">
			 <input type="radio" name="r1" checked="checked"><font color="#339900"/><b>카페명</b></font>
 			 <input type="radio" name="r1"/><font color="#339900"><b>게시물</b></font>
			 <input type="radio" name="r1"/><font color="#339900"><b>매니저/ID</b></font>
		</td>
	</tr>
	</table>
	</td>		
</tr>
</table>

<br/>
<table border="1" cellpadding="3" cellspacing="0" bordercolor="gray" >
<tr>
	<td>file</td><td><input type="file"/></td>
</tr>
<tr>
	<td>button</td><td><input type="button" value="전송"/></td>
</tr>
<tr>
	<td>text</td><td><input type="text"/></td>
</tr>
<tr>
	<td>password</td><td><input type="password"/></td>
</tr>
<tr>
	<td>checkbox</td><td><input type="checkbox"/></td>
</tr>
<tr>
	<td>radio</td><td><input type="radio"/></td>
</tr>
</table>

<br/>

<h2>핸드폰 번호 입력</h2>
휴대폰
<select>
	<option>선택</option>
	<option>010</option>
	<option>011</option>
	<option>016</option>
	<option>017</option>	
</select>
-
<input type="text" size="4"/>
-
<input type="text" size="4"/><br/>
<br/>

<h2>메모, 방명록, 댓글로 사용</h2>
<textarea rows="10" cols="20"></textarea>

</body>
</html>