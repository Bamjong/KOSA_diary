
public class Ex02_Exception {
	public static void main(String[] args) {
		
		System.out.println("main start");
		int num = 100;
		int result = 0;
		
		//원인 분석(코드 끝까지)
		try {
			
			for (int i = 0; i < 10; i++) {
				result = num / (int)(Math.random() * 10); //0~9
				System.out.println("result: " + result + " i: " + i);
			}
			
		} catch (ArithmeticException e) { //문제가 발생되면 발생객체의 주소를 받아서 원인 분석 ....
			System.out.println("문제가 발생 관리자에게 문제원인 메일 발송");
			System.out.println("원인: " +e.getMessage());
			
			//catch (Exeption e) 보다는 구체적인 객체 명시하는 가독성을 좋게한다
		}
		
		for (int i = 0; i < 10; i++) {
			result = num / (int)(Math.random() * 10); //0~9
			System.out.println("result: " + result + " i: " + i);
		}
		
		System.out.println("main end");
	}
}
