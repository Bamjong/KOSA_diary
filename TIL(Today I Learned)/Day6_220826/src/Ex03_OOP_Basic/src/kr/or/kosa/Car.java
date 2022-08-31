package kr.or.kosa;

/*
 실무코드의 특징
 
 1. 캡슐화 (member field)
 2.	캡슐화 (간접적으로 처리 : setter/getter)
 3. 이런 데이터를 담을 수 있는 클래스 (VO, DTO, DOMAIN)
 */

public class Car {
	private int window;
	private int speed;
	
	//필요에 따라서 (setter 만)			>> write
	//필요에 따라서 (getter 만)			>> read
	//필요에 따라서 (setter, getter 만)	>> write, read
	
	//일단은 굳이 따로 하지말고 그냥 둘다 쓰세요!
	
	public int getWindow() { //getter 함수
		return window;
	}
	
	public void setWindow(int data) { //setWindow(int window) {this...}
		window = data;
	}
	
	
	
	//1. IDE 사용
	public int getSpeed() {
		return speed;
	}

	public void setSpeed(int speed) {
		this.speed = speed;
	}
	
	/*
	 2. Lombok
	 Java 라이브러리로 반복되는 getter, setter, toString ..
	 등의 반복 메서드 작성 코드를 줄여주는 코드 다이어트 라이브러리 이다.
	 https://cheershennah.tistory.com/183
	 
	 @Getter
 	 @Setter
 	 컴파일러에게 자동으로 setter , getter 만들어 주세요...
	*/
	 
	 
	//필요하다면 별도의 함수를 생성
	//speed를 10식 올리거나 감소하는 기능을 만드세요
	//일반적으로 아래처럼 별도의 함수를 만들기 보다는 read, write 만 한다면
	//getter , setter 통해서 제어하는 것이 일반적이다
	
	public void speedUp() {
		speed += 10;
	}
	
	public void speedDown() {
		//조건 ...
		if (speed > 0) {
			speed -= 10;
		} else {
			speed = 0;
		}
	
	}
	
}
