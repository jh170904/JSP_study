package com.score;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ScoreDAO {
	private Connection conn;
	
	//����������
	//������Ұ��� ���Ӽ��� �ҽ��ڵ忡�� �������� �ʰ� �ܺ��� �������� ���� ���� �����ϵ��� �ϴ� ������ ����
	public ScoreDAO(Connection conn){
		this.conn = conn;
	}
	
	//�Է�
	public int insertData(ScoreDTO dto){
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			
			sql = "insert into score (hak,name,kor,eng,mat) ";
			sql += "values (?,?,?,?,?) ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getHak());
			pstmt.setString(2, dto.getName());
			pstmt.setInt(3, dto.getKor());
			pstmt.setInt(4, dto.getEng());
			pstmt.setInt(5, dto.getMat());
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	//��ü��ȸ
	public List<ScoreDTO> getList(int start, int end, String searchKey, String searchValue){
		
		List<ScoreDTO> lists = new ArrayList<ScoreDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			searchValue = "%" + searchValue + "%";

			sql = "select * from (";
			sql += "select rownum rnum, hak, name, kor, eng, mat, ";
			sql += "(kor+eng+mat) tot, (kor+eng+mat)/3 ave, ";
			sql += "rank() over(order by (kor+eng+mat) desc) rank ";
			sql += "from score where " +searchKey+ " like ? )";
			sql += "where rnum >= ? and rnum <=? ";
			
			pstmt = conn.prepareStatement(sql);	
			pstmt.setString(1, searchValue);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ScoreDTO dto = new ScoreDTO();
				dto.setHak(rs.getString("hak"));
				dto.setName(rs.getString("name"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
				dto.setTot(rs.getInt("tot"));
				dto.setAve(rs.getInt("ave"));
				dto.setRank(rs.getInt("rank"));
				lists.add(dto);
			}
			pstmt.close();
			rs.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return lists;
	}
	
	public List<ScoreDTO> getList(){
		
		List<ScoreDTO> lists = new ArrayList<ScoreDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {

			sql = "select hak, name, kor, eng, mat, ";
			sql += "(kor+eng+mat) tot, (kor+eng+mat)/3 ave, ";
			sql += "rank() over(order by (kor+eng+mat) desc) rank ";
			sql += "from score";

			pstmt = conn.prepareStatement(sql);	

			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ScoreDTO dto = new ScoreDTO();
				dto.setHak(rs.getString("hak"));
				dto.setName(rs.getString("name"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
				dto.setTot(rs.getInt("tot"));
				dto.setAve(rs.getInt("ave"));
				dto.setRank(rs.getInt("rank"));
				lists.add(dto);
			}
			pstmt.close();
			rs.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return lists;
	}
	
	
	//�й���ȸ
	public ScoreDTO getReadData(String hak){
		
		ScoreDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql; 
		
		try {
			sql = "select hak, name, kor, eng, mat from score where hak=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hak);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto = new ScoreDTO();
				dto.setHak(rs.getString("hak"));
				dto.setName(rs.getString("name"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}
	
	//����
	public int updateData(ScoreDTO dto){
		
		int result = 0;
		PreparedStatement pstmt=null;
		String sql;
		try {
			
			sql = "update score set kor=?, eng=?, mat=? ";
			sql += "where hak=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getKor());
			pstmt.setInt(2, dto.getEng());
			pstmt.setInt(3, dto.getMat());
			pstmt.setString(4, dto.getHak());
			
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
		
	}

	//����
	public int deleteData(String hak){
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		try {
			sql = "delete score where hak=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hak);
			result = pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	//��ü�������� ���� ī����
	public int getDataCount(String searchKey, String searchValue){
	
		int totalDataCount = 0;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			//�˻��� �����ϴ� ������ ������ϰ� �ϱ� ���� %����
			searchValue = "%" + searchValue + "%";
			sql = "select nvl(count(*),0) from score ";
			sql += "where " + searchKey + " like ? ";
			//searchKey�� ���߿��ϳ� �ۼ���,����,����
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, searchValue);
			
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
