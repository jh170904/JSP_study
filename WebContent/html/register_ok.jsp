<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<%
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String nickname = request.getParameter("nickname");
	String pwd1 = request.getParameter("pwd1");
	String qnaSel = request.getParameter("qnaSel");
	String selfq = request.getParameter("selfq");
	String ans = request.getParameter("ans");
	String emailid = request.getParameter("emailid");
	String emailaddr = request.getParameter("emailaddr");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String chksosik = request.getParameter("chksosik");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
이름 : <%=name %><br>
아이디 : <%=id %><br>
별명 : <%=nickname %><br>
비밀번호 : <%=pwd1 %><br>
비밀번호 발급수단 : <br>
1 질문 : 
<%
	if(qnaSel==""){
		out.print(selfq);
	}else{
		out.print(qnaSel);
	}
%> 

/ 답변 : <%=ans %> <br>
2 이메일주소 : 
<%
	if(emailid==""){
		out.print("등록 안 함 <br/>");
	}else{
		String str = String.format("%s @ %s <br/>", emailid,emailaddr);
		out.print(str);
	}

%>
3 핸드폰번호 : 
<%
	if(phone1==""){
		out.print("등록 안 함 <br/>");
	}else{
		String str = String.format("%d - %d - %d <br/>", phone1,phone2,phone3);
		out.print(str);
	}

%>
소식지 수신 : 
<%
	if(chksosik == null){
		out.print("no");
	}else{
		out.print(chksosik);
	}
%> <br>


</body>
</html>