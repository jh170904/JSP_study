package com.guest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.board.BoardDTO;

public class GuestDAO {

	private Connection conn=null;

	public GuestDAO(Connection conn){
		this.conn=conn;
	}

	public int getMaxNum(){
		int maxNum=0;

		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql;

		try {
			sql="select nvl(max(num),0) from guest";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next())
				maxNum=rs.getInt(1);
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return maxNum;
	}

	public void insertData(GuestDTO dto){

		PreparedStatement pstmt=null;
		String sql;

		try {
			sql="insert into guest (num,name,email,homepage,";
			sql+="content,created,ipAddr) values (?,?,?,?,?,sysdate,?)";

			pstmt=conn.prepareStatement(sql);

			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getHomepage());
			pstmt.setString(5, dto.getContent());
			pstmt.setString(6, dto.getIpAddr());

			int result=pstmt.executeUpdate();

			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}	
	}
	
	//전체 데이터 가져오기
	public List<GuestDTO> getLists(int start, int end){
		List<GuestDTO> lists=new ArrayList<GuestDTO>();

		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql;

		try {
			
			sql = "select * from (";
			sql+= "select rownum rnum, data.* from (";		//rownum : 삭제해도 데이터 갯수 세어주기 위해 사용
			sql+= "select num,name,email,homepage,content,";
			sql+= "created,ipAddr from guest ";
			sql+= "order by num desc) data) ";
			sql+= "where rnum>=? and rnum<=?";
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs=pstmt.executeQuery();

			while(rs.next()){
				GuestDTO dto=new GuestDTO();

				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setHomepage(rs.getString("homepage"));
				dto.setContent(rs.getString("content"));
				dto.setCreated(rs.getString("created"));
				dto.setIpAddr(rs.getString("ipAddr"));

				lists.add(dto);
			}

			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return lists;
	}
	

	//삭제
	public void deleteData(int num){

		PreparedStatement pstmt=null;
		String sql;

		try{
			sql="delete guest where num=?";

			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);

			int result=pstmt.executeUpdate();

			pstmt.close();
		}catch(Exception e){
			System.out.println(e.toString());
		}

	}

	//전체 데이터의 갯수
	public int getDataCount() {

		int totalDataCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select nvl(count(*),0) from guest";

			pstmt = conn.prepareStatement(sql);

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


























