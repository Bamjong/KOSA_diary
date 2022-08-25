# 2022년 8월 25일 목요일
<br>


### 1. class설계도 개념과 작성방법 (*03_Person.java)
---
    member field >> instance variable >> 객체변수
	 1. instance variable 초기화를 하지 않아도 된다 >> why >> default 값
	 초기화 : 변수가 처음으로 값을 할당 받는 것
	 질문 : 저 name member field 초기화 하고 싶은데요 가능?  >> 가능합니다! but... 굳이?
	 필요하다면 🥕(당근) 으로 초기화 가능 : public int age = 100
    
---
     Today's point : why 초기화 ...

        *********	생성되는 객체(사람) 마다, [다른 이름을 가질수 있다]	*********
        
        Person member field	당신이 사람을 만들때 마다 다른 값을 가지게 할 것인데 굳이 초기화 시켜야 할것이냐



```java
//Person.java 파일
package kr.or.kosa;

public class Person {
	public String name;	// default (자동) null
	public int age;	//	default (자동) 0
	public boolean power;	//	default	(자동)	false

    	public void personPrint() {
		System.out.printf("이름은 %s 나이는 %d 파워는 %s",name,age,power);
	}
}
```
```java
//Ex01_Ref_Type.java 파일
import kr.or.kosa.Person;

public class Ex01_Ref_Type {

	public static void main(String[] args) {
		//kr.or.kosa 안에 있는 Person 설계도를 가지고 구체화
		Person man = new Person();
		System.out.println(man.name);
		System.out.println(man.age);
		System.out.println(man.power);
		
		Person man2 = new Person();
		man2.name = "아무개";
		man2.age = 100;
		man2.power = true;
		man2.personPrint();
	}
}

```

### 2. 자바 void,return 타입, Parameter (*03_Fclass.java 16L)
---
    JAVA) 
    1. void, parameter(0): void print(String str){실행코드}
    2. void, parameter(x): void print(){실행코드} >> 공짜
    3. return type , parameter(0) : int print(int data){return 100;} 
    4. return type , parameter(x) : int print(){return 100;}

    *** void > 돌려주는 것이 없어요 > return type 없어요
    return type >> 기본 8가지 + String + Array, class, collection, interface
    이 중에서 기본 8가지 + String + class 인정 ....
    
    boolean print (return true)
    
    Car print(){Car c = new Car(); return c;}
    //나는 당신에게 Car 객체의 주소를 return 하는것
    
    String print(){return "A";}

    parameter type >> void print(String 파라메터) >> 기본 8가지 + String + Array, class, collection, interface 
 
    void print(int i){}
    void print(String Str){}
    void print(Car car){}
    
    print(c); // print 함수 호출시 c라는 변수값(주소값)
    
    어려워요 ... 동전 구멍이 여러개 ...
    ------------------------------------------
    void print (int a, int b, int c, int d){}
    
    print(10, 20) //실행 x
    print(100,100,100) //실행 x
    print(100,100,100,200) //실행 o
    ------------------------------------------
    void print(Car c, String str, int i){}
    각 파라미터 외의 값이 들어가면 실행 x


### 3. 관용적인 표현(*03_Fclass.java 54L)
---
    코드 규칙 : 관용적
    class 이름의 첫글자는 대문자 : class Car, class Person
    method의 이름은 단어의 첫글자 소문자 이어지는 단어의 첫글자는 대문자 ..: getNumber()
    
    사원번호를 가지고 사원의 모든정보를 가지고 와라 (함수 생성)
    ex) getEmpListByEmpno()  // get Emp List By Empno 가지고온다 사원의 리스트를 사원번호를 가지고
    
    함수의 이름으로 대략적이 내용 파악 가능하도록!

### 4. Call 함수(*03_Ex02_Method_Call, 03_Fclass.java)
---
    void m() >> 컴파일러가 >> default void m() >> 같은 폴더 내에서
	함수 70% public
	함수 30% private  why? : hint) public, private 클래스 내부 동등 ...
	클래스 내부에서 만 사용해라 >> 이런 함수 >> 공통함수 >> 다른 함수를 도와주는 함수

    
	함수의 접근자
	default int subSum(){} 같은 폴더 ...
	private int subSum(){} 같은 폴더도 안돼요
	클래스 내부에서 다른 함수를 도와주는 공통함수 ...
	private 함수 만들어서 사용

