<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>테이블 만들기</title>
</head>
<body>

<h2>테이블 정렬</h2>
<table border="1" width="600" cellpadding="10"  cellspacing="0" bordercolor="gray">
<tr height="60" align="center">										<!--특정행의 속성 변경 -->
<td colspan="2">A</td><!--<td>B</td> --><td>C</td>					<!-- colspan 가로병합 -->
</tr>
<tr height="100" align="right">										<!-- 레코드전체가 오른쪽정렬이지만 사진 td는 가운데 정렬 -->
<td>가</td><td align="center"><img alt="" src="./image/1_ABT_M100(1).jpg"/></td><td rowspan="2">다</td><!-- rowspan세로병합 -->
</tr>
<tr>
<td>1</td><td>2</td><!-- <td>3</td> -->
</tr>
</table>

<br/>
<h2>테이블 만들기 1</h2>
<table border="1" width="600" height="200" cellspacing="0" cellpadding="0">
<tr align="center">
	<td width=200>
		<table border="1" width="200" height="200">
			<tr align="center"><td>A</td></tr>
			<tr align="center"><td>B</td></tr>
		</table>
	</td>
	<td>
		<table border="1" width="400" height="200" cellspacing="0" cellpadding="0">
			<tr align="center"><td bgcolor="#9933ff">1</td><td>2</td></tr>
			<tr align="center" bgcolor="pink"><td>3</td><td>4</td></tr>			
			<tr align="center"><td>5</td><td bgcolor="skyblue">6</td></tr>
		</table>
	</td>
</tr>
</table>

<br/>
<h2>테이블 만들기 2</h2>
<table border="1" width="600" height="200" cellspacing="0" cellpadding="0">
<tr align="center">
	<td width=200>
		A
	</td>
	<td rowspan="2">
		<table border="1" width="400" height="200" cellspacing="0" cellpadding="0">
			<tr align="center"><td>1</td><td>2</td></tr>
			<tr align="center"><td>3</td><td>4</td></tr>			
			<tr align="center"><td>5</td><td>6</td></tr>
		</table>
	</td>
</tr>
<tr align="center">
	<td width="200">B</td>
</tr>
</table>

<h2>사진,음악파일 하이퍼링크에 추가</h2>

<a href="./image/개무룩.gif">개무룩</a><br/>
<a href="./image/ghost.gif">Ghost</a><br/>
<a href="./image/아모르 파티.mp3">아모르 파티</a><br/>
<img alt="" src="./image/개무룩.gif"><br/>
<a href="malito:suzi@naver.com">수지</a><br/>
<hr/>

<h2>테이블을 이용하여 기사를 보여주는 메뉴 만들기</h2>
<table border="0" cellspacing="0" cellpadding="1">
<tr>
	<td><img src="./image/hot.jpg" ></td>
	<td><font size="2"><b>화제만발</b><br/>
		<font color="red">&#149;</font><a href="./image/개무룩.gif">배수지 헤어스타일 화들짝..</a><br/>
		<font color="red">&#149;</font>수지가 소유한 건물 알고보니..<br/>
		<font color="red">&#149;</font>렐렐렐ㄹ레렐레레레레레..<br/>
		</font>
	</td>
</tr>

<!-- <tr>
	<td colspan="2"><hr></td> 행 하나를 추가하고 선을 그은 것
</tr> -->
<tr>
	<td height="1" bgcolor="000000" colspan="2"></td>
</tr>
</table>
<table border="0" cellspacing="0" cellpadding="1">
<tr>
	<td><img src="./image/life.jpg" ></td>
	<td><font size="2"><b>오후세시</b><br/>
		<font color="red">&#149;</font> 아마도 신기하네 길어져라..<br/>
		<font color="red">&#149;</font> 수지가 소유한 건물 알고보니..<br/>
		<font color="red">&#149;</font> 그렇군요.......................<br/>
		</font>
	</td>
</tr>
<tr>
	<td height="1" bgcolor="000000" colspan="2"></td>
</tr>
</table>
<table border="0" cellspacing="0" cellpadding="1">
<tr>
	<td><img src="./image/eco.jpg" ></td>
	<td><font size="2"><b>벌써엄청나</b><br/>
		<font color="red">&#149;</font>동해물과 백두산이...............<br/>
		<font color="red">&#149;</font>수지가 소유한 건물 알고보니..<br/>
		<font color="red">&#149;</font>하나님이 보우하사...............<br/>
		</font>
	</td>
</tr>
<tr>
	<td height="1" bgcolor="000000" colspan="2"></td>
