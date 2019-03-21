<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%><!-- 지시어 아무곳에 넣어도 된다 -->

<% 

	String str = String.format("%tF", Calendar.getInstance());/* Calendar import 시켜줘야됨 */

	ServletContext context = getServletContext();
	String gender = context.getInitParameter("gender");



%>
<!-- 
1. 저장버튼을 누르면 D:\java\work\study\WebContent\jsp1 저장.
2. Project Explorer에 동기화
3. D:\java\work\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\study\jsp1 이곳에 업로드 
4. D:\java\work\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\study\org\apache\jsp\jsp1 
   이곳에 들어가 .java 파일로 컴파일이됨 그리고 .class(기계어로 바꿔주고) 파일이 생기고 웹에서 실행이됨
--------------------------------------------------------------------------------------------------------------------
@index.jsp@
1. D:\java\work\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\study\org\apache\jsp
   index_jsp.java 안에 out.write 값이 servlet 방식!
	
2. init로 들어가서 service를 읽음. 정상적으로 로그아웃을 한다면 Destroy()를 거쳐 나감 
   바로 service로 들어갈수는 있지만 자바에서 들어오고 나간것을 모름 .
   네이버 로그인 후 로그아웃 안하면 캐시 남아서 로그인 상태를 유지하는 것과 비슷 
   중간에 끊어지는 이유는 세션을 끊는 시간을 정해놨기때문임 .
  public void _jspInit
  public void _jspService
  public void _jspDestroy

 -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=str %> <!-- 위 str 값을 찍으려면 왼쪽처럼 -->

<% 
out.write("여기는 서블릿"); 
%>

<%=gender %>
</body>
</html>