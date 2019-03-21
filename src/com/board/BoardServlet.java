package com.board;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.join.CustomInfo;
import com.util.DBCPConn;
import com.util.MyUtil;

public class BoardServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}
	
	
	protected void forward(HttpServletRequest req, HttpServletResponse resp, String url)
			throws ServletException, IOException {
		//forward 
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String cp = req.getContextPath();	//http://localhost:8080/study
		
		//DB연결
		Connection conn = DBCPConn.getConnection();
		BoardDAO dao = new BoardDAO(conn);
		
		//페이징
		MyUtil myUtil = new MyUtil();
		
		// /bbs/created.do 뒷부분의 주소를 읽어옴
		String uri = req.getRequestURI();	
		String url;
		
		//uri에 해당 단어가 있는지 확인
		if(uri.indexOf("created.do")!=-1){
			
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo)session.getAttribute("customInfo");
			if(info==null){
				url = "/member/login.jsp";
				forward(req, resp, url);
				return;
			}
			
			url= "/sboard/created.jsp";
			forward(req, resp, url);
		
		}else if(uri.indexOf("created_ok.do")!=-1){
			
			BoardDTO dto = new BoardDTO();
			int maxNum = dao.getMaxNum();			
			dto.setNum(maxNum+1);
			dto.setSubject(req.getParameter("subject"));
			dto.setName(req.getParameter("name"));
			dto.setEmail(req.getParameter("email"));
			dto.setPwd(req.getParameter("pwd"));
			dto.setContent(req.getParameter("content"));
			dto.setIpAddr(req.getRemoteAddr());
			
			dao.insertData(dto);
			
			//redirect 진행
			url = cp+"/bbs/list.do";
			resp.sendRedirect(url);
			
		}else if(uri.indexOf("list.do")!=-1){
			
			String pageNum = req.getParameter("pageNum");
			int currentPage = 1; //처음 띄우는 리스트 페이지
			
			if(pageNum!=null){
				currentPage = Integer.parseInt(pageNum);
			}
			
			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");
			if(searchValue==null || searchValue.equals(null)){
				searchKey ="subject";
				searchValue = "";
			}else{
				if(req.getMethod().equalsIgnoreCase("GET")){
					searchValue = URLDecoder.decode(searchValue, "UTF-8");
				}
			}
			
			int dataCount = dao.getDataCount(searchKey, searchValue);
			int numPerPage = 10;
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);
			
			if(currentPage>totalPage)
				currentPage = totalPage;
			
			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;
			
			List<BoardDTO> lists = dao.getLists(start, end, searchKey, searchValue);
			
			String param = "";
			if(!searchValue.equals("")){
				param = "searchKey=" + searchKey;
				param += "&searchValue=" + URLEncoder.encode(searchValue,"UTF-8");
			}
			
			String listUrl = cp+"/bbs/list.do";
			if(!param.equals("")){
				listUrl +="?" + param;
			}
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
			
			String articleUrl = cp + "/bbs/article.do?pageNum=" + currentPage;
			
			if(!param.equals("")){
				articleUrl += "&" + param;
			}
			
			//포워딩할 데이터
			req.setAttribute("lists", lists);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("articleUrl", articleUrl);
			req.setAttribute("dataCount", dataCount);
			
			url = "/sboard/list.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("article.do")!=-1){
			
			int num = Integer.parseInt(req.getParameter("num"));
			String pageNum = req.getParameter("pageNum");
			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");
			
			if(searchValue!=null){
				searchValue = URLDecoder.decode(searchValue, "UTF-8");
			}
			
			//조회수 증가
			dao.updateHitCount(num);
			
			//게시판 내용 읽기
			BoardDTO dto = dao.getReadData(num);
			
			//게시판 해당 내용 없을 경우 redirect
			if(dto==null){
				url = cp + "/bbs/list.do";
				resp.sendRedirect(url);
			}
			
			//내용출력
			int lineSu = dto.getContent().split("\n").length;
			dto.setContent(dto.getContent().replaceAll("\n", "<br/>"));
			
			String param = "pageNum="+pageNum;
			
			if(searchValue!=null){
				param += "&searchKey=" + searchKey;
				param += "&searchValue=" + URLEncoder.encode(searchValue,"UTF-8");
			}
			
			req.setAttribute("dto", dto);
			req.setAttribute("params", param);
			req.setAttribute("lineSu", lineSu);
			//req.setAttribute("pageNum", pageNum);
			
			url = "/sboard/article.jsp";
			forward(req, resp, url);
			
			
		}else if(uri.indexOf("updated.do")!=-1){
			
			int num = Integer.parseInt(req.getParameter("num"));
			String pageNum = req.getParameter("pageNum");
			
			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");
			
			if(searchValue!=null){
				searchValue =URLDecoder.decode(searchValue, "UTF-8");
			}
			
			BoardDTO dto = dao.getReadData(num);
			
			if(dto==null){
				url = cp + "/bbs/list.do";
				resp.sendRedirect(url);
			}
			
			String param = "pageNum="+pageNum;
			
			if(searchValue!=null){
				param += "&searchKey=" + searchKey;
				param += "&searchValue=" + URLEncoder.encode(searchValue,"UTF-8");
			}
			
			req.setAttribute("dto", dto);
			req.setAttribute("pageNum", pageNum);
			req.setAttribute("params", param);
			
			url = "/sboard/updated.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("updated_ok.do")!=-1){
			
			String params = req.getParameter("params");

			//action쓸수없음
			BoardDTO dto = new BoardDTO();
			dto.setNum(Integer.parseInt(req.getParameter("num")));
			dto.setSubject(req.getParameter("subject"));
			dto.setName(req.getParameter("name"));
			dto.setEmail(req.getParameter("email"));
			dto.setPwd(req.getParameter("pwd"));
			dto.setContent(req.getParameter("content"));
			
			dao.updateData(dto);

			url = cp + "/bbs/list.do?"+params;
			resp.sendRedirect(url);
			
		}else if(uri.indexOf("deleted_ok.do")!=-1){
			
			int num = Integer.parseInt(req.getParameter("num"));
			String pageNum = req.getParameter("pageNum");
			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");

			if(searchValue!=null){
				searchValue = URLDecoder.decode(searchValue, "UTF-8");
			}
			String param = "pageNum="+pageNum;
			
			if(searchValue!=null){
				param += "&searchKey=" + searchKey;
				param += "&searchValue=" + URLEncoder.encode(searchValue,"UTF-8");
			}
			dao.deleteData(num);

			url = cp + "/bbs/list.do?"+param;
			resp.sendRedirect(url);
		}
		
	}


}
