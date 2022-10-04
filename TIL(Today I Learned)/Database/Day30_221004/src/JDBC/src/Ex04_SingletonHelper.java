import java.sql.Connection;
import java.sql.SQLException;

import kr.or.kosa.SingletonHelper;

public class Ex04_SingletonHelper {

	public static void main(String[] args) throws Exception {
		//Singleton 사용시 
		//하나의 객체를 사용하겠다 ....
		//하나의 객체를 공유해서 사용하겠다
		
		//single 객체는 공유자원이기에 APP 이 종료될때까지 Close() 하지 않는 것 원칙
		
		
		Connection conn = null;
		conn = SingletonHelper.getConnection("oracle");
		System.out.println(conn.toString());
		System.out.println(conn.getMetaData().getDatabaseProductName());
		System.out.println(conn.getMetaData().getDatabaseProductVersion());
		System.out.println(conn.isClosed());
		
		Connection conn2 = null;
		conn2 = SingletonHelper.getConnection("oracle");
		System.out.println(conn2.toString());
		System.out.println(conn2.getMetaData().getDatabaseProductName());
		System.out.println(conn2.getMetaData().getDatabaseProductVersion());
		System.out.println(conn2.isClosed());

	}

}