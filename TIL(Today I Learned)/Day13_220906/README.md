# 2022년 9월 6일 화요일
<br>


## 1. 추상클래스(abstract)    (*06_Ex01_abstract_class 01~02)
---
### 추상 클래스 (미완성 클래스(설계도))

1. 완성된 코드 + 미완성 코드
2. 완성(함수) 실행블럭이 있는 함수 + 미완성(함수) 실행블럭이 없는 함수
추상코드) >> public void run(){X};
원래코드) >> public void run(){실행블럭};
3. 완성된 클래스 (new 가능) - 미완성 클래스 (스스로 객체 생성 불가)

    설계자 입장에서 >> 의도 >> 반드시 재정의 해라 >> 강제적 구현을 목적으로 (믿지 못하니까)

#### 아래 코드는 강제성이 없다.
```java
class Car{
	void run() {}	// {구문이 없어도 실행블럭만 있으면 완성된 코드}
}

class Hcar extends Car {
    //믿음
	@Override
	void run() {System.out.println("재정의");}
}

//Car 만든 사람이 run() 재정의 해서 내용을 바꾸어라
//그러나 강제가 없어요 Hcar 만드는 사람이 의무사항 아니다...
```
#### 아래 코드는 강제성이 있다.
```java
abstract class Abclass{ // 클래스 안에 최소 1개 이상의 추상함수를 가지고 있는 클래스
	int pos;
	void run() {
		pos++;
	}
	//미완성 코드 추가 (미완성 함수 : 추상함수)
	abstract void stop(); //실행블럭이 없어요 >> 재정의 강제(Override)
}

class Chiled extends Abclass{
	@Override
	void stop() { //실행블럭을 만들면 구형(강제적)
		this.pos = 0;
		System.out.println("stop: " + this.pos);
	}
}
```

    상속관계에서 부모타입의 참조변수가 자식타입객체들의 주소를 받을 수 있다 (다형성)
    단 부모는 자신의 것만 볼 수 있다.
    단 재정의가 되어있다면 자식의 자원을 본다.


## 2. 업캐스팅 // 다운캐스팅 
---
### 캐스팅 (Casting)
    캐스팅이란 타입을 변환하는 것을 말하며 형변환이라고도 한다. 자바의 상속 관계에 있는 부모와 자식 클래스 간에는 서로 간의 형변환이 가능하다.

### 업캐스팅(Upcasting)
    업캐스팅이란 자식 클래스의 객체가 부모 클래스 타입으로 형변환 되는 것을 말한다.
    아래 코드에서 부모 클래스는 Person, 자식 클래스는 Student이다. 아래 코드에서 Person p = s; 부분이 업캐스팅한 부분이다. p가 Student 객체를 가리키지만, p는 Person 타입이기 때문에 Person 클래스의 멤버에만 접근이 가능하다. 그렇기 때문에 p.check에서 컴파일 타임 에러가 발생한다.

```java
class Person{
	String name;
	Person(String name){
		this.name = name;
	}
}

class Student extends Person{
	String check;
	Student(String name){
		super(name);
	}
}

public class Main{
	public static void main(String[] args){
		Student s = new Student("홍길동");
		Person p = s;	// 업캐스팅
		p.name = "이름이다.";

		p.check = "컴파일 에러 발생";	// 컴파일 에러 발생
	}
}
```

### 다운캐스팅(Downcasting)
    업캐스팅과 반대로 캐스팅 하는 것을 다운캐스팅이라고 한다. 업캐스팅된 것을 다시 원상태로 돌리는 것을 말한다. 하위 클래스로의 다운캐스팅을 할때는 타입을 명시적으로 지정해줘야한다는 특징이 있다.

    아래 코드를 보면 Student s = (Student)p; 라고 나오는데 이 부분이 바로 다운캐스팅이다.    
