package com.svt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class Test1 extends GenericServlet{

	private static final long serialVersionUID = 1L;

	@Override
	public void service(ServletRequest request, ServletResponse response)
			throws ServletException, IOException {
		
		//response ��ü�� �ѱ� ���ڵ�
		//���ݺ��� Ŭ���̾�Ʈ���� �����ϴ� ������Ÿ���� text�� html�����̰� utf-8 ���ڵ� ���
		response.setContentType("text/html;charset=utf-8");
		
		try {
			
			//������ ��ü�� �ʿ��ϸ� ��û�� �ؾ��� 
			//JSP�� ��� out.print�� �ۼ��ϸ� ������ ������ ��ü ���� �ʿ� 
			PrintWriter out = response.getWriter();
			out.print("<html>");
			out.print("<head>");
			out.print("<title>");
			out.print("�������α׷�</title></head>");
			out.print("<body style='font-size:19pt;'>");
			out.print("ȭ�� �������� �������� JSP�� �� ���ϴ�.");
			out.print("</body>");
			out.print("</html>");
			
		} catch (Exception e) {

		}
	}
}
