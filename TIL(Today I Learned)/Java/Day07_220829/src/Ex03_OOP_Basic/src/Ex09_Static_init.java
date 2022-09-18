//static 변수는 객체마다 다른 값을 가지게 할거야를 목적으로 설계
//instance 변수는 객체마다 다른 값을 가지게 할거야를 목적으로 설계

class InitTest{
	static int cv = 10;
	static int cv2;
	int iv = 11;
	//위에 세놈은 default값을 가져 초기화 안해도됨
	
	{
		//초기자 블럭(member field 초기화)
		//객체가 생성되고 나서 int iv 메모리에 올라가고 나서 바로 호출됨 { 블럭 } 
		//인위적인 코드 생산가능 if(iv > 10) iv = 100;
		//초기자 블럭은 new 해야지 시작됨
		System.out.println("초기자 블럭");
		//iv = 2222;
		if(iv > 10) iv = 1000;
		
		//cv
	}
}
public class Ex09_Static_init {

	public static void main(String[] args) {
//		InitTest t = new InitTest();
//		System.out.println(t.iv);
		
		System.out.println(InitTest.cv);
		System.out.println(InitTest.cv2);
	}

}
