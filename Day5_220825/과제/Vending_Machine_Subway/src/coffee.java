import kr.or.kosa.coffeeMachine;

public class coffee {
	public static void main(String[] args) {
		coffeeMachine machine = new coffeeMachine();
		
		machine.printInfo();
		machine.shotAdd();
		machine.printInfo();
		machine.shotAdd();
		machine.shotAdd();
		machine.printInfo();
		machine.decaffein();
		machine.shotAdd();
		machine.printInfo();
		machine.shotRemove();		
		machine.printInfo();
		machine.shotRemove();		
		machine.printInfo();
		machine.shotRemove();		
		machine.printInfo();
		machine.shotRemove();

		
	}
}

/* 이름: 아메리카노 현재 가격: 1500
이름: 아메리카노 현재 가격: 1800
4샷을 초과할 수 없습니다.
이름: 아메리카노 현재 가격: 2100
4샷을 초과할 수 없습니다.
이름: 디카페인 아메리카노 현재 가격: 2400
이름: 디카페인 아메리카노 현재 가격: 2100
이름: 디카페인 아메리카노 현재 가격: 1800
이름: 디카페인 아메리카노 현재 가격: 1800
최소 1샷 입니다. */