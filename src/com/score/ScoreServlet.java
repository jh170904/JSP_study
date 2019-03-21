package com.score;

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

import com.util.DBCPConn;
import com.util.MyUtil;

public class ScoreServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}
	
	protected void forward(HttpServletRequest req, HttpServletResponse resp, String url)
			throws ServletException, IOException {
		//forward 
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String cp = req.getContextPath();
		
		//DB연결
		Connection conn = DBCPConn.getConnection();
		ScoreDAO dao = new ScoreDAO(conn);
		
		//페이징
		MyUtil myUtil = new MyUtil();
		
		// 뒷부분의 주소를 읽어옴
		String uri = req.getRequestURI();	
		String url;
		
		if(uri.indexOf("write.do")!=-1){
			
			url = "/sscore/write.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("write_ok.do")!=-1){
			
			ScoreDTO dto = new ScoreDTO();
			dto.setName(req.getParameter("name"));
			dto.setHak(req.getParameter("hak"));
			dto.setKor(Integer.parseInt(req.getParameter("kor")));
			dto.setEng(Integer.parseInt(req.getParameter("eng")));
			dto.setMat(Integer.parseInt(req.getParameter("mat")));
			
			dao.insertData(dto);
			
			//redirect
			url = cp + "/sung/list.do";
			resp.sendRedirect(url);
			
		}else if(uri.indexOf("list.do")!=-1){
			
			String pageNum = req.getParameter("pageNum");
			int currentPage = 1; //처음 띄우는 리스트 페이지
			
			if(pageNum!=null){
				currentPage = Integer.parseInt(pageNum);
			}else{
				pageNum = "1";
			}
			
			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");
			
			if(searchValue==null || searchValue.equals(null)){
				searchKey ="hak";
				searchValue = "";
			}else{
				
				if(req.getMethod().equalsIgnoreCase("GET")){
					searchValue = URLDecoder.decode(searchValue, "UTF-8");
				}
			}
			
			int dataCount = dao.getDataCount(searchKey, searchValue);
			int numPerPage = 5;
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);
			
			if(currentPage>totalPage)
				currentPage = totalPage;
			
			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;
			
			List<ScoreDTO> lists = dao.getList(start, end, searchKey, searchValue);
			
			String param = "";
			
			if(!searchValue.equals("")){
				
				param = "searchKey=" + searchKey;
				param += "&searchValue=" + URLEncoder.encode(searchValue,"UTF-8");
			}
			
			String listUrl = cp+"/sung/list.do";
			
			if(!param.equals("")){
				listUrl +="&" + param;
			}
			
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
			
			//포워딩할 데이터
			req.setAttribute("lists", lists);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("pageNum", pageNum);
			
			url = "/sscore/list.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("update.do")!=-1){
			
			String hak = req.getParameter("hak");
			String pageNum = req.getParameter("pageNum");
			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");
			
			if(searchValue!=null){
				searchValue =URLDecoder.decode(searchValue, "UTF-8");
			}
			
			ScoreDTO dto = dao.getReadData(hak);
			
			if(dto==null){
				url = cp + "/sung/list.do";
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
			url = "/sscore/update.jsp";
			forward(req, resp, url);
			
			
		}else if(uri.indexOf("update_ok.do")!=-1){
			
			String params = req.getParameter("params");
			ScoreDTO dto = new ScoreDTO();
			dto.setName(req.getParameter("name"));
			dto.setHak(req.getParameter("hak"));
			dto.setKor(Integer.parseInt(req.getParameter("kor")));
			dto.setEng(Integer.parseInt(req.getParameter("eng")));
			dto.setMat(Integer.parseInt(req.getParameter("mat")));
			
			dao.updateData(dto);
			
			url = cp + "/sung/list.do?"+params;
			resp.sendRedirect(url);
			
		}else if(uri.indexOf("delete_ok.do")!=-1){

			String hak = req.getParameter("hak");
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
			
			dao.deleteData(hak);
		
			url = cp + "/sung/list.do?"+param;
			resp.sendRedirect(url);
			
		}
		
	}
	

}