```java
class Person{
	String name;
	Person(String name){
		this.name = name;
	}
}

class Student extends Person{
	String check;
	Student(String name){
		super(name);
	}
}

public class Main{
	public static void main(String[] args){
		Person p = new Student("홍길동");
        
		Student s = (Student)p;	// 다운캐스팅
		s.name = "김유신";
		s.check = "check!";
	}
}
```
[출처](https://computer-science-student.tistory.com/335): https://computer-science-student.tistory.com/335

## 3. instanceof 연산자
---
### instanceof
- instanceof는 객체 타입을 확인하는 연산자이다.
- 형변환 가능여부를 확인하며 true / false 로 결과를 반환한다.
- 주로 상속 관계에서 부모객체인지 자식객체인지 확인하는데 사용된다.
 
instanceof의 기본 사용방법은 "객체 instanceof 클래스" 를 선언함으로써 사용한다.

[출처: 나만의 기록들:티스토리](https://mine-it-record.tistory.com/120)

![이미지](https://dthumb-phinf.pstatic.net/?src=%22https%3A%2F%2Fcafeptthumb-phinf.pstatic.net%2FMjAxNzAyMTVfMTQ2%2FMDAxNDg3MTQyMTg3MzI4.XqSLR5LiAFizQobeS4K88mhYwZ9F0AhX1v7QKd5n8kgg.0xliiei7AfnmMsoNFP3L1fpRx54icE_9wXbbJkRZBYQg.PNG.i7027%2Finstanceof.PNG%3Ftype%3Dw740%22&type=cafe_wa740)

    FireEngine의 부모는 Car이며 Car의 부모는 Object 이다 
    이를 instanceof 연산자를 통해 확인할 수 있다.


## 4. 인터페이스 (interface) (*06_Ex03_Interface_Poly 15~16)

### 추상클래스와 인터페이스 공통점
<br>

1. 스스로 객체 생성 불가능 (new 연산자 사용 불가)
    - 두놈의 차이점: 추상 클래스(완성 + 미완성) , 인터페이스 (모든것이 미완성)
	
2. 사용
    - 추상클래스 extends
    - 인터페이스 implements

    - class Car extends Abclass {}
    - class Car implements Ia{}

     둘다 추상자원을 가지고 있다 >> extends , implements >> 강제적 구현 목적(재정의)

### 추상클래스와 인터페이스 다른점
<br>

3. 추상클래스 (완성된 코드 일부) 그러나 인터페이스는 전체가 미완성
	- 원칙적으로 클래스는 다중상속(계층적상속)
            그러나 인터페이스는 다중구현이 가능 >> 작은 단위로 >> 여러개를 만들어서
            >> 모아모아 큰 약속을 만듬 >> 너무 큰 약속을 만들면 사용성과 재사용성이 떨어짐
            Ia,Ib,Ic
            class Test extends Object implements Ia,Ib,Ic
            Tip) 인터페이스와 인터페이스끼리는 상속가능 (extends) >> 약속을 크게 만들 수 있다.

<br>

4. 인터페이스(상수를 제외한 나머지는 미완성 추상(함수) >> JDK8 (Default값, static 값)

    인터페이스: 약속, 표준을 만드는 것
    소프트웨어 설계 최상위 단계 ...
    초급개발자 ... 인터페이스 설계 x
    초급개발자는 만들어진 인터페이스를 사용하는 방법과 처리에 대한 것에 초점두기
    구현부를 가지지 않아요 ... 약속에 대한 정의만

<br>

### 초급개발자의 시선으로

    1. 인터페이스를 [[[[ 다형성 ]]]] 입장으로 접근 (인터페이스는 부모 타입) ******중요******
    2. 서로 연관성이 없는 클래스를 하나의 묶어주는 기능 한다 (같은 부모를 가지게 함으로써)
    3. Java API 수 많은 (미리 만들어진) 인터페이스를 제공 (설계하지 않아도) 사용 가능
    4. 인터페이스 (~able) : 날수있는 , 수리할 수 있는
    5. 객체간 연결 고리 (객체간 소통) >> [[[ 다형성 ]]]

    ** 설계표쥰 >> 구현 >> 재정의

### interface

    1. 실제 구현부를 가지고 있지 않다 : 실행 블럭이 없다 : 규칙(약속)
    시스템에서 이동하는 것을 move 라는 이름을 사용하고 이동시에는 좌표값을 받아야 한다.
    >> 합의 >> void move(int x, int y); >> {구현은 알아서} 클래스 알아서 ... >> 재정의 >> 구현
    >> Java API 인터페이스 설계하고 구현하는 클래스 다 생성
    >> Collection(동적배열) >> Vector, [[ArrayList]], HashSet, [[HashMap]]
    Collection 클래스는 수 많은 인터페이스 구현하고 있는 클래스

    2. 생성방법
        2.1 상수(final) : [public static final] int VERSION = 1 > int VERSION=1;
                        생략 하면 컴파일러가 알아서 [public static final] 사용합니다.
        2.2 추상함수(method) : [public abstract] void run(); > void run();
                            생략 하면 컴파일러가 알아서 [public abstract]  사용합니다.

