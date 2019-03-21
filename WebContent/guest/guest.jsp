<%@page import="java.awt.print.Printable"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.util.MyUtil"%>
<%@page import="com.guest.GuestDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.guest.GuestDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp=request.getContextPath();
	
	Connection conn=DBConn.getConnection();
	GuestDAO dao = new GuestDAO(conn);
	
	MyUtil myUtil = new MyUtil();
	
	//넘어온 페이지 번호(myUtil,article,update,delete)
	String pageNum = request.getParameter("pageNum");
	
	int currentPage = 1;
	
	if(pageNum!=null)
		currentPage = Integer.parseInt(pageNum);
	
	
	//전체 데이터 갯수 구하기
	int dataCount = dao.getDataCount();
	
	//한 페이지에 표시할 데이터의 갯수
	int numPerPage = 5;
	
	//전체 페이지수 구하기
	int totalPage = myUtil.getPageCount(numPerPage, dataCount);
	
	
	//전체페이지수가 표시할 페이지수보다 큰 경우(삭제로 인해)
	if(currentPage>totalPage)
		currentPage = totalPage;
	
	//데이터베이스에서 가져올 rownum의 시작과 끝
	int start = (currentPage-1)*numPerPage+1;
	int end = currentPage*numPerPage;
	
	
	List<GuestDTO> lists = dao.getLists(start, end);
	
	
	//페이징 처리
	String listUrl = "guest.jsp";
	
	String pageIndexList = myUtil.pageIndexList(currentPage,totalPage,listUrl);
	
	DBConn.close();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
<link rel="stylesheet" href="/study/guest/data/style.css"
	type="text/css" />
<script type="text/javascript" src="/study/guest/data/guest.js"></script>
<script type="text/javascript">
	function isDelete(num) {

		if(confirm("위 자료를 삭제 하시겠습니까?")){
			
			location.href="<%=cp%>/guest/delete.jsp?num=" + num;
		}
	}
</script>
</head>
<body>
	<br>
	<br>
	<table width="560" border="2" cellpadding="0" cellspacing="0"
		bordercolor="#d6d4a6" align="center">

		<tr height="40">
			<td style="padding-left: 20px;"><b>방 명 록</b></td>
		</tr>
	</table>

	<br>
	<form action="" name="myForm" method="post">
		<table width="560" border="0" cellpadding="3" cellspacing="0"
			align="center">

			<tr>
				<td colspan="2" height="3" bgcolor="#dbdbdb" align="center"></td>
			</tr>

			<tr>
				<td width="20%" height="30" bgcolor="#eeeeee"
					style="padding-left: 20px;">작성자</td>
				<td width="80" style="padding-left: 10px;"><input type="text"
					name="name" size="35" maxlength="20" class="boxTF" /></td>
			</tr>

			<tr>
				<td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td>
			</tr>

			<tr>
				<td width="20%" height="30" bgcolor="#eeeeee"
					style="padding-left: 20px;">E-Mail</td>
				<td width="80" style="padding-left: 10px;"><input type="text"
					name="email" size="35" maxlength="50" class="boxTF" /></td>
			</tr>

			<tr>
				<td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td>
			</tr>

			<tr>
				<td width="20%" height="30" bgcolor="#eeeeee"
					style="padding-left: 20px;">홈페이지</td>
				<td width="80" style="padding-left: 10px;"><input type="text"
					name="homepage" value="http://" size="35" maxlength="50"
					class="boxTF" /></td>
			</tr>

			<tr>
				<td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td>
			</tr>

			<tr>
				<td width="20%" height="30" bgcolor="#eeeeee"
					style="padding-left: 20px; padding-top: 5px;" valign="top">
					내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
				<td width="80" valign="top" style="padding-left: 10px;"><textarea
						rows="7" cols="60" name="content" class="boxTA"></textarea></td>
			</tr>

			<tr>
				<td colspan="2" height="3" bgcolor="#dbdbdb" align="center"></td>
			</tr>
		</table>

		<table width="560" border="0" cellpadding="3" cellspacing="0"
			align="center">
			<tr align="center">
				<td height="40"><input type="button" value="등록하기" class="btn1"
					onclick="sendIt();" /> <input type="reset" value="다시입력"
					class="btn1" onclick="document.myForm.name.focus();" /></td>
			</tr>
		</table>
	</form>

	<!-- 밑에 댓글달기 -->
	<table width="560" border="0" cellpadding="3" cellspacing="0"
		align="center">
		<%
			if(lists.isEmpty()){
		%>
		<tr>
			<td colspan="2" height="3" bgcolor="#dbdbdb" align="center"></td>
		</tr>

		<tr>
			<td colspan="2" width="100%" height="30" bgcolor="#eeeeee" align="center"
			style="padding:10px;">
				<b>등록된 자료가 없습니다.</b></td>
		</tr>
		<% 	
			}
			else{
				for (GuestDTO temp : lists) {
		%>
		<tr>
			<td colspan="2" height="3" bgcolor="#dbdbdb" align="center"></td>
		</tr>

		<tr>
			<td width="50%" height="30" bgcolor="#eeeeee" style="padding-left: 5px;">
				<b>No <%=temp.getNum()%>. <%=temp.getName()%>(<%=temp.getEmail()%>)</b></td>
			<td width="50%" height="30" bgcolor="#eeeeee" style="padding-right: 5px;" align="right">
				<%=temp.getHomepage()%>
			</td>
		</tr>
		<tr>
			<td width="50%" height="30" bgcolor="#eeeeee"
				style="padding-left: 5px;">작성일 : <%=temp.getCreated()%> (<%=temp.getIpAddr()%>)
			</td>
			<td width="50%" height="30" bgcolor="#eeeeee"
				style="padding-left: 5px; padding-right: 5px;" align="right">
				<a href="javascript:isDelete('<%=temp.getNum()%>')">삭제</a>
			</td>
		</tr>
		<tr>
			<td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td>
		</tr>
		<tr>
			<td colspan="2" width="100%" height="30" bgcolor="#ffffff"
				style="padding-left: 5px;"><%=temp.getContent()%></td>
		</tr>
		<%
				}
			}
		%>
		<tr>
			<td colspan="2" height="3" bgcolor="#dbdbdb" align="center"></td>
		</tr>
	</table>

	<!-- <a href="javascript:isDelete('1')">삭제</a> -->

	<table width="560" border="0" cellpadding="3" cellspacing="0"
		align="center">
		<tr>
			<td colspan="2" align="center"><%=pageIndexList%></td>
		</tr>
	</table>

</body>
</html>


































