package com.naver;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class NaverDAO {
	private Connection conn;
	
	//의존성주입
	public NaverDAO(Connection conn){
		this.conn = conn;
	}
	
	//입력
	public int insertData(NaverDTO dto){
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			
			sql = "insert into NAVER (id, name, nickname, pwd1, ans, qnasel, selfq, email1, email2, phone1, phone2, phone3,chksosik)  ";
			sql += "values (?,?,?,?,?,?,?,?,?,?,?,?,?) ";
	
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getNickname());
			pstmt.setString(4, dto.getPwd1());
			pstmt.setString(5, dto.getAns());
			pstmt.setString(6, dto.getQnasel());
			pstmt.setString(7, dto.getSelfq());
			pstmt.setString(8, dto.getEmail1());
			pstmt.setString(9, dto.getEmail2());
			pstmt.setString(10, dto.getPhone1());
			pstmt.setString(11, dto.getPhone2());
			pstmt.setString(12, dto.getPhone3());
			pstmt.setString(13, dto.getChksosik());
			
			System.out.println(sql);
			
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
		
	}
	
	
	//전체조회
	public List<NaverDTO> getLists(int start, int end){
		
		List<NaverDTO> lists = new ArrayList<NaverDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "select * from (";
			sql += "select rownum rnum, data.* from ( ";
			sql += "select id,name,nickname,pwd1,ans,qnasel,selfq,email1,email2,phone1,phone2,phone3,chksosik from naver) data) ";
			sql += "where rnum >= ? and rnum <=? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
	
				NaverDTO dto = new NaverDTO();		
				
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setNickname(rs.getString("nickname"));
				dto.setPwd1(rs.getString("pwd1"));
				dto.setAns(rs.getString("ans"));
				dto.setQnasel(rs.getString("qnasel"));
				dto.setSelfq(rs.getString("selfq"));
				dto.setEmail1(rs.getString("email1"));
				dto.setEmail2(rs.getString("email2"));
				dto.setPhone1(rs.getString("phone1"));
				dto.setPhone2(rs.getString("phone2"));
				dto.setPhone3(rs.getString("phone3"));
				dto.setChksosik(rs.getString("chksosik"));
				
				lists.add(dto);
			}
			pstmt.close();
			rs.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return lists;
	}
	
	//id조회
	public NaverDTO getReadData(String id){
		
		NaverDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql; 
		
		try {
			sql = "select id,name,nickname,pwd1,qnasel,selfq,ans,email1,email2,phone1,phone2,phone3,chksosik from naver where id=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto = new NaverDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setNickname(rs.getString("nickname"));
				dto.setPwd1(rs.getString("pwd1"));
				dto.setQnasel(rs.getString("qnasel"));
				dto.setSelfq(rs.getString("selfq"));
				dto.setAns(rs.getString("ans"));
				dto.setEmail1(rs.getString("email1"));
				dto.setEmail2(rs.getString("email2"));
				dto.setPhone1(rs.getString("phone1"));
				dto.setPhone2(rs.getString("phone2"));
				dto.setPhone3(rs.getString("phone3"));
				dto.setChksosik(rs.getString("chksosik"));
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}
	
	//수정
	public int updateData(NaverDTO dto){
		
		int result = 0;
		PreparedStatement pstmt=null;
		String sql;
		try {
			
			sql = "update naver set nickname=?, pwd1=?, qnasel=?, selfq=?, ans=?, email1=?, email2=?, phone1=?, phone2=?, phone3=?,chksosik=?";
			sql += "where id=?";
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setString(1, dto.getNickname());
			pstmt.setString(2, dto.getPwd1());
			pstmt.setString(3, dto.getQnasel());
			pstmt.setString(4, dto.getSelfq());
			pstmt.setString(5, dto.getAns());
			pstmt.setString(6, dto.getEmail1());			
			pstmt.setString(7, dto.getEmail2());
			pstmt.setString(8, dto.getPhone1());
			pstmt.setString(9, dto.getPhone2());
			pstmt.setString(10, dto.getPhone3());
			pstmt.setString(11, dto.getChksosik());
			pstmt.setString(12, dto.getId());
						
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
		
	}

	//삭제
	public int deleteData(String id){
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		try {
			sql = "delete naver where id=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	//전체데이터의 갯수 카운팅
	public int getDataCount(){
	
		int totalDataCount = 0;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			//검색어 포함하는 내용을 다출력하게 하기 위해 %붙임
			sql = "select nvl(count(*),0) from naver ";
			//searchKey는 셋중에하나 작성자,제목,내용
			pstmt= conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
				totalDataCount = rs.getInt(1);
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return totalDataCount;
	}
	
}
