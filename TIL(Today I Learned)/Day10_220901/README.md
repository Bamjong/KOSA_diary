# 2022년 9월 1일  목요일
<br>


## 1. 상속과 포함 관계 inheritance composition  (*05_Ex01_Inherit 01~02···)
---

### OOP특징 (여러개의 조각(클래스) 들을 조립해서 하나의 큰 제품을 만드는 행위)
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

메모리
    상속관계에서는 부모부터 메모리에 올라간다 ... 자식순으로

//사용자(개발자)가 만드는 모든 클래스는 default > Object 클래스를 상속
//class Car extends Object 라고 해석
//Object 모든 클래스의 root(최상위) : 모든 클래스의 부모


## 2. 재정의(Overide) (*05_Ex04_Inherit_Override 04~05···)

Annotation은 Java code만으로 전달할 수 없는 부가적인 정보를 컴파일러나 개발툴로 전달할 수 있다.

어노테이션을 통해 @override 가 주석처리로 된것처럼 보임

정의를 통해 
```java
Emp emp = new Emp(1000, "홍길동");
		System.out.println(emp);			//kr.or.kosa.Emp@1c4af82c
		System.out.println(emp.toString()); //kr.or.kosa.Emp@1c4af82c
		
		//emp 출력하면 사실은 ... emp.toString() 동일한 효과
		//toString() 은 Object 의 자원... 주소값 리턴

        //JAVA API 제공하는 수많은 클래스가 Object클래스의 toString() 재정의하고 있다.
```


## 3. Super (*05_Ex06_Inherit_super)


## 4. final (*05_Ex07_final)
