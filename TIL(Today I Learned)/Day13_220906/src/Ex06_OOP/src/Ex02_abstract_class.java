/*
게임 : 유닛(unit)

unit : 공통기능(이동좌표, 이동, 멈춤) : 추상화, 일반화
unit : 이동방법은 다르다 (이동방법은 unit 마다 별도의 구현 강제)
		ex) 탱크는 천천히, 저글링은 뛰어간다, 마린은 걸어간다
abstract class Unit{ abstract void move(); }

 */

abstract class Unit {
	int x, y;

	void stop() {
		System.out.println("Unit Stop");
	}

	// 이동 (서로 다르게) 강제구현 .... 다름을 구현해야한다
	abstract void move(int x, int y); // 실행블럭(x) >> 추상함수
}

//tank
class Tank extends Unit {
	int x,y;
	
	@Override
	void move(int x, int y) {
		this.x = x;
		this.y = y;
		System.out.println("Tank 소리내며 이동: " + this.x + "," + this.y);
	}

	// 필요하다면 Tank만의 구체화 특수화 내용을 구현
	void changeMode() {
		System.out.println("탱크모드 변환");
	}
}

class DropShip extends Unit {

	@Override
	void move(int x, int y) {
		this.x = x;
		this.y = y;
		System.out.println("DropShip 하늘로 이동: " + this.x + "," + this.y);

	}

	void load() {
		System.out.println("Unit load");
	}

	void unload() {
		System.out.println("Unit Unload");
	}
}

class Marine extends Unit{
	@Override
	void move(int x, int y) {
		this.x = x;
		this.y = y;
		System.out.println("Marine 이동: " + this.x + "," + this.y);
		
	}
	void stemapack() {
		System.out.println("스팀팩기능");
	}
	
}

public class Ex02_abstract_class {
	public static void main(String[] args) {
		Tank tank = new Tank();

		
		if(tank instanceof Unit) 		//java, javascript (typeof)
			System.out.println("true");	// 결과
		else
			System.out.println("false");
		
	
		//1. 탱크 3대를 만들고 같은 좌표(600,800) 로 이동 시키세요 (같은 타입)
		Tank[] tanklist = {new Tank(), new Tank(), new Tank()};
		for(Tank t : tanklist) {
			t.move(600, 800);
		}
		
		//2. 여러개의 유닛(Tank 1대, 마린 1명, 드랍쉽 1대)를 생성하고 같은 좌표로 이동 (666,444)
		Unit[] unitlist = {new DropShip(), new Marine(), new Tank()};
		for(Unit u : unitlist) {
			u.move(666, 444);
		}
		
	}
	
	
}
