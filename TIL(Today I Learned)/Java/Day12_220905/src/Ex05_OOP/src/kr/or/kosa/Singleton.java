package kr.or.kosa;
/*
디자인 패턴(생성 패턴) >> new

싱글톤... (객체 하나를 만들어 공유)
의도 : 하나의 객체를 공유하는 보장 코드...

ex) 공유IP, 공유프린터 설계할때...


*/



public class Singleton {
	private static Singleton p;  //p라는 변수가 주소를 가지게 ... new
	private Singleton() {
		//생성자에서 접근자 private .. 생성사 함수 호출 못하니 객체 생성 불가 new ...
		
	}
	public static Singleton getInstance() {
		if (p == null) {
			p = new Singleton(); //같은 클래스 내부에서는 public, private 보여요 
		}
		return p;
	}
		
}
