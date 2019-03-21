package com.svt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.CORBA.Request;

public class Test3 extends HttpServlet {

	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String name = req.getParameter("name");
		String age = req.getParameter("age");
		String str = name + "�� ���̴� "+ age + "�� �Դϴ�.";
		
		//������ ������
		req.setAttribute("result", str);
		
		//forward 
		RequestDispatcher rd =req.getRequestDispatcher("/servlet/test3_ok.jsp");
		rd.forward(req, resp);
		
/*		
		//�ѱ����ڵ�
		resp.setContentType("text/html;charset=utf-8");
		
		//��ü����
		PrintWriter out = resp.getWriter();
		
		//���
		out.print("<html><body>");
		out.print("str : " +str +"<br/>");
		out.print("</body></html>");
*/
		
	}
	
}
