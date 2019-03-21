<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.util.MyUtil"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	//String root = request.getRealPath("/");
	String root = pageContext.getServletContext().getRealPath("/");
	//D:\java\work\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\study\
	
	//저장되는 위치와 폴더
	String path = root + File.separator + "pds" + File.separator + "saveData";
	
	//저장 공간이 될 폴더가 없으면 생성
	File f = new File(path);
	if(!f.exists())
		f.mkdirs();
	
	//인코딩 타입
	String encType = "UTF-8";
	
	//최대 파일 크기 제한
	int maxFileSize = 10*1024*1024; //10mb
	
	try{
		//파일 전송(cos.jar 라이브러리를 이용하여 한줄이면 전송됨)
		//사용자가 전송한 request파일을 path,maxFileSize,encType조건으로 
		MultipartRequest mr = new MultipartRequest(request,path,maxFileSize,encType,
				new DefaultFileRenamePolicy());
		
		//DB에 저장할 파일 정보를 추출
		out.print("제목: " + mr.getParameter("name")+"<br/>");
		out.print("서버에 저장된 파일명: "+ mr.getFilesystemName("upload")+"<br/>");
		out.print("업로드한 파일명: "+ mr.getOriginalFileName("upload")+"<br/>");
		
		out.print("파일타입: "+ mr.getContentType("upload")+"<br/>");
		
		//파일 객체 생성
		File file = mr.getFile("upload");
		if(file!=null){
			out.print("파일길이:"+file.length()+"<br/>");
		}
		
	}catch(Exception e){
			
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일전송</title>
</head>
<body>
</body>
</html>