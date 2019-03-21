package com.imageTest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class imageTestDAO {

	
	private Connection conn = null;
	
	public imageTestDAO(Connection conn){
		this.conn = conn;
	}
	
	//레코드번호
	public int getMaxNum(){
		int maxNum = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select nvl(max(num),0) from imageTest";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				maxNum = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return maxNum;
	}
	
	//파일데이터 입력
	public void insertData(imageTestDTO dto){
		
		PreparedStatement pstmt = null;
		String sql; 
		
		try {
			sql = "insert into imageTest (num,subject,saveFileName) values (?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getSaveFileName());
			
			pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
	
	//파일데이터 전체조회
	public List<imageTestDTO> getList(int start, int end){
		
		List<imageTestDTO> lists = new ArrayList<imageTestDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {			
			sql = "select * from (select rownum rnum,num,subject,saveFileName ";
			sql += "from imageTest order by num desc) ";
			sql += "where rnum >= ? and rnum <=? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();
			
			while(rs.next()){
				imageTestDTO dto = new imageTestDTO();
				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				lists.add(dto);
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lists;
	}
	
	//특정 데이터 조회
	public imageTestDTO getReadData(int num){
		
		imageTestDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select num,subject,saveFileName from imageTest where num = ? ";	
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num); //매개변수로 받은 num. where조건에 넣어줌
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto = new imageTestDTO();
				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
				dto.setSaveFileName(rs.getString("saveFileName"));
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;

	}
	
	//파일데이터 삭제
	public void deleteData(int num){
		
		PreparedStatement pstmt = null;
		String sql;
		try {
			sql = "delete imageTest where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
	
	//데이터 세기
	public int getDataCount(){
		
		int totalDataCount = 0;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		String sql;	
		try {
			sql = "select nvl(count(*),0) from imageTest ";
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
