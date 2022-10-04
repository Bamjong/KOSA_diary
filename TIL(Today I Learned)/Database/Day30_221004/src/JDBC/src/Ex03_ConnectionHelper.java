import java.sql.Connection;
import java.sql.SQLException;

import kr.or.kosa.ConnectionHelper;
import kr.or.kosa.SingletonHelper;

public class Ex03_ConnectionHelper {
	public static void main(String[] args) throws SQLException {
		Connection conn = null;
		conn = ConnectionHelper.getConnection("oracle");
		System.out.println(conn.toString());
		System.out.println(conn.getMetaData().getDatabaseProductName());
		System.out.println(conn.getMetaData().getDatabaseProductVersion());
		System.out.println(conn.isClosed());
		ConnectionHelper.close(conn);
		System.out.println(conn.isClosed());
		
		///////////////////////////////////////////////////////////////////////////
		//위 처럼 작업을 하면 연결할때마다 새로운 객체가 생성됩니다 ^^
		
		conn = ConnectionHelper.getConnection("oracle");
		System.out.println(conn.toString());
		
		
		//그렇다면 하나의 객체가 생성되어 공유할 수 없을 까요?
		//singleton 패턴
		///////////////////////////////////////////////////////////////////////////
		
		Connection conn123 = null;
		conn123 = SingletonHelper.getConnection("oracle");
		System.out.println(conn123);
		
		conn123 = SingletonHelper.getConnection("oracle");
		System.out.println(conn123);
		
		conn123 = SingletonHelper.getConnection("oracle");
		System.out.println(conn123);
		
		
		Connection conn2 = null;
		conn2 = ConnectionHelper.getConnection("oracle","HR","1004");
		Connection conn3 = null;
		conn3 = ConnectionHelper.getConnection("oracle");
		System.out.println(conn2.toString());
		System.out.println(conn3.toString());
		
		
	}
}
