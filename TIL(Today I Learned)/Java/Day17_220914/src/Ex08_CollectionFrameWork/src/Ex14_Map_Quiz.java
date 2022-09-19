import java.util.HashMap;
import java.util.Scanner;

public class Ex14_Map_Quiz {
	public static void main(String[] args) {
		/*
		 Map ㅅ용 구현하는 데이터 집합
		 지역번호, 우편번호, 회원가입(id,pwd) 정보
		 
		 */
		
		HashMap loginmap = new HashMap();
		loginmap.put("kim", "kim1004");
		loginmap.put("scott", "tiger");
		loginmap.put("lee", "kim1004");
		
		/*
		 우리 시스템은 회원가입한 회원의 id, pwd 정보를 가지고 있다
		 로그인시 아이디와 비번을 확인해서 회원이라면 사이트 접속 가능
		 
		 id(o), pwd(o) >> 회원님 ㅎㅇㅎㅇ			1	회원님 방가방가 출력후 while 탈출
		 id(o), pwd(x) >> 비밀번호 입력 추가...		2	아이디, 비밀번호 확인해 주세요 입력받게...
		 
		 id(x), pwd(o) >> 회원가입으로 유도			3	id 재입력 하세요 출력	아이디, 비밀번호 입력
		 id(x), pwd(x) >> 회원가입으로 유도
		 
		 3가지 논리를 if문으로 제어
		 */
		
		Scanner sc = new Scanner(System.in);
		while(true) {
			//id 와 pwd 받으세요
			//id는 공백을 제거하고 소문자로 변환시키세요 (String 함수사용)
			String id = sc.next().trim().toLowerCase();
			String pwd = sc.next().trim();
			
			boolean T_id = false;
			boolean T_pwd = false;
			
			
			T_id = loginmap.containsKey(id);
			T_pwd = loginmap.containsValue(pwd);
			
			if((T_id == true) && (T_pwd == true)) {
				System.out.println("회원님 방가방가");
				break;
			} else if((T_id == true) && (T_pwd == false)) {
				System.out.println("아이디, 비밀번호 확인해 주세요");
			} else {
				System.out.println("id 재입력 하세요");
			}
			
			
			
		}
	}
}
