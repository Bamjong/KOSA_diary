/*
OOP특징 (여러개의 조각(클래스) 들을 조립해서 하나의 큰 제품을 만드는 행위)
1. 상속
2. 캡슐화(은닉화) >> private
3. 다형성 (상속관계에서 부모 타입이 자식타입을 주소를 가질 수 있다)

상속
java : child extends Base
C#	 : child Base

특징
1. 다중 상속은 불가 (단일상속 (계층적 상속가능))
2. 단일 상속 (계층적 상속) 가능 (여러개의 클래스 상속)
3. 다중 상속을 지원 (Interface)

상속을 왜할까?
1. 진정한 의미 : 재사용성
2. 단점 : 초기 설계 비용 (재사용성 >> 설계 >> 시간 (여러개의 설계도 분할 ... 부모, 자식 관계))

상속관계에서는
부모부터 메모리에 올라간다 ... 자식순으로

 */

//사용자(개발자)가 만드는 모든 클래스는 default > Object 클래스를 상속
//class Car extends Object 라고 해석
//Object 모든 클래스의 root(최상위) : 모든 클래스의 부모


class Car{
	
}

class GrandFather extends Object{
	public int gmoney = 5000;
	private int pmoney = 19999;
	
	public GrandFather() {
			System.out.println("Father");
	}
}

class Father extends GrandFather{
	public int fmoney = 3000;
	public Father() {
		System.out.println("Father");
	}
}

class Child extends Father{
	public int cmoney = 1000;
	public Child() {
		System.out.println("Child");
	}
	
}

public class Ex01_Inherit {
	public static void main(String[] args) {
		Child child = new Child();
		
		System.out.println(child.gmoney);
		System.out.println(child.fmoney);
		System.out.println(child.cmoney);
		
		
		
		Car car = new Car();
				
	}
}
