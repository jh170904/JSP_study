package com.fileTest;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.util.DBCPConn;
import com.util.FileManager;
import com.util.MyUtil;

public class FileTestServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	protected void forward(HttpServletRequest req, HttpServletResponse resp, String url)
			throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		Connection conn = DBCPConn.getConnection();
		FileTestDAO dao = new FileTestDAO(conn);
		//����¡
		MyUtil myUtil = new MyUtil();
		String cp = req.getContextPath();
		String uri = req.getRequestURI();
		String url;
		
		//���� ���ε� ��ġ ����
		String root = getServletContext().getRealPath("/") ;
		String path = root + File.separator + "pds" + File.separator + "saveFile";
		//System.out.println(root);
		//System.out.println(path);
		//String path = root+ "\\pds\\saveData";
		
		File f = new File(path);
		
		//���� �������� ������ ���丮 ����
		if(!f.exists()){
			f.mkdirs();
		}
		
		if(uri.indexOf("write.do")!=-1){
			
			url = "/fileTest/write.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("write_ok.do")!=-1){
			
			String encType = "UTF-8";
			int maxSize = 10*1024*1024;
			//���� ���ε�
			MultipartRequest mr = new MultipartRequest(req, path, maxSize, encType, new DefaultFileRenamePolicy());
			
			//DB�� �������� �Է�
			//���ε��� ���Ϸκ��� ���� ����
			if(mr.getFile("uploadFile")!=null){//null�� �ƴϸ� ������ ����� ���ε�Ȱ�
				FileTestDTO dto = new FileTestDTO();
				int maxNum = dao.getMaxNum();
				dto.setNum(maxNum+1);
				dto.setSubject(mr.getParameter("subject"));
				dto.setSaveFileName(mr.getFilesystemName("uploadFile"));
				dto.setOriginalFileName(mr.getOriginalFileName("uploadFile"));
				dao.insertData(dto);
			}
			
			//list.do �������� �����̷�Ʈ
			url = cp + "/file/list.do";
			resp.sendRedirect(url);
			
		}else if(uri.indexOf("list.do")!=-1){
			
			String pageNum = req.getParameter("pageNum");
			int currentPage = 1; //ó�� ���� ����Ʈ ������
			
			if(pageNum!=null){
				currentPage = Integer.parseInt(pageNum);
			}
			
			int dataCount = dao.getDataCount();
			int numPerPage = 5;
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);
			
			if(currentPage>totalPage)
				currentPage = totalPage;
			
			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;
			
			String listUrl = cp+"/file/list.do";
			List<FileTestDTO> lists = dao.getList(start,end);
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
			
			//�ٿ�ε���
			String downloadPath = cp + "/file/download.do";
			//�������
			String deletePath = cp + "/file/delete.do";
			//�̹������ϰ��
			String imagePath = cp + "/pds/saveFile";
			req.setAttribute("imagePath", imagePath);
			
			//�������� ���̺��� ����Ʈ�� ����
			req.setAttribute("lists", lists);
			req.setAttribute("pageNum", pageNum);
			req.setAttribute("downloadPath", downloadPath);
			req.setAttribute("deletePath", deletePath);
			req.setAttribute("pageIndexList", pageIndexList);
			
			//list.jsp �������� ������
			url = "/fileTest/list.jsp";
			forward(req, resp, url);
		
		}else if(uri.indexOf("download.do")!=-1){
			 
			int num = Integer.parseInt(req.getParameter("num"));
			FileTestDTO dto = dao.getReadData(num);
			
			if(dto==null)
				return;//�ٿ�ε��� ������ ������ ����
			
			//������ ���������� ������ true, �ƴҰ�� false
			boolean flag = FileManager.doFileDownload(resp, dto.getSaveFileName(), dto.getOriginalFileName(), path);
			
			//������ ������ �����µ� DB���� ���������� �������� ���� ���� ���� 
			//�� �����Ͱ� �ڵ����� ����ȭ�� ���� �ʴ� ������ ����. �׷��� boolean �̿�
			
			//�ٿ�ε� ���� �߻��� flag�� false ��ȯ �� ��, ���� �޼��� ���
			if(flag==false){
				resp.setContentType("text/html;charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.print("<script type='text/javascript'>");
				out.print("alert('download error');");
				out.print("history.back()");//Ȯ�ι�ư�� ������ ����ȭ������ ������
				out.print("</script>");
			}
			
		}else if(uri.indexOf("delete.do")!=-1){
			
			int num = Integer.parseInt(req.getParameter("num"));
			int pageNum = Integer.parseInt(req.getParameter("pageNum"));
			FileTestDTO dto = dao.getReadData(num);
			
			//������ ���� ����
			FileManager.doFileDelete(dto.getSaveFileName(), path);
			
			//���̺� ���� ����
			dao.deleteData(num);
	
			//���� ���� �� ����Ʈ �������� �����̷�Ʈ
			url = cp + "/file/list.do?pageNum="+pageNum;
			resp.sendRedirect(url);
		}
	}
}
