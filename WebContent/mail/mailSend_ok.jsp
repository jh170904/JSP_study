<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.mail.MailSend"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String root = getServletContext().getRealPath("/");
	String path = root + File.separator + "pds" + File.separator + "mailFile";
	
	//파일 객체 생성
	File f = new File(path);
	if(!f.exists())
		f.mkdirs();//해당경로파일 없을경우 디렉토리 생성
	
	String encType = "UTF-8";
	int maxFileSize = 10*1024*1024;
	
	//메일전송 객체 생성
	MailSend mail = new MailSend();
	
	//파일업로드
	MultipartRequest mr = new MultipartRequest(request,path,maxFileSize,encType,new DefaultFileRenamePolicy());
	mail.setSenderName(mr.getParameter("senderName"));
	mail.setSenderEmail(mr.getParameter("senderEmail"));
	mail.setReceiverEmail(mr.getParameter("receiverEmail"));
	mail.setSubject(mr.getParameter("subject"));
	mail.setContent(mr.getParameter("content"));
	
	//첨부파일
	String fileName = mr.getFilesystemName("fileName"); //mailSend.jsp에서 첨부파일의 fileName
	if(fileName!=null&&!fileName.equals("")){
		String fileFullPath = path + File.separator + fileName;
		mail.setFileFullPath(fileFullPath);
		mail.setOriginalFileName(mr.getOriginalFileName("fileName"));
	}
	
	mail.sendMail();
	out.print("메일 전송 완료!!");	

%>