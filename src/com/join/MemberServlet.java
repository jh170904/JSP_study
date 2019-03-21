package com.join;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.DBCPConn;

public class MemberServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	protected void forward(HttpServletRequest req, HttpServletResponse resp, String url)
			throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp); //������ �޼ҵ�
	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp); //doPostȣ��
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		Connection conn = DBCPConn.getConnection();
		MemberDAO dao = new MemberDAO(conn);
		
		String cp = req.getContextPath();
		String uri = req.getRequestURI();
		String url;
		
		if(uri.indexOf("created.do")!=-1){
			
			//ȸ�����Խ� ������ ������
			url = "/member/created.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("created_ok.do")!=-1){
			
			MemberDTO dto = new MemberDTO();
			dto.setUserId(req.getParameter("userId"));
			dto.setUserPwd(req.getParameter("userPwd"));
			dto.setUserName(req.getParameter("userName"));
			dto.setUserBirth(req.getParameter("userBirth"));
			dto.setUserTel(req.getParameter("userTel"));
			
			dao.insertData(dto);
			
			//ȸ�������� �Ϸ�Ǹ� �ε����������� �̵� 
			url = cp+"/index.jsp"; 
			resp.sendRedirect(url);
			
		}else if(uri.indexOf("login.do")!=-1){
			
			//�α��ν� ������ ������
			url = "/member/login.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("login_ok.do")!=-1){
			
			String userId = req.getParameter("userId");
			String userPwd = req.getParameter("userPwd");
			
			MemberDTO dto = dao.getReadData(userId);
			
			//dto==null�� ��� ���̵� ����
			//���ǿ� �ִ� pwd�� DB�� pwd�� ��ġ���� �ʴ� ���
			if(dto==null||!dto.getUserPwd().equals(userPwd)){
				req.setAttribute("message", "���̵� �Ǵ� �н����带 ��Ȯ�� �Է��ϼ���!");
				url = "/member/login.jsp";
				forward(req, resp, url);
				return;//�α��� ���н� ���̻��� �ҽ��ڵ尡 ������� �ʵ��� return�ۼ�
			}
			
			CustomInfo info = new CustomInfo();
			info.setUserId(dto.getUserId()); // �����س��� �Ķ���Ͱ�(String userId)�� ����ص� ������ ���� 
			info.setUserName(dto.getUserName());
			
			//�ڹ� Ŭ���������� html���� �޸� ������ �����Ƿ� ��ü�� �޶�� ��û�� �ؾ���
			HttpSession session = req.getSession();
			session.setAttribute("customInfo", info);
			
			url =cp; // http:localhost:8080/study �Է½� index.jsp �����
			resp.sendRedirect(url);
			
		}else if(uri.indexOf("logout.do")!=-1){
			
			HttpSession session = req.getSession();
			session.removeAttribute("customInfo");
			session.invalidate();
			
			url= cp;//�ε���������
			resp.sendRedirect(url);//�α׾ƿ��� �ε����������� �����̷�Ʈ ����
		
		}else if(uri.indexOf("searchpw.do")!=-1){
			
			//��й�ȣã�� ������ ������
			url = "/member/searchpw.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("searchpw_ok.do")!=-1){
			
			String userId = req.getParameter("userId");
			String userTel = req.getParameter("userTel");
			
			MemberDTO dto = dao.getReadData(userId);
			
			//dto==null�� ��� ���̵� ����
			//���ǿ� �ִ� pwd�� DB�� pwd�� ��ġ���� �ʴ� ���
			if(dto==null||!dto.getUserTel().equals(userTel)){
				req.setAttribute("message", "��ġ�ϴ� ȸ�������� �������� �ʽ��ϴ�!");
				url = "/member/searchpw.jsp";
				forward(req, resp, url);
				return;//�α��� ���н� ���̻��� �ҽ��ڵ尡 ������� �ʵ��� return�ۼ�
			}else{
				String str = "��й�ȣ�� ["+dto.getUserPwd()+"]�Դϴ�.";
				req.setAttribute("message", str);
				url = "/member/searchpw.jsp";
				forward(req, resp, url);
			}
			
		}else if(uri.indexOf("updated.do")!=-1){
			
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo)session.getAttribute("customInfo");
			MemberDTO dto = dao.getReadData(info.getUserId());
			req.setAttribute("dto", dto);
			
			//ȸ���������� ������ ������
			url = "/member/updated.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("updated_ok.do")!=-1){
			
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo)session.getAttribute("customInfo");
			
			MemberDTO dto = new MemberDTO();
			
			dto.setUserId(info.getUserId());
			dto.setUserPwd(req.getParameter("userPwd"));
			dto.setUserBirth(req.getParameter("userBirth"));
			dto.setUserTel(req.getParameter("userTel"));
		
			dao.updateData(dto);
			
			url = cp ;
			resp.sendRedirect(url);
		}
		
	}
}
