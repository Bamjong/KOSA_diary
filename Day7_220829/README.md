# 2022년 8월 29일 월요일
<br>


## 1. 함수의 호출방식 (*03_Ex12_Method_Call)
---
### 함수의 호출방식 

#### call-by-value (값에 의한 호출)

+ 함수가 호출될 때, 메모리 공간 안에서는 함수를 위한 별도의 임시 공간이 생성된다. (c++의 경우 stack frame) 함수가 종료되면 해당 공간은 사라진다.
+ 스택 프레임(Stack Frame) : 함수 호출시 할당되는 메모리 블록(지역변수의 선언으로 인해 할당되는 메모리 블록)
+ call-by-value 값에 의한 호출방식은 함수 호출시 전달되는 변수의 값을 복사하여 함수의 인자로 전달한다.
+ 복사된 인자는 함수 안에서 지역적으로 사용되는 local value의 특성을 가진다.
    따라서 함수 안에서 인자의 값이 변경되어도, 외부의 변수의 값은 변경되지 않는다.
+ Java의 경우 함수에 전달되는 인자의 데이터 타입에 따라서 (원시자료형 / 참조자료형) 함수 호출 방식이 달라진다.
    + 원시 자료형 (primitive type) : call-by-value 로 동작 (int, short, long, float, double, char, boolean )
    + 참조 자료형 (reference type): call-by-reference 로 동작 (Array, Class Instance)

#### call-by-reference (참조에 의한 호출)

+ 함수가 호출될 때, 메모리 공간 안에서는 함수를 위한 별도의 임시 공간이 생성된다. (예: stack frame) 함수가 종료되면 해당 공간은 사라진다.
+ call-by-reference 참조에 의한 호출방식은 함수 호출시 인자로 전달되는 변수의 레퍼런스를 전달한다. (해당 변수를 가르킨다.)
+ 따라서 함수 안에서 인자의 값이 변경되면, 아규먼트로 전달된 객체의 값도 함께 변경된다.

[함수의 호출방식 출처]https://wayhome25.github.io/cs/2017/04/11/cs-13/


## 2. Overloading / Overriding 
---

OOP 객체 지향 프로그래밍
+ (여러개의 조각들을(설계도) 만들어서 조합하는 행위)

1. 상속 (재사용성)
2. 캡슐화 (은닉화) : private ... getter/setter (직접할당을 막고 간접할당을 톻해 데이터 보내기)
3. 다형성 : 하나의 타입으로 여러개 객체의 주소를 가질 수 있는 것

>>method overloading(오버로딩)
1. 하나의 이름으로 여러가지 기능을 하는 함수
System.out.println() << println()함수 이름은 한개 ... 사용방법은 여러개