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
	private String fileFullPath;//������ ���������� ���ε��� �� ÷���Ͽ� �����ϴ� ������ ���ϰ�ΰ� �ʿ��ϴ�
	private String originalFileName;
	
	private String mailHost;//���ϼ���
	private String mailType;//����Ÿ��
	
	//������(���� ȣ��Ʈ ���� ���� ��� localhost)
	public MailSend(){
		this.mailHost = "localhost";
		this.mailType = "text/html;charset=UTF-8";
	}
	//�������̵�� ������(����ڰ� ����ȣ��Ʈ�� ������ ��� �ݿ�)
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
			//1.���� ����
			Properties props = System.getProperties();
			props.put("main.smtp.host", mailHost);
			Session session = Session.getDefaultInstance(props,null);
			
			//2. ������ ���� �޼��� Ŭ���� ����
			Message msg = new MimeMessage(session);
			//2-1. �����»��
			if(senderName==null||senderName.equals("")){
				msg.setFrom(new InternetAddress(senderEmail));//�̸��� ���� ��� �̸����ּҸ� ����
			}else{
				msg.setFrom(new InternetAddress(senderEmail,senderName,"UTF-8"));//�̸��� ���� ��� �Բ� ����
			}
			//2-2. �޴»��
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(receiverEmail));
			//2-3. ����
			msg.setSubject(subject);
			//2-4. HTML������ ��� ���͸� <br/>�� ��ȯ
			if(mailType.indexOf("text/html")!=-1){
				content = content.replaceAll("\n", "<br/>");
			}
			//2-5. ���� ����� ������ MimeBodyPart�� ������ ����
			makeMessage(msg);
			
			msg.setHeader("X-Mailer", senderName);
			
			//2-6. ���Ϻ�����¥
			msg.setSentDate(new Date());
			
			//3. ��������
			Transport.send(msg);
		
			//4. ���� ���� �� ���� ����(�̰� ������, ���� ���� �� ��� ������ ���� ����)
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
			//������ ÷������ �ʾ������
			msg.setText(content);
			msg.setHeader("Content-Type", mailType);
		}else{
			//������ ÷���� ���
			//1. ���ϳ���
			MimeBodyPart mbp1 = new MimeBodyPart();
			mbp1.setText(content);
			mbp1.setHeader("Content-Type", mailType);
			
			//2. ÷������
			MimeBodyPart mbp2 = new MimeBodyPart();
			FileDataSource fds = new FileDataSource(fileFullPath);//fileFullPath�� ������ ���� �������� �ּ�
			mbp2.setDataHandler(new DataHandler(fds));
			
			try {
				if(originalFileName==null||originalFileName.equals("")){
					mbp2.setFileName(MimeUtility.encodeWord(fds.getName()));
				}else{
					mbp2.setFileName(MimeUtility.encodeWord(originalFileName));
				}
			} catch (UnsupportedEncodingException e) {//try������ ���� �߻��� UnsupportedEncodingException���� ����ó����
				System.out.println(e.toString());
			}
			
			//����� ���� ��ħ
			Multipart mp = new MimeMultipart();
			mp.addBodyPart(mbp1);
			mp.addBodyPart(mbp2);
			
			//�޼��� Ŭ������ content �Է�
			msg.setContent(mp);
		}
		
	}

}
