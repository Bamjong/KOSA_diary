/*
생성자 함수(constructor)

1. 함수(특수한 목적)
2. 목적(member field 초기화) >> static {} , {초기자 블럭}
3. 일반함수와 다른점
	3.1 함수의 이름이 고정(class 이름 동일)
	3.2 return type 없어요 (객체 생성과 동시에 호출) (return을 받을 대상이 없다)
	3.3 실행시점 >> new 객체 생성 >> heap 공간 생성 >> member field 자리 >> 자동으로 생성자 함수 호출
	3.4 return type(x) >> void >> public void(생략) 클래스 이름 >> public 클래스 이름(){}
	
4. why : 생성되는 객체마다[강제적으로] member field 값을 초기화 할 수 있다.
5. 생성자 함수(.... overloading기법 적용 가능)
6. 생성자 오버로딩을 통해서 다양한 강제사항을 구현...

********** 생성자(함수)를 쓰는 가장 중요한 목적은 강제적 초기화(member field) **********
 */

class Car {
	String carname = "포니";
	//당신이 만약 Car 설계도를 만들때...
	//컴파일러가 알아서 함수를 생성...
	//생성자 함수
	//public Car(){} 자동 생산...
	
	//개발자가 직접 구현
	
	public Car() { //자동 호출
		System.out.println("기본생성자 호출^^");
		carname = "내마음";
	}
}

class Car4{
	String carname;
	//생략되어 있다
	//눈에 안보이는 public Car4(){} 생성자 생략
}

class Car2{
	String carname; // null문자
	public Car2() {  //default constructor 초기화
		carname="포니";
	}
}

class Car3{
	String carname;
	public Car3() { // 설계자의 의도: 너 기본자동차 이름 생산,,, 자동차 이름 넣어서 생성해도 돼...
		carname="기본이름";
	}
	//overloading을 통해...
	public Car3(String name) { //오전 POINT
		carname = name;
	}
}

//자동차의 이름은 무조건 자동차가 만들어 질때 사용하게 해 ... 설계도

class Car5{
	String carname;
	
	//overloading을 통해...
	public Car5(String name) { //오전 POINT
		carname = name;
	}
}
//위 코드는 public Car5(){} 구현하지 않았어요... 구현하지 않아도 컴파일러가 자동 생성 한다면서요...
//예외적으로 .. 개발자가 overloading된 생성자를 한개라도 만든다면 컴파일러는 자동으로 default 생성자를 만들지않아요.


public class Ex15_Constructor {
	public static void main(String[] args) {
		Car car = new Car(); // new Car() 괄호가 함수의 괄호 // default constructor
		Car3 car3 = new Car3();
		System.out.println(car3.carname);
		
		Car3 car4 = new Car3("mycar");
		System.out.println(car4.carname);
	}

}
