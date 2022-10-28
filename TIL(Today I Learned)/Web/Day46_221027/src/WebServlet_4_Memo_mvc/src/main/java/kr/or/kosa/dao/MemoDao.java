package kr.or.kosa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import kr.or.kosa.dto.Memo;
import kr.or.kosa.utils.SingletonHelper;

/*
DB연결
CRUD 함수 생성 > memo
1. 전체조회	: select id, email, content, from memo
2. 조건조회	: select id, email, content, from memo where id=?	//제약 id > pk
3. 삽입		: insert into memo(id, mail, content) values(?,?,?)
4. 수정		: update memo set email=?, content=? where id=?
5. 삭제		: delete from memo where id=?
알파.... LIKE 검색 where email like '%naver%'

자바로 함수를 생성 .... 처리 .... 거의 똑같아요
ArrayList
HashMap
Generic
*/


public class MemoDao {
	Connection conn = null;
	public MemoDao() {
		conn = SingletonHelper.getConnection("oracle");
	}
	
	//1. 전체조회
	public List<Memo> getMemoAllList(){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//Point
		List<Memo> memolist = new ArrayList<Memo>();
	      
       try {
           String sql="select * from memo";
           pstmt = conn.prepareStatement(sql);
           rs = pstmt.executeQuery();
            
           if (rs.next()) { //최소 1건
        	   do {
            	Memo memo = new Memo();
            	
            	memo.setId(rs.getString("id"));
            	memo.setEmail(rs.getString("email"));
            	memo.setContent(rs.getString("content"));
				memolist.add(memo); // 배열에 객체 담기
				} while (rs.next());
        	   
         }else { System.out.println("조회된 데이터가 없습니다."); }

         } catch (Exception e) {
            
         }finally {
            SingletonHelper.close(rs);
            SingletonHelper.close(pstmt);
         }
       return memolist;
	}
	
	
	//2. 조건조회
	public Memo getMemoListById(int id) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//POINT
		Memo memo = null;

		try {
			String sql = "select id, email, content from memo where id=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, id);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				memo = new Memo(); // 하나의 row 담기 위한 객체
				memo.setId(rs.getString("id"));
            	memo.setEmail(rs.getString("email"));
            	memo.setContent(rs.getString("content"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			SingletonHelper.close(rs);
			SingletonHelper.close(pstmt);
		}
		return memo;
	}
	
	//3. 데이터 삽입 
		public int insertMemo(Memo memo) {
			//Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			int row = 0;//? parameter 값들만 전달
		      
	        try {
	           //conn = SingletonHelper.getConnection("oracle");
	           String sql="insert into memo(id, email, content) values(?,?,?)";
	           pstmt = conn.prepareStatement(sql);
	           
	           pstmt.setString(1, memo.getId());
		       pstmt.setString(2, memo.getEmail());
		       pstmt.setString(3, memo.getContent());
	           
	           row = pstmt.executeUpdate();
	            
	         }catch (Exception e) {
	            
	         }finally {
	            SingletonHelper.close(rs);
	            SingletonHelper.close(pstmt);
	         }
	       return row;
		}
		
		
	//4. 데이터 수정 
	public int updateMemo(Memo memo) {
		//Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int row = 0;//? parameter 값들만 전달
	      
        try {
           //conn = SingletonHelper.getConnection("oracle");
           String sql="update memo set email=?, content=? where id=?";
           pstmt = conn.prepareStatement(sql);
           
           pstmt.setString(1, memo.getId());
	       pstmt.setString(2, memo.getEmail());
	       pstmt.setString(3, memo.getContent());
           
           row = pstmt.executeUpdate();
            
         }catch (Exception e) {
            
         }finally {
            SingletonHelper.close(rs);
            SingletonHelper.close(pstmt);
         }
       return row;
	}
	
	
	//5. 데이터 삭제 
		public int deleteMemo(String id) {
			//Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			int row = 0;//? parameter 값들만 전달
		      
	        try {
	           //conn = SingletonHelper.getConnection("oracle");
	           String sql="delete from memo where id=?";
	           pstmt = conn.prepareStatement(sql);
	           
		       pstmt.setString(1, id);
	           
	           row = pstmt.executeUpdate();
	            
	         }catch (Exception e) {
	            
	         }finally {
	            SingletonHelper.close(rs);
	            SingletonHelper.close(pstmt);
	         }
	       return row;
		}
		
		//ID 유무 함수
		public String isCheckById(String id) {
		
			String ismemoid=null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql="select id from memo where id=?";

			try {
				  pstmt = conn.prepareStatement(sql);
				  pstmt.setString(1, id);
				  		
				  rs = pstmt.executeQuery();
				  if(rs.next()) {
					  //같은 ID 존재
					  ismemoid = "false";
				  }else {
					  //사용가능한 ID
					  ismemoid = "true";
				  }
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}finally {
				SingletonHelper.close(rs);
				SingletonHelper.close(pstmt);
			}
			
			return ismemoid;
			
		}
	
	
}