</tr>
</table>
<br/>
<table border="0" cellpadding="2" cellspacing="2" width="590">
<tr>
	<td valign="top" width="270">
		<table border="0">
			<tr>
				<td>
					<img alt="" src="./image/titlec_o.gif">
					<font size="3">
						<b><font color="ff6900">경제</font>뉴스</b>
					</font>
				</td>
			</tr>
		</table>
	</td>
</tr>
<tr><td colspan="2" background="./image/3_2_dt.gif" height="1"></td></tr>
<tr>
	<td width="290">
		<table border="0" align="center" style="font-size: 10pt;" cellpadding="3">
			<tr>
				<td colspan="2" background="./image/subtit4_f.gif" width="268" height="35" valign="bottom" align="right">
					<a href="">more..</a>
				</td>
			</tr>
			<tr>
				<td width="8"></td>
				<td><a href="">AA 정유 오늘부터 공짜..</a></td>
			</tr>
			<tr>
				<td width="8"></td>
				<td><a href="">BB 정유 오늘부터 공짜..</a></td>
			</tr>
			<tr>
				<td width="8"></td>
				<td><a href="">CC 정유 오늘부터 공짜..</a></td>
			</tr>
			<tr>
				<td width="8"></td>
				<td><a href="">DD 정유 오늘부터 공짜..</a></td>
			</tr>
			<tr>
				<td width="8"></td>
				<td><a href="">EE 정유 오늘부터 공짜..</a></td>
			</tr>		
		</table>
	</td>
	<td width="290">
		<table border="0" align="center" style="font-size: 10pt;" cellpadding="3">
			<tr>
				<td colspan="2" background="./image/subtit4_c.gif" width="268" height="35" valign="bottom" align="right">
					<a href="">more..</a>
				</td>
			</tr>
			<tr>
				<td width="8"></td>
				<td><a href="">AA 카드 오늘부터 공짜..</a></td>
			</tr>
			<tr>
				<td width="8"></td>
				<td><a href="">BB 카드 오늘부터 공짜..</a></td>
			</tr>
			<tr>
				<td width="8"></td>
				<td><a href="">CC 카드 오늘부터 공짜..</a></td>
			</tr>
			<tr>
				<td width="8"></td>
				<td><a href="">DD 카드 오늘부터 공짜..</a></td>
			</tr>
			<tr>
				<td width="8"></td>
				<td><a href="">EE 카드 오늘부터 공짜..</a></td>
			</tr>		
		</table>
	</td>	
</tr>
<tr>
	<td width="290">
		<table border="0" align="center" style="font-size: 10pt;" cellpadding="3">
			<tr>
				<td colspan="2" background="./image/subtit4_p.gif" width="268" height="35" valign="bottom" align="right">
					<a href="">more..</a>
				</td>
			</tr>
			<tr>
				<td width="8"></td>
				<td><a href="">AA 보험 오늘부터 공짜..</a></td>
			</tr>
			<tr>
				<td width="8"></td>
				<td><a href="">BB 보험 오늘부터 공짜..</a></td>
			</tr>
			<tr>
				<td width="8"></td>
				<td><a href="">CC 보험 오늘부터 공짜..</a></td>
			</tr>
			<tr>
				<td width="8"></td>
				<td><a href="">DD 보험 오늘부터 공짜..</a></td>
			</tr>
			<tr>
				<td width="8"></td>
				<td><a href="">EE 보험 오늘부터 공짜..</a></td>
			</tr>		
		</table>
	</td>
	<td width="290">
		<table border="0" align="center" style="font-size: 10pt;" cellpadding="3">
			<tr>
				<td colspan="2" background="./image/subtit4_ss.gif" width="268" height="35" valign="bottom" align="right">
					<a href="">more..</a>
				</td>
			</tr>
			<tr>
				<td width="8"></td>
				<td><a href="">AA 대출 오늘부터 공짜..</a></td>
			</tr>
			<tr>
				<td width="8"></td>
				<td><a href="">BB 대출 오늘부터 공짜..</a></td>
			</tr>
			<tr>
				<td width="8"></td>
				<td><a href="">CC 대출 오늘부터 공짜..</a></td>
			</tr>
			<tr>
				<td width="8"></td>
				<td><a href="">DD 대출 오늘부터 공짜..</a></td>
			</tr>
			<tr>
				<td width="8"></td>
				<td><a href="">EE 대출 오늘부터 공짜..</a></td>
			</tr>		
		</table>
	</td>	
</tr>
</table>


</body>
</html>