<%@page import="com.util.DBConn"%>
<%@page import="com.naver.NaverDTO"%>
<%@page import="com.naver.NaverDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	String id = request.getParameter("id");
	NaverDAO dao = new NaverDAO(DBConn.getConnection());
	NaverDTO dto = dao.getReadData(id);
	DBConn.close();

	if(dto==null){
		response.sendRedirect("list.jsp");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 수정</title>
<script type="text/javascript">

	function sendIt(){

		var f = document.myForm;
		f.action ="<%=cp %>/naver/update_ok.jsp"
		f.submit();
	}
	
    function qnaCheck() {
		
		var f = document.myForm;
		var clength = f.qnasel.options.length;
		var cvalue = f.qnasel.selectedIndex;
		
		if(cvalue==(clength-1)){
			f.selfq.readOnly = false;
            f.selfq.value="";
            
		}else{
			f.selfq.value = f.qnasel.options[cvalue].value;
			f.selfq.readOnly = true;
		}
	}
   	
</script>

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

.txtField{
	font-size : 10pt;
	border: 1px solid;
}

.btn{
	font-size : 10pt;
	background: #e6e6e6;
}

</style>
</head>
<body>
<br/><br/>

<table width="600" cellpadding="0" cellspacing="3" align="center" bgcolor="#e4e4e4">
<tr height="50">
	<td bgcolor="#ffffff" style="padding-left:10px;">
		<b>회원정보 수정화면</b>
	</td>
</tr>
</table>
<br/>
<form method="post" name="myForm">
<table width="600" cellpadding="0" cellspacing="0" align="center">
<tr height="2"><td colspan="2" bgcolor="#cccccc"></td></tr>
<tr height="30">
	<td align="center" width="140" bgcolor="#e6e6e6">아이디</td>
	<td style="padding-left: 5px;">
	<%=dto.getId() %>
	<input type="hidden" value="<%=dto.getId() %>" name="id">
	</td>
</tr>
<tr height="1"><td colspan="2" bgcolor="#cccccc"></td></tr>
<tr height="30">
	<td align="center" width="100" bgcolor="#e6e6e6">이름</td>
	<td style="padding-left: 5px;">
	<%=dto.getName() %>
	<input type="hidden" value="<%=dto.getName() %>" name="name">
	</td>
</tr>
<tr height="1"><td colspan="2" bgcolor="#cccccc"></td></tr>
<tr height="30">
	<td align="center" width="100" bgcolor="#e6e6e6">별명</td>
	<td style="padding-left: 5px;">
	<input type="text" name="nickname" value="<%=dto.getNickname() %>"size="20" maxlength="10" class="txtField"/>
	</td>
</tr>
<tr height="1"><td colspan="2" bgcolor="#cccccc"></td></tr>
<tr height="30">
	<td align="center" width="100" bgcolor="#e6e6e6">패스워드</td>
	<td style="padding-left: 5px;">
	<input type="text" name="pwd1" value="<%=dto.getPwd1() %>"size="20" maxlength="10" class="txtField"/>
	</td>
</tr>
<tr height="1"><td colspan="2" bgcolor="#cccccc"></td></tr>
<tr height="30">
	<td align="center" width="100" bgcolor="#e6e6e6">비밀번호찾기-질문1</td>
	<td style="padding-left: 5px;">
	<select name="qnasel" onchange="qnaCheck()" style="width: 320px;" >
		<option value="가장 기억에 남는 장소는?" >가장 기억에 남는 장소는?</option>
		<option value="가장 좋아하는 가수는?">가장 좋아하는 가수는?</option>
		<option value="좋아하는 노래?">좋아하는 노래?</option>
		<option value="태어난 곳?">태어난 곳?</option>	
        <option value="">질문,답변 직접 입력</option>
	</select>
	</td>
</tr>
<tr height="1"><td colspan="2" bgcolor="#cccccc"></td></tr>
<tr height="30">
	<td align="center" width="100" bgcolor="#e6e6e6">비밀번호찾기-질문2</td>
	<td style="padding-left: 5px;">
	<input type="text" name="selfq" value="<%=dto.getSelfq() %>" size="50" maxlength="30" class="txtField"/>
	</td>
</tr>
<tr height="1"><td colspan="2" bgcolor="#cccccc"></td></tr>
<tr height="30">
	<td align="center" width="100" bgcolor="#e6e6e6">비밀번호찾기-답변</td>
	<td style="padding-left: 5px;">
	<input type="text" name="ans" value="<%=dto.getAns() %>" size="50" maxlength="30" class="txtField"/>
	</td>
</tr>
<tr height="30">
	<td align="center" width="100" bgcolor="#e6e6e6">비밀번호찾기-이메일</td>
	<td style="padding-left: 5px;">
	<input type="text" name="email1" value="<%=dto.getEmail1() %>" size="20" maxlength="10" class="txtField"/>@
	<input type="text" name="email2" value="<%=dto.getEmail2() %>" size="20" maxlength="10" class="txtField"/>
		<input type="checkbox" name="chkemail" onclick="notemail()" <% if(dto.getEmail2()==""){ out.print("checked='checked'"); }%>/>등록 안 함
	</td>
</tr>
<tr height="30">
	<td align="center" width="100" bgcolor="#e6e6e6">비밀번호찾기-핸드폰</td>
	<td style="padding-left: 5px;">
		<select style="height:15pt;" name="phone1" onchange="phonecheck()">
			<option value=""  <%if(dto.getPhone1().equals("")){ out.print("selected='selected'"); }%> >선택하세요</option>
			<option value="010" <%if(dto.getPhone1().equals("010")){ out.print("selected='selected'"); }%>>010</option>
			<option value="011" <%if(dto.getPhone1().equals("011")){ out.print("selected='selected'"); }%>>011</option>
			<option value="016" <%if(dto.getPhone1().equals("016")){ out.print("selected='selected'"); }%>>016</option>
	        <option value="017" <%if(dto.getPhone1().equals("017")){ out.print("selected='selected'"); }%>>017</option>
	        <option value="070" <%if(dto.getPhone1().equals("070")){ out.print("selected='selected'"); }%>>070</option>
		</select>
		 -
		<input type="text" name="phone2" value="<%=dto.getPhone2() %>" size="8" maxlength="10" class="txtField"/>-
		<input type="text" name="phone3" value="<%=dto.getPhone3() %>" size="8" maxlength="10" class="txtField"/>
		<input type="checkbox" name="chkphone" onclick="notphone()" <% if(dto.getPhone2()==""){ out.print("checked='checked'"); }%>/>등록 안 함
	</td>
</tr>
<tr height="30">
	<td align="center" width="100" bgcolor="#e6e6e6">새소식</td>
	<td style="padding-left: 5px;">
	<input type="checkbox" name="chksosik" value="<%=dto.getChksosik() %>" <% if(dto.getChksosik()=="yes"){ out.print("checked='checked'"); }%> />
	</td>
</tr>
<tr height="2"><td colspan="2" bgcolor="#cccccc"></td></tr>

<tr height="35" >
	<td align="center" colspan="2">
	<input type="button" class="btn" value="수정완료" onclick="sendIt()"/>
	<input type="button" class="btn" value="수정취소" onclick="javascript:location.href='<%=cp %>/naver/list.jsp';">
	</td>
</tr>
</table>
</form>
</body>
</html>