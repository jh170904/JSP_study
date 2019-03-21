package com.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;


public class FileManager {
	
	//���ϴٿ�ε�
	//saveFileName : ������ ����� ���ϸ�
	//originalFileName : Ŭ���̾�Ʈ�� ���ε��� ���ϸ�
	//path : ������ ����� ���� ���
	//������ �ִ� ������ �о Ŭ���̾�Ʈ���� ���������� ���̱� ������ req�� �ƴ϶� resp�� �Ű������� ���
	public static boolean doFileDownload(HttpServletResponse response, String saveFileName, String originalFileName, String path){
	
		try {
			//���ϰ��
			String filePath = path + File.separator + saveFileName ; 
			
			//Ŭ���̾�Ʈ�� ������ ���ϸ��� ������� ������ ����� ���ϸ����� �Է�
			if(originalFileName==null || originalFileName.equals("")){
				originalFileName = saveFileName; 
			}
			
			//������ �ٿ�޾� Ŭ���̾�Ʈ �Ŀ� �����̸� ������ �ѱ۱��� ����
			originalFileName = new String(originalFileName.getBytes("euc-kr"),"ISO-8859-1");
			
			File f = new File(filePath);
			
			if(!f.exists()){
				return false; //������ �������� ������ stop
			}
			
			//������ ����
			response.setContentType("application/octet-stream");// .txt �� ���� ����Ȯ���ڸ� �ڿ� �ٴ� .�� octet-stream��� ��
			//�������
			response.setHeader("Content-disposition", "attachment;fileName="+originalFileName);
			
			//�������� Ŭ���̾�Ʈ�� �������� ��, Fileinputstream���� ������ ���� �� bis�� ���� ��
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(f));//f�� �൵ �ǰ� filepath�� �൵ ��
			
			//���� ������ ������ �� outputstream ���
			OutputStream out = response.getOutputStream();
			
			int data;
			byte bytes[] = new byte[4096];
			
			while((data=bis.read(bytes,0,4096))!=-1){
				out.write(bytes,0,data);
			}
			out.flush();
			out.close();
			bis.close();	
			
		} catch (Exception e) {
			System.out.println(e.toString());
			return false;
		}
		return true;
	}
	
	//���ϻ���
	public static void doFileDelete(String fileName, String path){
		try {
			
			String filePath = path + File.separator + fileName;
			File f = new File(filePath);
			
			//������ ��θ� ã�ư��� ������ ��� ����
			if(f.exists()){
				f.delete();//������ ���ϻ���
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
}
