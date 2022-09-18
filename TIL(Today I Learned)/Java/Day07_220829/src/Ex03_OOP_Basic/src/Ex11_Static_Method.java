
public class Ex11_Static_Method {
	
	public void method() { //heap 메모리에 로드 되고 나서 사용 
		System.out.println("나 일반함수야");
	}
	
	public static void smethod() {
		System.out.println("나 static 함수야!");
	}
	
	
	public static void main(String[] args) {
		//안에서 smethod를 바로 사용할 수 있다? 없다?  >> static으로 하였으니 바로사용가능
		smethod();
		
		Ex11_Static_Method ex_11 = new Ex11_Static_Method();
		//ex11 참조변수 (주소를 가지고 변수) 는 static 접근, 일반 접근 가능
	}

}
