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
		rd.forward(req, resp); //포워드 메소드
	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp); //doPost호출
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
			
			//회원가입시 포워드 페이지
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
			
			//회원가입이 완료되면 인덱스페이지로 이동 
			url = cp+"/index.jsp"; 
			resp.sendRedirect(url);
			
		}else if(uri.indexOf("login.do")!=-1){
			
			//로그인시 포워드 페이지
			url = "/member/login.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("login_ok.do")!=-1){
			
			String userId = req.getParameter("userId");
			String userPwd = req.getParameter("userPwd");
			
			MemberDTO dto = dao.getReadData(userId);
			
			//dto==null일 경우 아이디가 없음
			//세션에 있는 pwd가 DB의 pwd와 일치하지 않는 경우
			if(dto==null||!dto.getUserPwd().equals(userPwd)){
				req.setAttribute("message", "아이디 또는 패스워드를 정확히 입력하세요!");
				url = "/member/login.jsp";
				forward(req, resp, url);
				return;//로그인 실패시 더이상의 소스코드가 실행되지 않도록 return작성
			}
			
			CustomInfo info = new CustomInfo();
			info.setUserId(dto.getUserId()); // 저장해놓은 파라미터값(String userId)을 사용해도 오류는 없음 
			info.setUserName(dto.getUserName());
			
			//자바 클래스에서는 html과는 달리 세션이 없으므로 객체를 달라고 요청을 해야함
			HttpSession session = req.getSession();
			session.setAttribute("customInfo", info);
			
			url =cp; // http:localhost:8080/study 입력시 index.jsp 실행됨
			resp.sendRedirect(url);
			
		}else if(uri.indexOf("logout.do")!=-1){
			
			HttpSession session = req.getSession();
			session.removeAttribute("customInfo");
			session.invalidate();
			
			url= cp;//인덱스페이지
			resp.sendRedirect(url);//로그아웃시 인덱스페이지로 리다이렉트 진행
		
		}else if(uri.indexOf("searchpw.do")!=-1){
			
			//비밀번호찾기 포워드 페이지
			url = "/member/searchpw.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("searchpw_ok.do")!=-1){
			
			String userId = req.getParameter("userId");
			String userTel = req.getParameter("userTel");
			
			MemberDTO dto = dao.getReadData(userId);
			
			//dto==null일 경우 아이디가 없음
			//세션에 있는 pwd가 DB의 pwd와 일치하지 않는 경우
			if(dto==null||!dto.getUserTel().equals(userTel)){
				req.setAttribute("message", "일치하는 회원정보가 존재하지 않습니다!");
				url = "/member/searchpw.jsp";
				forward(req, resp, url);
				return;//로그인 실패시 더이상의 소스코드가 실행되지 않도록 return작성
			}else{
				String str = "비밀번호는 ["+dto.getUserPwd()+"]입니다.";
				req.setAttribute("message", str);
				url = "/member/searchpw.jsp";
				forward(req, resp, url);
			}
			
		}else if(uri.indexOf("updated.do")!=-1){
			
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo)session.getAttribute("customInfo");
			MemberDTO dto = dao.getReadData(info.getUserId());
			req.setAttribute("dto", dto);
			
			//회원정보수정 포워드 페이지
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
