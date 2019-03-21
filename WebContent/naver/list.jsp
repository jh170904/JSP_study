<%@page import="com.util.MyUtil"%>
<%@page import="com.naver.NaverDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.naver.NaverDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

	Connection conn = DBConn.getConnection();
	
	NaverDAO dao = new NaverDAO(conn);
	MyUtil myutil = new MyUtil();

	
	//넘어온 페이지 번호(MyUtil,article,update,delete)
	String pageNum = request.getParameter("pageNum");
	
	//첫시작시 현재페이지 1
	int currentPage = 1;
	
	if(pageNum!=null)
		currentPage = Integer.parseInt(pageNum);
	
	//전체데이터 갯수 구하기
	int dataCount = dao.getDataCount();
	
	//한페이지에 표시할 데이터의 갯수
	int numPerPage = 5;
	
	//전체 페이지수 구하기
	int totalPage = myutil.getPageCount(numPerPage, dataCount);
	
	//전체페이지수가 표시할 페이지수보다 큰 경우(삭제로 인해)
	if(currentPage>totalPage)
		currentPage = totalPage;

	//데이터베이스에서 가져올 rownum의 시작과 끝
	int start = (currentPage-1)*numPerPage+1;
	int end = currentPage*numPerPage;
		
	List<NaverDTO> lists = dao.getLists(start, end);
	
	//페이징 처리
	String listUrl = "list.jsp";
	String pageIndexList = myutil.pageIndexList(currentPage, totalPage, listUrl);
	
	DBConn.close();
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가입회원리스트</title>
<style type="text/css">

*{
	padding:0px;
	margin:0px;
}

body {
	font-size : 10pt;
}

td {
	font-size : 10pt;
}

.btn{
	font-size : 10pt;
	background: #e6e6e6;
}

#footer {
	clear:both;
	height:32px;
	line-height:32px;
	margin-top:5px;
	text-align:center;
}

</style>
</head>
<body>

<br><br>

<table width="1020" cellpadding="0" cellspacing="3" align="center" bgcolor="#e4e4e4">
<tr height="50">
	<td bgcolor="#ffffff" style="padding-left: 10px;'">
	<b>가입회원 리스트 화면</b>
	</td>
</tr>
</table>
<br>
<table width="1020" cellpadding="0" cellspacing="3" align="center">
<tr height="35">
	<td align="right">
	<input type="button" class="btn" value="회원가입" onclick="javascript:location.href='<%=cp %>/naver/naver.jsp';">
	</td>
</tr>
</table>
<table width="1020" cellpadding="0" cellspacing="1" align="center" bgcolor="#cccccc">
<tr height="30">
	<td align="center" bgcolor="#e6e6e6" width="70">아이디</td>
	<td align="center" bgcolor="#e6e6e6" width="70">이름</td>
	<td align="center" bgcolor="#e6e6e6" width="70">별명</td>
	<td align="center" bgcolor="#e6e6e6" width="70">비밀번호</td>
	<td align="center" bgcolor="#e6e6e6" width="200">비밀번호질문</td>
	<td align="center" bgcolor="#e6e6e6" width="100">비밀번호답변</td>
	<td align="center" bgcolor="#e6e6e6" width="150">이메일</td>
	<td align="center" bgcolor="#e6e6e6" width="150">핸드폰번호</td>
	<td align="center" bgcolor="#e6e6e6" width="70">새소식</td>
	<td align="center" bgcolor="#e6e6e6" width="70">수정,삭제</td>
</tr>
<% for(NaverDTO dto: lists){%>
	<tr height="30">	
		<td align="center" bgcolor="#ffffff"><%=dto.getId() %></td>
		<td align="center" bgcolor="#ffffff"><%=dto.getName() %></td>
		<td align="center" bgcolor="#ffffff"><%=dto.getNickname() %></td>
		<td align="center" bgcolor="#ffffff"><%=dto.getPwd1() %></td>
		<td align="center" bgcolor="#ffffff"><%=dto.getQnasel()==null? dto.getSelfq():dto.getQnasel() %></td>
		<td align="center" bgcolor="#ffffff"><%=dto.getAns() %></td>
		<td align="center" bgcolor="#ffffff">
			<%=dto.getEmail1()%>
			<% 
				if(dto.getEmail1()!=""){
					out.print("@");
				} 
			%>
			<%=dto.getEmail2()%>
		</td>
		<td align="center" bgcolor="#ffffff">
			<%=dto.getPhone1() %>
			<% 
				if(dto.getPhone1()!=""){
					out.print("-");
				} 
			%>
			<%=dto.getPhone2() %>
			<% 
				if(dto.getPhone1()!=""){
					out.print("-");
				} 
			%>
			<%=dto.getPhone3() %>
		</td>
		<td align="center" bgcolor="#ffffff"><%=dto.getChksosik() %></td>
		<td align="center" bgcolor="#ffffff">
		<a href="update.jsp?id=<%=dto.getId() %>">수정</a> 
		<a href="delete_ok.jsp?id=<%=dto.getId()  %>">삭제</a></td>
	</tr>
<% } %>
</table>
<div id="footer" align="center">
	<p>
	<%=pageIndexList %> 
	</p>
</div>

</body>
</html>