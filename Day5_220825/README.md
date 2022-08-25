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

### 4. Call 함수(*Ex02_Method_Call 5L)
---
    
