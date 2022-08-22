# 2022년 8월 22일 월요일
</br>

<!-- ## 혼자 공부하는 자바 기반 수업 진행
</br> -->

### 1. 클래스의 종류 (*Ex02_Variable.java)
---
    1. class Car {} >> 독자적인 실행이 불가능 >> 다른 클래스(설계도) 참조하는 클래스 >> main함수(x) >> 라이브러리
    2. class Car {public static void main(String[] args){}} >> 독자적으로 실행 가능한 클래스
    2-1. static void main(String[] args) >> main 이름을 가지는 함수 >> 프로그램 시작점, 진입점 > 실행(약속)

    Tip)

    C# 언어 >> public static void Main(String[] args) Main의 대소문자로 C#과 자바의 차이점을 알 수 있다.

    변수 : variable
    데이터(자료) 담을 수 있는 공간의 이름 (메모리)
    공간(크기) : 데이터 타입(자료형) >> 메모리의 공간은 한정되어 있다 >> 최소한의 공간 최대한 데이터
    데이터 타입 >> int i = 100

```java
public class 클래스 이름 {
	public static void main(){
		안에있는 변수를 (지역변수)
		int num = 100; // 초기화 사용
	
}
```
</br>

### 2. 변수가 선언되는 위치 (scope : 유효범위)
---
    1. instance variable : 객체변수		 >> class Car { int number = 2000;}
    2. local variable	 : 지역변수(함수안에) >> class Car { public void run() { int speed = 0; }}
    3. 함수안에 제어블럭(if, for) 안에 있는 변수	 >> class Car { public void run() { for(int i = 0....}}
    4. static variable	 : 공유자원(객체간)	 >> class Car { public static num = 100;)

    class 설계도이다 == class Type이다 (여러개의 의미있는 작은 타입을 가지는 큰 타입) : 사용자 정의 타입

    자바는 하나의 물리적인 파일안에 여러개의 클래스를 사용가능 ... (연습용으로)
    실 개발할때는 .... 하나의 파일에 하나의 클래스 사용 일반적

</br>

``` java
class Car{  //설계도를 사용하기 위해서는 구체화 ... 메모리 위에다가 만드는 행위를 통해서 (연산자 new)
	public static int hahaha = 0;
	int iv = 100;		// instance variable
	int window;			// instance variable 은 초기화를 하지 않아도 된다 (설계도의 확장성을 위함)
						// 내부적으로 기본값(default): 0 >> int window = 0 인 것이죠
	/*
	 초기화 : 변수가 처음 값을 갖는 것
	 질문 : why int window 이런 객체변수는 초기화를 하지않아도 문제가 생기지 않아요
	 자동차를 만들때 int window = 4개 창문 4개....
	 
	 Car 라는 설계도를 가지고 차를 생산 가능
	 Car 쌍용차 = new Car(); 자동차를 만드는 행위 >> 창문 0개
	 쌍용차.window = 10;
	 
	 Car 삼성차 = new Car();
	 삼성차.window = 2;
	 생산되는 자동차마다 창문의 개수를 달리 할 수 있다.
	 
	 */
	public void stop() {
		// 별도의 지역
		window = 100;
		//speed = 200;		선언시 문제점을 파악할 수 있다 .. 알아야 될 것 ...
	}
	public void start() { // 강원도
		int speed = 100; // 지역변수
	}
}
```


### 3. 자바 메모리 주소 (*Ex03_Object_Variable)
---

```java
// 아파트 설계도
class Apt{		//설계도 == 데이터 타입(작은 타입을 모아 넣은 큰 타입)
	int window;
}

// 데이터 타입 변수명 ex) int number;	>> number 라는 변수는 타입에 맞는 값을 가진다
// Apt apt;


public class Ex03_Object_Variable {

	public static void main(String[] args) {

		int number = 100;
		
		Apt apt;	// 선언 Apt 타입 apt 변수
					// apt변수는 Apt타입의 값을 가져야 하는데 주소값
					// 실제로 아파트를 메모리에 올려야 아파트가 생성되고 그 주소가 만들어짐
					// 유일한 방법 : new (연산자)
		apt = new Apt(); // heap 메모리에 아파트가 한 채 만들어지고 주소가 생성되고
						 // 생성된 주소값을 apt 변수가 가진다
		Apt apt2 = new Apt();
		
		System.out.println("apt  변수가 가지는 값은 : " + apt);
		System.out.println("apt2 변수가 가지는 값은 : " + apt2);
		// apt 변수가 가지는 값은 : Apt@75a1cd57	: 조작된 값
		// Apt + @ + 75a1cd57 >> 설계도의이름 + @ + 주소값
		
		System.out.println(apt == apt2); // 두 변수의 주소가 같아요 false
		
		Apt apt3 = apt2; //주소값을 할당
		
		System.out.println(apt3 == apt2); // 같은 집에 동거를 시작
		apt2.window = 20;
		
		System.out.println("apt3 : 창문의 수 : " + apt3.window);
		
		//값 타입과 주소타입 증명하기
		/*
		 Ex03_Object_Variable 소스파일
		 javac Ex03_Object_Variable.java >> Ex03_Object_Variable.class 실행파일
		 java Ex03_Object_Variable 엔터
		 
		 JVM 동작 >> OS >> JAVA 메모리 구성 (구획정리) >> 자원할당 (메모리) >> 프로그램 종료
		 >> 사용했던 메모리 OS에게 반환 ... end
		 이클립스 통합 개발툴 CTRL + F11

         1. main 함수안에 지역변수는 반드시 초기화 하고 사용
		 2. 약속 >> main 함수 >> 시작점 >> 영역이 제일 먼저 실행
		 */

	}

}
```