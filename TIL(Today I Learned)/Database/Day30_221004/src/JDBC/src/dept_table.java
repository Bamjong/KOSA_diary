import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

import kr.or.kosa.SingletonHelper;

public class dept_table {
	static Scanner sc = new Scanner(System.in);
	
	public static void main(String[] args) {
		sql_show();
		sql_find();
		
	}
	
	public static void sql_show(){
		
		Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      
	      
	       try {
	           conn = SingletonHelper.getConnection("oracle");
	           String sql="select * from sdept";
	           pstmt = conn.prepareStatement(sql);
	           rs = pstmt.executeQuery();
	            
	           if (rs.next()) { //최소 1건
	            do {
	               System.out.println(rs.getInt(1) + " / " + rs.getString(2) + " / " + rs.getString(3));
	            } while (rs.next());
	         }else { System.out.println("조회된 데이터가 없습니다."); }

	         } catch (Exception e) {
	            
	         }finally {
	            SingletonHelper.close(rs);
	            SingletonHelper.close(pstmt);
	         }
	      }

	
	public static void sql_delete(){
		
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		try {
			System.out.println("입력하세요");
			System.out.print("deptno= ");
			int a = Integer.parseInt(sc.nextLine());
		
			conn = SingletonHelper.getConnection("oracle");
			String sql="delete from sdept where deptno=?";
			pstmt = conn.prepareStatement(sql); // 미리 컴파일 시켜놓음
			
			pstmt.setInt(1,a);
	        rs = pstmt.executeQuery();
			
		} catch (Exception e) {
			
		} finally {
			SingletonHelper.close(rs);
			SingletonHelper.close(pstmt);
		}
	}
	
	
	public static void sql_insert() {
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		try {
			System.out.println("입력하세요");
			System.out.print("deptno= ");
			int a = Integer.parseInt(sc.nextLine());
			System.out.print("dname= ");
			String b = sc.nextLine();
			System.out.print("loc= ");
			String c = sc.nextLine();
			
			conn = SingletonHelper.getConnection("oracle");
			String sql="insert into sdept values(?,?,?)";
			pstmt = conn.prepareStatement(sql); // 미리 컴파일 시켜놓음
			
			pstmt.setInt(1, a);
	        pstmt.setString(2, b);
	        pstmt.setString(3, c);
	        
	        rs = pstmt.executeQuery();
	        
		} catch (Exception e) {
			
		} finally {
			SingletonHelper.close(rs);
			SingletonHelper.close(pstmt);
		}
	}
	
	public static void sql_find() {
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		try {
			System.out.println("입력하세요");
			System.out.print("deptno= ");
			int a = Integer.parseInt(sc.nextLine());
		
			conn = SingletonHelper.getConnection("oracle");
			String sql="select * from sdept where deptno=?";
			pstmt = conn.prepareStatement(sql); // 미리 컴파일 시켜놓음
			
			pstmt.setInt(1,a);
	        rs = pstmt.executeQuery();
	        
	        if (rs.next()) { //최소 1건
	            do {
	               System.out.println(rs.getInt(1) + " / " + rs.getString(2) + " / " + rs.getString(3));
	            } while (rs.next());
	         }else { System.out.println("조회된 데이터가 없습니다."); }

			
		} catch (Exception e) {
			
		} finally {
			SingletonHelper.close(rs);
			SingletonHelper.close(pstmt);
		}
	}
	
	public static void sql_update() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			System.out.println("바꿀 deptno= ");
			int d = Integer.parseInt(sc.nextLine());
			System.out.println("입력하세요");
			System.out.print("deptno= ");
			int a = Integer.parseInt(sc.nextLine());
			System.out.print("dname= ");
			String b = sc.nextLine();
			System.out.print("loc= ");
			String c = sc.nextLine();
			
			
			 conn = SingletonHelper.getConnection("oracle");
			 String sql="update sdept set deptno=?,dname=?,loc=? where deptno=?";
			 pstmt = conn.prepareStatement(sql); //미리 컴파일 ...
		
			 
			 
			 pstmt.setInt(1, a);
	         pstmt.setString(2, b);
	         pstmt.setString(3, c);
		        
			 
			 pstmt.setInt(4, d);
				
		        
	         rs = pstmt.executeQuery();
		        
		} catch (Exception e) {
			
		} finally {
			SingletonHelper.close(rs);
			SingletonHelper.close(pstmt);
		}
	}
}




/*
public class Ex01_Oracle_Connection {
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		//DB연결 -> 명령생성 -> 실행 -> 처리
		Class.forName("oracle.jdbc.OracleDriver");
		System.out.println("오라클 드라이버 로딩....");
		
		//loading 된 드라이버를 통해서 oracle연결
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","KOSA","1004");
		System.out.println(conn.isClosed() + "정상 false");

		Statement stmt = conn.createStatement(); //명령객체 얻어오기
		
		//CRUD
		String sql="select * from sdept";
		
		ResultSet rs = stmt.executeQuery(sql);// 명령 실행
		
		//rs를 통해서  DB서버 memory에 생성된 정보를 조회
		//처리(화면조회)
		//만약 중간에 DB연결 close() ... (연결지반 프로그래밍)
		while(rs.next()) {
			System.out.println(rs.getInt("deptno") + "/" + rs.getString("dname") + "/" + rs.getString("loc"));
		}
		
		stmt.close();
		rs.close();
		conn.close();
		System.out.println("DB 연결: " + conn.isClosed());
		
	}
}

*/