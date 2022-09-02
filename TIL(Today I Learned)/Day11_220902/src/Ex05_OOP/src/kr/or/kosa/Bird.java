package kr.or.kosa;

//새(공통:일반,추상) : 새는 날수 있다 , 새는 빠르다 
public class Bird {
	//공통기능
	public void fly() {
		System.out.println("flying");
	}
	
	//설계자 고민 : Bird [상속]하는 당신은 moveFast 자원에 대해서 [재정의] 했으면 좋겠어 90%
	protected void moveFast() {
		fly();
	}
}