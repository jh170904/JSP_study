package com.fileTest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class FileTestDAO {
	
	private Connection conn = null;
	
	public FileTestDAO(Connection conn){
		this.conn = conn;
	}
	
	//���ڵ��ȣ
	public int getMaxNum(){
		int maxNum = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select nvl(max(num),0) from fileTest";
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
	
	//���ϵ����� �Է�
	public void insertData(FileTestDTO dto){
		
		PreparedStatement pstmt = null;
		String sql; 
		
		try {
			sql = "insert into fileTest (num,subject,saveFileName, ";
			sql += "originalFileName) values (?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getSaveFileName());
			pstmt.setString(4, dto.getOriginalFileName());
			
			pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
	
	//���ϵ����� ��ü��ȸ
	public List<FileTestDTO> getList(int start, int end){
		
		List<FileTestDTO> lists = new ArrayList<FileTestDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select * from (select rownum rnum,num,subject,saveFileName,originalFileName ";
			sql += "from fileTest order by num desc) ";
			sql += "where rnum >= ? and rnum <=? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				FileTestDTO dto = new FileTestDTO();
				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setOriginalFileName(rs.getString("originalFileName"));
				lists.add(dto);
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lists;
	}
	
	//Ư�� ������ ��ȸ
	public FileTestDTO getReadData(int num){
		
		FileTestDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select num,subject,saveFileName,originalFileName ";
			sql += "from fileTest where num = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num); //�Ű������� ���� num. where���ǿ� �־���
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto = new FileTestDTO();
	
				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setOriginalFileName(rs.getString("originalFileName"));
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;

	}
	
	//���ϵ����� ����
	public void deleteData(int num){
		
		PreparedStatement pstmt = null;
		String sql;
		try {
			sql = "delete fileTest where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
	
	//������ ����
	public int getDataCount(){
		
		int totalDataCount = 0;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		String sql;	
		try {
			sql = "select nvl(count(*),0) from fileTest ";
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