#### main 함수!
```java
import kr.or.kosa.Fclass;

public class Ex02_Method_Call {
	public static void main(String[] args) {
		//Fclass 생성 ... 메모리에 올려야 한다 ... 객체 생성
		Fclass fclass = new Fclass();
		fclass.m(); // 호출했다 그의 이름을 불러 주었어요 call
		fclass.m2(100);
		int result = fclass.m3();
		System.out.println("m3 함수 호출시 돌려받은 값: " + result);
		
		int result2 = fclass.m4(555);
		System.out.println("m4 함수 호출시 돌려받은 값: " + result2);
		
		result2 = fclass.sum(100, 200, 300);
		System.out.println("sum 함수 호출시 돌려받은 값: " + result2);
		
		fclass.callSubSum();
		
		
		
		result2 = fclass.opSum(1111);
		System.out.println("opSum 함수 호출시 돌려받은 값: " + result2);
		
		result2 = fclass.max(100, 50);
		System.out.println("max 함수 호출시 돌려받은 값: " + result2);
	} 
}
```

#### Class 함수!
```java
public class Fclass {
	public int data;
	
	public void m() { //void, parameter(x)
		//기능 구현
		//main 함수에서 사용했던 코드를 그대로 구현
		System.out.println("일반함수 : void, parameter(x)");
	}
	
	//void m2(int)
	public void m2(int i) {
		System.out.println("일반함수 : void, parameter(0)");
		System.out.println("parameter 값은 활용	i변수 함수 내부 : " + i);
	}
	
	//
	public int m3() {
		//무조건, 강제로 ,,,
		return 1000; //return type이 존재하면 반드시 return 키워드 명시 필수
	}
	
	public int m4(int data) {
		return 100 + data;
	}
	//요거까진 기본 4가지
	
	//확장..
	//return type(0), parameter(0) 단지 개수 ....
	public int sum(int i, int j, int k) {
		return i + j + k;
	}
	
	////////////////////////////////////////////////
	
	private int subSum(int i) { //다른 함수가 호출해서 사용...
		return i + 100;			//로직이 모든 함수가 가지고 있다면... 변경이 쉬움 >> 유지보수!
	}
	
	public void callSubSum() {
		//함수는 다른 함수를 호출할 수 있다.\
		int result = subSum(100);
		System.out.println("call result : " + result);
    }

    //private 이용하기
	private int operationMethod (int data) {
		return data * 200;
	}
	
	public int opSum(int data) {
		int result = operationMethod(data);
		//제어문
		if (result > 0) {
			return 1;
		} else {
			return -1;
		}
	}


     /*
	 a 와 b 둘중에 큰값을 return 하는 함수를 만드세요
	 */
	
	public int max(int a, int b) {
		return (a>b) ? a : b;
	}

}
```

### 4. 설계도 작성(*03_Ex03_Method_call.java, 03_Tv.java)
---   
    Tv 설계도 요구사항정의
    
    Tv는 채널 정보를 가지고 있다 (예를들면 1~200 값을 가질 수 있다)   //public
    Tv는 브랜드 이름을 가지고 있다 (예를들면 엘지, 삼성 --- 등등등)    //public
    Tv는 채널 전환기능을 가지고 있다 (채널은 한 채널씩 이동이 가능하다
    ->채널을 증가 감소 시키는 기능을 가지고 있다.
    
    Tv의 채널정보와 브랜드이름을 볼 수있는 기능을 가지고 있다

#### Main 함수!
```java
import kr.or.kosa.Tv;
public class Ex03_Method_Call {
	public static void main(String[] args) {
		Tv lgtv = new Tv();
		lgtv.brandname = "LG";
		
		lgtv.tvInfo();
			lgtv.ch_Up();	
			lgtv.ch_Up();
			lgtv.ch_Up();
		lgtv.tvInfo();
			lgtv.ch_Down();
			lgtv.ch_Down();
		lgtv.tvInfo();
			
		Tv sstv = new Tv();
		sstv.brandname = "SAMSUNG";
		sstv.tvInfo();
			sstv.ch_Up();
	}
}

```

#### Class 함수!
```java
package kr.or.kosa;
import java.util.Scanner;
public class Tv {
	
	public int ch = 1;
	public String brandname;
	
	public void ch_Up() {
		ch++;
	}
	public void ch_Down(){
		ch--;
	}
	public void tvInfo() {
		System.out.printf("[%s] , [%d] \n",brandname,ch);
	}
}
```

### 5. 캡슐화(*03_Ex04_Modifier.java, NoteBook.java)
---
    객체지향언어 (캡슐화, 은닉화 : 직접적으로 값을 변경하고 쓰는 것 방지)
	 ex) year 마이너스 값을 넣지마!! ...
	 	 but 졸고있던 개발자 말을 안듣고 넣으면 프로그램 터짐
	 	 
	 그러므로 
	 	설계자 >> 다 막아버릴거야 >> 사용불가 >> 간접적으로 사용가능 >> 누군가 통해서 read,write(getter / setter)

