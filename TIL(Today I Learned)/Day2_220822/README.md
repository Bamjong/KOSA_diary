# 2022년 8월 22일 월요일
<br>

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
<br>

### 2. 변수가 선언되는 위치 (scope : 유효범위)
---
    1. instance variable : 객체변수		 >> class Car { int number = 2000;}
    2. local variable	 : 지역변수(함수안에) >> class Car { public void run() { int speed = 0; }}
    3. 함수안에 제어블럭(if, for) 안에 있는 변수	 >> class Car { public void run() { for(int i = 0....}}
    4. static variable	 : 공유자원(객체간)	 >> class Car { public static num = 100;)

    class 설계도이다 == class Type이다 (여러개의 의미있는 작은 타입을 가지는 큰 타입) : 사용자 정의 타입

    자바는 하나의 물리적인 파일안에 여러개의 클래스를 사용가능 ... (연습용으로)
    실 개발할때는 .... 하나의 파일에 하나의 클래스 사용 일반적

<br>

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
<br>

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
</br>


### 4. 자바의 기본타입(*Ex04_DataType)
---

```java
/*
1. 자바가 제공하는 기본 타입(시스템 타입 : 원시타입) >> 8가지
2. 8가지 기본 타입 [값을 저장] 하는 타입
3. 숫자 > 정수 >(음의정수, 0 , 양의 정수) byte (8bit)
    char 한문자를 표현하는 자료형 (영문자, 특수문자, 공백) 1byte (한글 1자 > 2byte)
    short (c언어 호환성)
    int (-21 ~ +21억 정수 : 4byte
    long (8byte)

   숫자 > 실수(부동소수점) >	 float double
   
   논리 > 참, 거짓 > true,false	boolean
   
   
   String name = "홍길동 바보"; >> String 클래스이다 (참조 타입) String str = new String();
   
   기본타입 8가지 + String >> 9가지를 가지고 데이터 표현
   
   
   자바타입
   1. 값타입 : 8가지 기본 > int i = 100; int j = 200;...					value type
   2. 참조타입(주소값) : 클래스, 배열 : 변수에 값이 저장되는 것이 아니라 주소값이 저장 ref type

 */


// class == 설계도 == Data Type
class Car2{	//Car2는 데이터 타입, Car2는 설계도 이다 >> 구체화 >> 메모리에 올리는 작업 필요 >> new
	String color;
	int window;
}


public class Ex04_DataType {

	public static void main(String[] args) {
		String str = "홍길동"; //문자열 데이터를 담을 수 있는 타입
		int age = 100;
		
		Car2 c; // c는 main함수 안에 있는 지역변수
		//System.out.println(c); // 지역변수 초기화 실행 불가능
		//c라는 변수의 초기화는 >> 주소값을 가지게 함
		c = new Car2();
		System.out.println("c의 주소값 출력 : " + c);
		Car2 c2 = new Car2();
		c2.window = 100;
		c2.color = "gold";
		
		System.out.println(c2.window + " " + c2.color);

        /////////////////////////////////////////////////////////////////////////////////////

        int i = 10; // **
		
		int j ;
		j = 20;
		
		int k;
		k = j; //POINT (값할당 j변수가 가지는 값을 k에게 할당)
		System.out.println("k: " + k); // 20
		k= 300;
		System.out.println("k: "+ k);
		System.out.println("j값은 변화 없다: " + j);
		
		// int p , q , g; //좋아하지 않아요
		// 이런 경우는 Array : int[] arr = new int[3];
		
		// int (-21억 ~ 21억)
		int p = 100000000;
		//int p2 = 10000000000;
		//p2가 정수(int) .... 당근 안되겠지 예상 ...
		//The literal 10000000000 of type int is out of range
		//개발자가 직접 입력한 값 (있는 그대로) 정수값은 int 그릇에 담아서 처리
		//나는 4byte로 너의 값을 담고있는데 니가 큰 값을 입력하면 나는 담을 수 없어 ...
		
		//1. 해결방법
		long l = 10000000000l; // 리터값을 long 담아서 할당
		long l2 = 100; // 100 리너탁ㅄ은 int 그릇안에
		//작은 타입값을 큰 타입에 넣는 것은 문제가 안된다...

		//int p2 = 10000000000;
		int p2 = (int) 10000000000l; // 캐스팅 >> 타입변환
		System.out.println(p2);  // 1410065408
		//정상적인 해결 방법이 아니다 ... 버려지는 값 (쓰레기 값)
		
		int p3 = (int)1000l; //캐스팅을 통해서 타입 일치
		System.out.println(p3);
		
		// char 2byte 정수값
		// 한 문자를 표현하기 위해서 만든 자료형
		// 영문자, 특수문자, 공백, 한글, 한문자 ... 표준화 ...
		// 문자열 (문자의 집합) : "홍길동"				String name = "홍길동";
		// 문자	 (한문자)		: 'A', '홍';				char ch = '홍';
		
		char single = '가';
		System.out.println(single);
		// char s = 'AB'; 예외 컴파일도 안돼요

        /////////////////////////////////////////////////////////////////////////////////////////
        
		//char 정수 타입
		//char 문자를 저장하지만 내부적으로 정수값을 가지고 있다
		//정수값은 아스키 코드표를 기반으로 하고 있다
		//정수 호환 ...
		int intch = 'A'; //int intch= (int)'A';
		//내부적으로 자동 형 변환이 일어나서 ..... 암시적 (묵시적)
		System.out.println("intch : " + intch);

		char ch2 = 'a';
		System.out.println(ch2);
		int intch2 = (char) ch2; //내부적으로 처리 되지만... casting직접 처리
		System.out.println(intch2);
		
		int intch3 = 65;
		char ch3 = (char)intch3;
		System.out.println(ch3);
		
		//속지말자 (할당에 있으서 값을 보지말고 그 값을 담고 있는 Type을 보자)
		//명시적 형변환 , 암시적 형 변환
		//강제, 명시적 형변환
		//key point : 형변환시 손실 데이터 고민
		// 위에서 했던 것처럼.....
		//큰 것을 작은 강제 형변환 (데이터 손실)


        /*
		 1. 할당에서 변수가 가지고 있는 값을 보지말고 변수의 타입을 보자
		 2. 변수의 타입 크기를 확인하자
		 3. 큰타입에는 작은 타입의 값을 넣을 수 있다
		 4. 작은 타입에는 큰 타입을 넣고 싶다면 강제로 (casting) 책임은 여러분이...
		 */

        //////////////////////////////////////////////////////////////////////////////////////
		
		//TIP) java 에서 특수 문자 처리
		//이스케이프 문자 : 특정 문자 앞에 \를 붙히면 
		char sing = '\'';
		
		//Quiz : 홍"길"동 이라는 문자열을 표현하고 싶어요
		String name3 = "홍\"길\"동";
		
		System.out.println(name3);
		
		String str3 = "1000";
		String str4 = "10";
		String result = str3 + str4; // 100010
		System.out.println(result);

        //Quiz C:\Temp 문자열을 String 변수에 담아서 화면에 출력하세요
		String path = "C:\\Temp";
		System.out.println(path);
		
		
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		
		//실수형 (부동소수점)
		//float 4byte
		//double 8byte // 실수 리터럴은 기본 타입 double
		
		double f = 3.14; //

		float f2 = 1.123456789f; //float 타입에 담고 싶다면 무조건 접미사 F, f
		//대략적으로 7자리 소수 표현
		//반올림 default
		System.out.println("f2 : " + f2);
		//f2 : 1.12345678
		
		double d = 1.123456789123456789;
		//대략 16자리 소수 표현
		//반올림 default
		System.out.println("d : " + d);
		//d : 1.1234567891234568
		
		System.out.println((byte)128); //128 byte 표현이 안돼요
		//byte 타입 : -128 ~ 127 //overflow 순환
		
		byte q = (byte)129;
		System.out.println(q);
		
		//정수와 실수
		double d2 = 100;
		System.out.println(d2); //100.0
		
		//Quiz
		double d3 = 100;
		int i5 = 100;
		int result2 = (int)(d3 + i5); // 데이터 손시을 가져 올 수도 있다.
		double result3 = d3 + i5; //데이터의 손실을 가져오지 않는다.
		
		System.out.println(result2);
		System.out.println(result3);
		//Today point
		//1. 큰타입 + 작은 타입 >> 큰타입
		//2. 타입간 변환 >> 변수가 가지는 값을 보지 말고 변수의 타입을 보고 판단하자
		//3. 명시적 형 변환시 손실데이터 고민
		
		int i6 = 10;;
		byte b2 = (byte)i6; //강제적 형변환
		
		byte b3 = 20;
		int i7 = b3; //컴파일러가 내부적으로 자동 형변환 int i7 = (int)b3;
		
	}
    

}
```
<br>

![이미지](https://dthumb-phinf.pstatic.net/?src=%22https%3A%2F%2Fdthumb-phinf.pstatic.net%2F%3Fsrc%3D%2522http%253A%252F%252Fcafeptthumb3.phinf.naver.net%252F20150730_13%252Fi7027_1438213266712fjGBw_PNG%252F%2525C0%2525DA%2525B7%2525E1%2525C7%2525FC.PNG%253Ftype%253Dw740%2522%26amp%3Btype%3Dcafe_wa740%22&type=cafe_wa800)


![아스키코드표](https://t1.daumcdn.net/cfile/tistory/216CE84C52694FF020)