package com.mail;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

public class MailSend {
	
	private String receiverEmail;
	private String senderName;
	private String senderEmail;
	private String subject;
	private String content;
	private String fileFullPath;//서버에 메일파일을 업로드한 뒤 첨부하여 전송하는 것으로 파일경로가 필요하다
	private String originalFileName;
	
	private String mailHost;//메일서버
	private String mailType;//메일타입
	
	//생성자(메일 호스트 지정 없을 경우 localhost)
	public MailSend(){
		this.mailHost = "localhost";
		this.mailType = "text/html;charset=UTF-8";
	}
	//오버라이드된 생성자(사용자가 메일호스트를 지정할 경우 반영)
	public MailSend(String mailHost){
		this.mailHost = mailHost;
		this.mailType = "text/html;charset=UTF-8";
	}
	
	public String getReceiverEmail() {
		return receiverEmail;
	}
	public void setReceiverEmail(String receiverEmail) {
		this.receiverEmail = receiverEmail;
	}
	public String getSenderName() {
		return senderName;
	}
	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}
	public String getSenderEmail() {
		return senderEmail;
	}
	public void setSenderEmail(String senderEmail) {
		this.senderEmail = senderEmail;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFileFullPath() {
		return fileFullPath;
	}
	public void setFileFullPath(String fileFullPath) {
		this.fileFullPath = fileFullPath;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getMailHost() {
		return mailHost;
	}
	public void setMailHost(String mailHost) {
		this.mailHost = mailHost;
	}
	public String getMailType() {
		return mailType;
	}
	public void setMailType(String mailType) {
		if(mailType.equalsIgnoreCase("TEXT")){
			this.mailType = "text/plain;charset=UTF-8";
		}else{
			this.mailType = "text/html;charset=UTF-8";
		}
	}
	
	
	public boolean sendMail(){
		
		try {
			//1.세션 생성
			Properties props = System.getProperties();
			props.put("main.smtp.host", mailHost);
			Session session = Session.getDefaultInstance(props,null);
			
			//2. 메일을 보낼 메세지 클래스 생성
			Message msg = new MimeMessage(session);
			//2-1. 보내는사람
			if(senderName==null||senderName.equals("")){
				msg.setFrom(new InternetAddress(senderEmail));//이름이 없을 경우 이메일주소만 전송
			}else{
				msg.setFrom(new InternetAddress(senderEmail,senderName,"UTF-8"));//이름이 있을 경우 함께 전송
			}
			//2-2. 받는사람
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(receiverEmail));
			//2-3. 제목
			msg.setSubject(subject);
			//2-4. HTML형식인 경우 엔터를 <br/>로 변환
			if(mailType.indexOf("text/html")!=-1){
				content = content.replaceAll("\n", "<br/>");
			}
			//2-5. 메일 내용과 파일을 MimeBodyPart로 나누어 담음
			makeMessage(msg);
			
			msg.setHeader("X-Mailer", senderName);
			
			//2-6. 메일보낸날짜
			msg.setSentDate(new Date());
			
			//3. 메일전송
			Transport.send(msg);
		
			//4. 메일 전송 후 파일 삭제(이게 없으면, 파일 보낸 후 계속 서버에 파일 존재)
			if(fileFullPath!=null){
				File f = new File(fileFullPath);
				if(f.exists())
					f.delete();
			}	
			
		} catch (MessagingException e) {
			System.out.println(e.toString());
			return false;
			
		} catch (Exception e) {
			System.out.println(e.toString());
			return false;
		}
		return true;
	}
	
	private void makeMessage(Message msg) throws MessagingException{
		
		if(fileFullPath==null||fileFullPath.equals("")){
			//파일을 첨부하지 않았을경우
			msg.setText(content);
			msg.setHeader("Content-Type", mailType);
		}else{
			//파일을 첨부한 경우
			//1. 메일내용
			MimeBodyPart mbp1 = new MimeBodyPart();
			mbp1.setText(content);
			mbp1.setHeader("Content-Type", mailType);
			
			//2. 첨부파일
			MimeBodyPart mbp2 = new MimeBodyPart();
			FileDataSource fds = new FileDataSource(fileFullPath);//fileFullPath는 파일의 실제 물리적인 주소
			mbp2.setDataHandler(new DataHandler(fds));
			
			try {
				if(originalFileName==null||originalFileName.equals("")){
					mbp2.setFileName(MimeUtility.encodeWord(fds.getName()));
				}else{
					mbp2.setFileName(MimeUtility.encodeWord(originalFileName));
				}
			} catch (UnsupportedEncodingException e) {//try문에서 에러 발생시 UnsupportedEncodingException에서 예외처리됨
				System.out.println(e.toString());
			}
			
			//내용과 파일 합침
			Multipart mp = new MimeMultipart();
			mp.addBodyPart(mbp1);
			mp.addBodyPart(mbp2);
			
			//메세지 클래스에 content 입력
			msg.setContent(mp);
		}
		
	}

}