#### 캡슐화란?
    직접할당을 막고 간접할당을 통해 제어하는것

#### getter / setter
    약속 캡슐화 (read, write 함수) >> 표준화 >> getYear... , setYear >> getter // setter

    
#### Main 함수!
```java
import kr.or.kosa.*;

public class Ex04_Modifier {

	public static void main(String[] args) {

		NoteBook notebook = new NoteBook();
		notebook.writeYear(2022);  // 마이너스값은 못넣어요!  마이너스면 1999 할당
		int year = notebook.readYear();
		System.out.println("year: " + year);
	}
}
```
#### Class 함수!
```java
package kr.or.kosa;

public class NoteBook {
	public String color;
	private int year;
	
	public void writeYear(int data) { // 음수가 들어오면 새로 세팅해서 줌 (간접할당의 장점)
		if(data < 0) {
			year = 1999;
		} else {
			year = data;
		}
	}
	public int readYear() { //간접적으로 year라고 하는 member field 값을 return 하는 함수
		return year;
	}
}

```

### 6. 클래스(*03_Ex04_Modifier.java, NoteBook.java, Mouse.java)
---

#### Main 함수!
```java
import kr.or.kosa.Mouse;
import kr.or.kosa.NoteBook;

public class Ex04_Modifier {

	public static void main(String[] args) {

		NoteBook notebook = new NoteBook();
		notebook.writeYear(2022);  // 마이너스값은 못넣어요!  마이너스면 1999 할당
		int year = notebook.readYear();
		System.out.println("year: " + year);
		
		
		//notebook.number = -100;
//		notebook.mouse.x = 5;
//		notebook.mouse.y = 4;
		
		Mouse mouse = new Mouse(); //마우스가 메모리에 heap
		System.out.println(mouse.x + ": " + mouse.y);
		
		notebook.handle(mouse);
		System.out.println(mouse.x + ": " + mouse.y);
	}
}

```

#### Class 함수! - NoteBook
```java
package kr.or.kosa;

public class NoteBook {
	public Mouse mouse = new Mouse();
	
	public int number;
	
	//노트북 필요에 따라서 마우스를 가질 수 있다
	//가진다 의미 : 생성된 객체의 주소를 가진다
	public void handle(Mouse m) {
		//
		m.x = 100;
		m.y = 200;
	}
}

```

#### Class 함수! - Mouse
```java
package kr.or.kosa;

public class Mouse {
		//마우스는 한 점을 표현할 수 있다.
	public int x;
	public int y;
	// 한점 표현하기 위해
}

```

### 7. JAVA 메모리 구조
---

메소드(Method) 영역
---
	Static 영역이라고도 하며 전역 변수와 정적 멤버변수(static 변수)가 저장되는 영역입니다.

스택(Stack) 영역
---
	지역변수, 인자값, 리턴값이 저장되는 영역이고 메소드 안에서 사용되는 기본형 변수들이 값과 함께 저장되고 Heap 영역에 생성된 객체들을 참조하는 주소값이 할당됩니다.

힙(Heap) 영역
---
	자바 프로그램에서 사용되는 모든 인스턴스 변수(객체)들이 저장되는 영역이며 자바에서는 new를 사용하여 객체를 생성하면 힙 영역에 저장됩니다. 힙 영역은 메모리 공간이 동적으로 할당되고 해제되며 메모리의 낮은 주소에서부터 높은 주소로 할당이 이루어집니다.

![이미지](https://i.postimg.cc/mZ031GYZ/20220825-154800.jpg)

![자바메모리](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fc0vhJq%2FbtrvvCXk7Ha%2FIkn2rkKKyey9OV0WlQcg90%2Fimg.png)