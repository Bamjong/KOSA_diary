/*
static member field : 객체간 공유자원 ...
static method : why : 첫날 첫시간 했던 코드 ....
1. 객체 생성 없이 사용할 수 있다.
2. 많이 사용해요
3. 설계도를 만들 때 고려해야해요 (당신이 그 자원(기능) 을 많이 사용 한다면)
4. 자원 많이 쓰네 ... 편하게 쓰게 해줄게 ... new 객체 ... 불편하지 ...
*/

class StaticClass{
	int iv;
	
	static int cv;
	
	void m() {
		//일반함수
		//new heap > 사용
		//1. iv 제어가능
		cv = 100;
		//why: 생성시점 (static 자원은 객체생성 이전에 memory 로드)
	}
	
	static void print() {
		//static 함수
		//1. cv 제어가능
		//2. 일반변수 iv 제어 가능 할까, 안될까
		//iv = 1000; 생성지점 ( static 자원은 일반 자원보다 우선한다)
		
		//결과 : static 자원만 가지고 놀아요
		cv = 100000;
	}
}

public class Ex10_Static_Method {
	public static void main(String[] args) {
		StaticClass.print();
		System.out.println(StaticClass.cv);
		
		//일반자원(객체 생성)
		StaticClass sc = new StaticClass();
		sc.m();
		sc.print();
	}
}
