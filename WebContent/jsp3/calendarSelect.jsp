<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	Calendar cal = Calendar.getInstance();
	
	//오늘 날짜 구하기
	int nowYear = cal.get(Calendar.YEAR); 			//2019	
	int nowMonth = cal.get(Calendar.MONTH)+1;		//2
	int nowDay = cal.get(Calendar.DAY_OF_MONTH); 	//15

	
	//클라이언트에 의해 넘어온 데이터(첫 시작시 null)
	String strYear = request.getParameter("year");		//null -> 2019
	String strMonth = request.getParameter("month");	//null -> 3
	
	//버튼 '<' -1 ,'>' +1 누르면 다른 페이지를 호출하는 게 아니라 자기자신의 페이지에서 보여줘야한다 
	
	//표시할 달력의 년, 월
	int year = nowYear;
	int month = nowMonth;
	
	if(strYear!=null){
		year = Integer.parseInt(strYear);
	}
	if(strMonth!=null){
		month = Integer.parseInt(strMonth);
	}
	
	int preYear = year;
	int preMonth = month-1;
	if(preMonth<1){ //1월 이전의 경우 전년도 12월로 변경
		preYear = year-1;
		preMonth = 12;
	}
	
	int nextYear = year;
	int nextMonth = month+1;
	if(nextMonth>12){ //12월 이후의 경우 차년도 1월로 변경
		nextYear = year+1;
		nextMonth = 1;		
	}
	
	//표시할 달력 셋팅
	cal.set(year, month-1, 1);
	
	int startDay = 1;
	int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);

	//year년 month월 1일의 week 구하기
	int week = cal.get(Calendar.DAY_OF_WEEK);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>만년 달력</title>

<style type="text/css">

body{
	font-size: 12pt;
}

td{
	font-size: 12pt;
}

</style>

<script type="text/javascript">

	function selectYear(){
		
		int y = document.myForm.yearSel.value;
		document.myForm.action="calendarSelect.jsp?year="+y;
		y + "&month=<%=month %>";
	}
	
	function selectMonth(){
		
		document.myForm.yearSel.value;
	}

</script>

</head>
<body>

<br/><br/>
<form name="myForm" method="get">

<table align="center" width="210" cellpadding="2" cellspacing="1">
<tr>
	<td align="center">		
		<select name="yearSel" onchange="selectYear();">
		<%
			for(int i=(year-5);i<=year+5;i++){
				if(i!=year){
					out.print("<option value="+i+">"+i+"</option>");
				}else{
					out.print("<option value="+i+" selected='selected'>"+i+"</option>");	
				}
			}
		%>	
		</select><b>년
		<select name="monthSel" onchange="selectMonth();">
		<%
			for(int i=1;i<=12;i++){
				out.print("<option>"+i+"</option>");
			}
		%>	
		</select>월</b>
	</td>
</tr>
</table>
<table align="center" width="210" cellpadding="0" cellspacing="1" bgcolor="#cccccc">
<tr>
	<td bgcolor="#e6e4e6" align="center"><font color="red">일</font></td>
	<td bgcolor="#e6e4e6" align="center">월</td>
	<td bgcolor="#e6e4e6" align="center">화</td>
	<td bgcolor="#e6e4e6" align="center">수</td>
	<td bgcolor="#e6e4e6" align="center">목</td>
	<td bgcolor="#e6e4e6" align="center">금</td>
	<td bgcolor="#e6e4e6" align="center"><font color="blue">토</font></td>
</tr>

<%
	int newLine=0;
	out.print("<tr height='20'>");
	for(int i=1;i<week;i++){
		out.print("<td bgcolor='#ffffff'></td>");
		newLine++;
	}
	
	for(int i=startDay; i<=endDay; i++){
		//글꼴색
		String fontColor = (newLine==0) ? "red": (newLine==0)?"blue":"black";
		//오늘날짜배경색
		String bgColor = (nowYear==year)&&(nowMonth==month)&&(nowDay==i)? "#e6e4e6" : "#ffffff" ;
		out.print("<td align='center' bgcolor='"+bgColor+"'>" +
		"<font color='"+fontColor+ "'>"+i+"</font></td>");
		//<td align=center bgcolor='#e6e4e6'><font color='black'> i </font></td>
		
		newLine++;
		if(newLine==7&&i!=endDay){
			out.print("</tr><tr height='20'>");
			newLine=0;
		}
	}
	while(newLine>0 && newLine<7){
		out.print("<td bgcolor='#ffffff'>&nbsp;</td>");
		newLine++;
	}
	out.print("</tr>");
%>
</table>
</form>


</body>
</html>
