# 2022년 8월 25일 목요일
<br>


### 1. class설계도 개념과 작성방법 (*03_Ex01_Ref_Type)
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