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

<br>

## 2. Overloading  (*03_Ex13~14_Method_Overloading)
---

#### OOP 객체 지향 프로그래밍
##### (여러개의 조각들을(설계도) 만들어서 조합하는 행위)

    1. 상속 (재사용성)
    2. 캡슐화 (은닉화) : private ... getter/setter (직접할당을 막고 간접할당을 톻해 데이터 보내기)
    3. 다형성 : 하나의 타입으로 여러개 객체의 주소를 가질 수 있는 것

#### method overloading(오버로딩)
    1. 하나의 이름으로 여러가지 기능을 하는 함수
        - System.out.println() << println()함수 이름은 한개 ... 사용방법은 여러개
    2. 편하게 사용하려고... 설계자가 개발자를 배려... (개발자)
    3. 오버로딩을 사용하지 않아도 문제 되지 않는다.

#### 문법) 함수 이름은 같고 parameter [개수] 와 [타입]을 다르게 하면 오버로딩이라 한다.
    1. 함수이름은 동일
    2. parameter 개수 또는 타입을 달라야 한다.
    3. return type은 오버로딩의 판단 기준이 아니다.
    4. parameter의 순서가 다름을 인정한다.

<br>

## 3. Constructor(생성자) (*03_Ex15_Constructor)
---

#### 생성자 함수(constructor)

    1. 함수(특수한 목적)
    2. 목적(member field 초기화) >> static {} , {초기자 블럭}

    3. 일반함수와 다른점
        3.1 함수의 이름이 고정(class 이름 동일)
        3.2 return type 없어요 (객체 생성과 동시에 호출) (return을 받을 대상이 없다)
        3.3 실행시점 >> new 객체 생성 >> heap 공간 생성 >> member field 자리 >> 자동으로 생성자 함수 호출

    4. why : 생성되는 객체마다[강제적으로] member field 값을 초기화 할 수 있다.
    5. 생성자 함수(.... overloading기법 적용 가능)
    6. 생성자 오버로딩을 통해서 다양한 **강제사항**을 구현... (제일중요)


## 4. Exception(예외처리) (*07_Ex01~02_Exception)
---

오류
    1. 에러 (error) : 네트위크 장애, 메모리, 하드웨어 >> 개발자가 코드적으로 해결 불가
    2. 예외 (exception) : 개발자가 코드의 실수에의해 발생 >> 문제 코드 찾아서 수정 >> 배포
                    >> 프로그램 컴파일시가 아니라 실행시 알 수 없음(테스트..)
                    >> 문제가 발생하면 (exception) 프로그램 강제 종료

    3. 예외처리 >> 예외발생에 대한 코드 수정하는 것이 아니고 일반 임시방편으로 문제가 생기더라도 프로그램이 안정적으로 종료되는 것을 처리
                >> 결국 얘외처리를 통해서 문제가 생긴 부분을 찾고 다시 코드 수정 >> 배포

    try{
    >> 문제가 의심되는 코드 실행
    >> 문제가 발생(exception)
    } catch(Exception e) {
        >> 문제가 발생한 예외 부분을 파악 ..
        >> 처리 (코드를 수정하는 것이 아님, 보고하는 것)
        1) 관리자에게 이메일
        2) 로그 파일에 기록
        3) 강제 프로그램 종료 막음(일단은)
            >> 결국 개발자가 수정하는 것이 답 .. 
    } finally {
    >> 문제가 발생하던, 발행하지 않던 강제적으로 실행해야 할 코드
    >> DB작업 문제 (특정 자원에 종료) 강제

```java
public class Ex01_Exception {
   

   public static void main(String[] args) {
      
   
   /*   
      System.out.println("main start");
      System.out.println(0/0); //java.lang.ArithmeticException: / by zero
      //프로그램 강제 종료
      System.out.println("main end");
      
   }
    */
   
   System.out.println("main start");
   
   try {
      System.out.println(0/0);
      //연산 예외가 발생 ... try{} catch() 처리 프로그램이 강제 종료되진 않음
      //Exception 클래스 사용 (예외 클래스의 최상위 부모 )
      //e라는 변수는 무엇을 받는걸까?
      //Exception e >> Exception 객체의 주소값 ...
      
      //ArithmeticException 문제가 발생
      //컴파일러에 의해서 연산 예외 객체(ArithmeticException)가 생성 되고 
      //그 객체에게 문제가 되는 메세지, 코드 전달
      
   } catch (Exception e) { //부모 type의 변수는 자식 type의 주소값을 받을 수 있다(다형성)
      //어떤 문제인지를 파악하고 그 정보를 전달
      // 관리자, email, log 기록
      System.out.println(e.getMessage());
   }
   System.out.println("main end");
   }
}
```

## 5. This (*03_Ex19_this)
---
### This(이것)
    자기 자신 클래스(객체)를 가리킨다.
---
+ 메소드내에서만 사용된다

+ 객체 자신을 메소드에 전달하거나 리턴해 주기위해 사용하기도 한다.

+ this를 사용하으로서 모호하지 않고 좀더 명확한 프로그램을 작성할 수 있다.

+ 객체 생성자내에서 사용시 다른 생성자를 호출한다. (this의 용법 1)

+ 매개변수와 객체 자신이 가지고 있는 변수의 이름이 같은 경우 이를 구분하기 위해 자신의 변수에 this를 사용한다. (this의 용법 2)

+ static 메서드(예를 들어 main())에서 쓸 수 없다.
    [ static 메서드는 객체가 new라는 키워드로 생성되기 이전에 메모리에 로딩이되므로 아직 객체가 생기지 않았는데 this를 사용 불가]

​