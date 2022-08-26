# 2022년 8월 26일 금요일
<br>


### 1. getter / setter (*03_Ex05_Modifier, 03_Car.java)
---

#### 실무코드의 특징

 1. 캡슐화 (member field)
 2.	캡슐화 (간접적으로 처리 : setter/getter)
 3. 이런 데이터를 담을 수 있는 클래스 (VO, DTO, DOMAIN)

    필요에 따라서 (setter 만)			>> write
    필요에 따라서 (getter 만)			>> read
    필요에 따라서 (setter, getter 만)	>> write, read
	
    일단은 굳이 따로 하지말고 그냥 둘다 쓰세요!

    필요하다면 별도의 함수를 생성
	
	일반적으로 아래처럼 별도의 함수를 만들기 보다는 read, write 만 한다면
	getter , setter 통해서 제어하는 것이 일반적이다


#### Lombok(롬복)
---
 Lombok 이란 Java 라이브러리로 반복되는 getter, setter toString .. 등의
 반복 메서드 작성 코드를 줄여주는 코드 다이어트 라이브러리 이다.
 @Getter

 @Setter

 컴파일러에게 자동으로 setter , getter 만들어 주세요...

 [출처](https://cheershennah.tistory.com/183)

```java
import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor

public class BoardCategoryLombok {

    private String category_id;

    private String category_name;

    private Date regdate;

    private int board_cnt;

    private int seq;

}

```

### 2. 자바의 변수 (*03_Ex05_Modifier, 03_Car.java)
---

1. instance variable >> class Car {private String color;}
    >>생성되는 객체마다 다른 색상을 가질 수 있다.

2. local variable >> class Car {public void move() {int speed = 0; 반드시 초기화}}
    main 함수 >> local variable

3. block variable >> class Car {public void move() {for(int i; i<10 ...} 제어 생성...

4. static variable >> 공유자원 (객체간), 객체 생성 이전에 memory 올라가는 자원 (영역: class area, method area)

    객체를 만드는 유일한 방법 : new 메모리에 ...
    static new 없이도 메모리에 올라가요!

    Ex06_Variable_Scope 클래스 >> 구체화(메모리) >> Ex06_Variable_Scope >> new 한적이 없어요



### 3. Static 
---

#### int
    1. member field, instance variable
	
	2. iv 언제 사용가능 할까요 (메모리에 언제 올라 갈까요)
	
	 	2.1 Variable v  = new Variable(); >> heap 객체 생성 >> 객체 안에 iv 생성
 			Variable v2 = new Variable(); >> heap 객체 생성 >> 객체 안에 iv 생성
 		
	3. 목적: 데이터(정보), 자료를 담을 목적
	
		3.1 정보: 고유, 상태, 부품(class)
		- 생성되는 객체마다 다른 값을 가질 수 있다.
		- 그래서 초기화를 해서 값을 가제하지 않는다.
		- default 값을 가지고 있다 (int=0, double=0.0, char = \u0000, boolean = false, String = null, Car = null)
		- iv 변수의 생성 시점: new 라는 연산자를 통해 heap variable 이름의 객체가 만들어지고 나서 바로생성

#### static
	1.class variable (클래스 변수), 일반적으로는 static variable (객체간 공유자원)
	
	2. 목적 : 정보를 담는 것 (생성되는 모든 객체가 공유하는 자원)
		>> 생성되는 모든 객체 (heap영역에 생성된 객체들이 공유하는 자원)
		
	3. 접근방법
	
		3.1 class 이름.static변수명 >> Variable.cv >> why(객체가 생성되기 전에 ...접근)
		3.2 Variable v  = new Variable(); >> v.cv
			Variable v2 = new Variable(); >> v2.cv
				>> v.cv == v2.cv (같은 주소를 바라본다 : static 변수 주소)
    4. 생성지점
        Hello. java > javac Hello.java > Hello.class 
        > java.exe Hell 엔터 실행 > JVM > os > Memory 빌려 > 정리(영역을 나누어요)
        > class Loader System 분석 > 클래스 정보(metadata: 설명)
        > class area(method arad) 메모리에 올려요 (언제, 어떤자원, 버전...)
        > 그 클래스안에 static variable 또는 static method 있다면
        > 두 녀석을 class area(method area) 영역에 할당합니다
        > 그런데 함수의 이름 만약에 main() 이라면 정해진 규칙에 따라서 실행합니다(Stack 영역) 자원할당(실행)...
		


```java
import java.lang.reflect.Method;

class Variable{
	int iv;
	static int cv;

	void method() {
		int lv=0;
		/*
		local vaiable (함수 안에: 지역변수: 사용전에 반드시 초기화)
		생명주기) 함수가 호출되면 생성(stack 생성되었다고 함수가 끝나면 강제 return 되면 같이 소멸)
		 */
		for(int i = 0; i <= 10; i++) {
			// int i > block 변수 >> for 시작되면 생성 ... for 끝나면 소멸
		}
	}
}

public class Ex06_Variable_Scope {
	public static void main(String[] args) {
		
		Variable.cv = 100;
		Ex06_Variable_Scope ex06 = new Ex06_Variable_Scope();
		Variable v = new Variable();
		v.cv = 200;
		Variable v2 = new Variable();
		v2.cv = 1000;
	}
	
	public void method() {
		System.out.println("나 일반함수");
	}
}

```
---
    위에 있는 코드를 메모리를 그려 작성해보기

![메모리이미지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FGOzbk%2FbtrvoQ9iNTS%2FZyNZyKk0KtupwDq8V2GJ31%2Fimg.png)


### 4. 초기자블럭 (*03_Ex09_Static_init)
---
#### static
    static 변수는 객체마다 다른 값을 가지게 할거야를 목적으로 설계

#### instance
    instance 변수는 객체마다 다른 값을 가지게 할거야를 목적으로 설계
--- 
    초기자 블럭(member field 초기화)
    객체가 생성되고 나서 int iv 메모리에 올라가고 나서 바로 호출됨 { 블럭 } 
    인위적인 코드 생산가능 if(iv > 10) iv = 100;
    초기자 블럭은 new 해야지 시작됨

```java
class InitTest{
    static int cv = 10;
	static int cv2;
	int iv = 11;
	//위에 세놈은 default값을 가져 초기화 안해도됨
	
	{
		//초기자 블럭(member field 초기화)
		//객체가 생성되고 나서 int iv 메모리에 올라가고 나서 바로 호출됨 { 블럭 } 
		//인위적인 코드 생산가능 if(iv > 10) iv = 100;
        //초기자 블럭은 new 해야지 시작됨
		System.out.println("초기자 블럭");
		//iv = 2222;
		if(iv > 10) iv = 1000;
	}
}
public class Ex09_Static_init {

	public static void main(String[] args) {
		InitTest t = new InitTest();
		System.out.println(t.iv);
		

	}

}
```
##### 출력값
    초기자 블럭
    2222



### 5. 객체간 공유자원 (*03_Ex10_Static_Method)
---
    static member field : 객체간 공유자원 ...
    static method : why : 첫날 첫시간 했던 코드 ....

1. 객체 생성 없이 사용할 수 있다.
2. 많이 사용해요
3. 설계도를 만들 때 고려해야해요 (당신이 그 자원(기능) 을 많이 사용 한다면)
4. 자원 많이 쓰네 ... 편하게 쓰게 해줄게 ... new 객체 ... 불편하지 ...