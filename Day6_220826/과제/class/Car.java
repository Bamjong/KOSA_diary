package kr.or.kosa;

//필요하다면 별도의 함수를 생성
//speed를 10식 올리거나 감소하는 기능을 만드세요
//일반적으로 아래처럼 별도의 함수를 만들기 보다는 read, write 만 한다면
//getter , setter 통해서 제어하는 것이 일반적이다


public class Car {
	private int window;
	private int speed;
	
	public int getWindow() { //getter 함수
		return window;
	}
	
	public void setWindow(int data) { //setWindow(int window) {this...}
		window = data;
	}
	
	
	public int getSpeed() {
		return speed;
	}

	public void setSpeed(int speed) {
		this.speed = speed;
	}

	public void speedUp() {
		speed += 10;
	}
	
	public void speedDown() {
		if (speed > 0) {
			speed -= 10;
		} else {
			speed = 0;
		}
	
	}
	
}
