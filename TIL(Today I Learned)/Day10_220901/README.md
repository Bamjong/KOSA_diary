# 2022년 9월 1일  목요일
<br>


## 1. 상속과 포함 관계 inheritance composition  (*05_Ex01_Inherit 01~03···)
---

### OOP특징 (여러개의 조각(클래스) 들을 조립해서 하나의 큰 제품을 만드는 행위)
    1. 상속
    2. 캡슐화(은닉화) >> private
    3. 다형성 (상속관계에서 부모 타입이 자식타입을 주소를 가질 수 있다)


### 상속 (inheritance)

언어별 상속
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

### 포함 (composition)

    실무(현업) 환경
    한개의 클래스만 설계 사용경우 (x)

    설계도 1장 모든 업무를 구현 현실적으로 불가능
    설계도 여러개의 나눈다 ... 문제발생 ... (기준, 관계)

    쇼핑몰 : 결제관리, 배송관리, 판매처, 회원관리, 관리자관리, 상품관리 >> 각각의 업무 > 별도의 설계도

****기준****

1. 상속 (is ~ a : 상속) 은(는) ~이다 (부모를 뒤에)
    예) is ~ a
    원은 도형이다
    원 extends 도형

    삼각형은 도형이다
    삼각형 extends 도형

    원 과 점 관계
    원은 점이다 (x)
    원은 점을 가지고 있다.


2. 포함 (has ~ a : 포함) 은(는) ~을 가지고 있다.
    예) has ~ a
    class 원 {점이라는 부품이 member field}
    경찰과 권총과의 관계
    경찰은 권총이다(X)
    경찰은 권총을 가지고 있다(O)
    >> class 권총{}
    >> class 경찰{권총 member field}


    원은 도형이다
    삼각형은 도형이다
    사각형은 도형이다.

    도형은 분모 (공통적) 공통자원 : 추상화, 일반화		(그리다, 색상)
    원은 구체화, 특수화(본인만이 가지는 특징)			(반지름, 한점)

    점: 좌표값 (x,y)
    원은 점을 가지고 있다
    삼각형은 점을 가지고 있다
    사각형은 점을 가지고 있다.

    class Shape{그리다, 색상} >> 상속관계 부모 (원, 삼각형, 사각형)
    class Point{좌표값} >> 포함관계 (부품)

#### 문제 1
    원을 만드세요 (원의 정의 : 원은 한 점과 반지름을 가지고 있다)

    1. 원은 도형이다 (is ~ a) : shape
    2. 원은 점을 가지고 있다 (has ~ a) : point >> member field
    3. 원은 반지름을 가지고 있다(특수, 구체) : r

    원의 반지름은 초기값 10을 가진다
    점의 좌표는 초기값 (10, 15) 가진다
    초기값을 설정하지 않으면 반지름과 점을 값을 입력 받을 수 있다 (원이 만들어 질때 new)
    생성자를 ... 활용 (hint)
    
```java
class Shape{
	String color = "gold";
	void draw()	{
		System.out.println("도형을 그리다");
	}
}
```

```java
class Point{
	int x;
	int y;
	
	public Point() {
//		this.x = 1;
//		this.y = 1;
		this(1, 1); //생성자 호출하는 this
	}
	
	public Point(int x, int y) {
		this.x = x;
		this.y = y;
	}
}
```
```java
class Circle extends Shape{
	Point point; //포함(부품정보)
	int r; //특수성
	
	public Circle(){
//		this.r = 10;
//		this.point = new Point(10,15);
		this(10,new Point(10,15));
	}
	public Circle(int r, Point point) {
		this.r = r;
		this.point = point;
	}
}
```

#### 문제 2
    삼각형 클래스를 만드세요
    삼각형은 3개의 점과 색상과 그리고 '그리다' 기능을 가지고 있다
    hint) Shape , Point 제공 받아서 설계도 작성 하세요
    hint) (x,y) , (x,y) , (x,y)
    default 삼각형을 만들 수 있고 3개의 좌표값을 받아서 그릴 수 있다.

```java
class Point{
	int x;
	int y;
	
	public Point() {
//		this.x = 1;
//		this.y = 1;
		this(1, 1); //생성자 호출하는 this
	}
	
	public Point(int x, int y) {
		this.x = x;
		this.y = y;
	}
}
```

```java
//70점 짜리
class Triangle extends Shape{
	Point x,y,z;
	
	public Triangle() {
//		this.x = new Point(10,20);
//		this.y = new Point(30,40);
//		this.z = new Point(50,60);
		
		this(new Point(10,20),new Point(30,40),new Point(50,60));  // 80점짜리
	}
	
	public Triangle(Point x,Point y,Point z) {
		this.x = x;
		this.y = y;
		this.z = z;
	}
	
	//구체화, 특수화
	//추가적인 기능
	void trianglePoint() {
		System.out.printf("x :(%d,%d)\t",x.x,x.y);
		System.out.printf("y :(%d,%d)\t",y.x,y.y);
		System.out.printf("z :(%d,%d)\t",z.x,z.y);
	}
	
}
```

```java
//100점 짜리
class Triangle2 extends Shape{
	Point[] pointarray;
	
	public Triangle2() {
//		this.x = new Point(10,20);
//		this.y = new Point(30,40);
//		this.z = new Point(50,60);
		//this(new Point(10,20),new Point(30,40),new Point(50,60));  // 80점짜리
		this(new Point[] {new Point(10,20),new Point(30,40),new Point(50,60)});
	}
	
	public Triangle2(Point[] pointarray) {
		this.pointarray = pointarray;
	}
	
	//구체화, 특수화
	//추가적인 기능
	void trianglePoint() {
		for(Point point : this.pointarray) {
			System.out.printf("x :(%d,%d)\t",point.x,point.y);
		}
		
//		System.out.printf("x :(%d,%d)\t",x.x,x.y);
//		System.out.printf("y :(%d,%d)\t",y.x,y.y);
//		System.out.printf("z :(%d,%d)\t",z.x,z.y);
	}
	
}
```


## 2. 재정의(Overide) (*05_Ex04_Inherit_Override 04~06···)

### 재정의
    [상속관계]에서 Override: 상속관계에서 자식이 부모의 함수를 [재정의]
    [상속관계]에서 [자식 클래스]가 [부모클래스]의 메서드(함수)를 재정의(내용을 바꿈)

    재정의 : 틀의 변화가 없고 (함수의 이름, 타입) 아니고 내용만 변화 {중괄호 블럭 안에 것만 수정}

### 문법
    1. 부모 함수 이름 동일
    2. 부모 함수 parameter동일
    3. 부모 함수 return type 동일
    4. 결국 {안에 실행블럭안에 코드만 변경 가능}

+Annotation은 Java code만으로 전달할 수 없는 부가적인 정보를 컴파일러나 개발툴로 전달할 수 있다.
    Annotation 예시) @Override



	

```java
Emp emp = new Emp(1000, "홍길동");
		System.out.println(emp);			//kr.or.kosa.Emp@1c4af82c
		System.out.println(emp.toString()); //kr.or.kosa.Emp@1c4af82c
		
		//emp 출력하면 사실은 ... emp.toString() 동일한 효과
		//toString() 은 Object 의 자원... 주소값 리턴

        //toString() 재정의 했다면 결과는 재정의 된 내용 출력
		//Emp [empno=1000, ename=홍길동]
		//Emp [empno=1000, ename=홍길동]

        //JAVA API 제공하는 수많은 클래스가 Object클래스의 toString() 재정의하고 있다.
```
+ Object >> toString() 함수는 일반적으로 재정의 가장 많이....
+ 만약 재정의 하지 않으면 ... 주소값을 출력
+ toString 재정의 필요한대로 코딩 ... 일반적으로 member field정보를 기입해 재정의해둠


## 3. Super (*05_Ex06_Inherit_super)
    this: 객체 자신을 가르키는 this(this.empno, this.ename)
    this: 생성자를 호출하는 this ( this(100,"red"))

    상속관계
    부모,자식

    super(현재 자식이 부모의 접근 주소값) : 상속관계에서의 부모에 접근(super 부모객체의 주소값)

    1. super >> 상속관계에서 부모자원에 접근
    2. super >> 상속관계에서 부모의 생성자를 호출(명시적으로)

    ## 재정의 상태에서 부모 자원을 부를 수 있는 유일한 방법 = super ##

    Tip)
    C# : base()
    Java : super()

    super는 바로 한단계 위까지만 가는거이다.

    ex) 손자가 할아버지에게 가려면
        손자에서 super(); 아빠 super(); 해야지 갈수있다


## 4. final (*05_Ex07_final)
    변수 <-> 상수
    상수 : 한번 값이 [초기화] 되면 변경 불가
    상수자원 : 고유값 (주민번호) 수학 : PI=3.14159... , 시스템 보호(버전번호)
    상수는 관용적으로 [대문자]

    java : final int NUM = 10;
    c#	 : const integer NUM = 10;


    final 키워드

    1. final class Car {} > 클래스 fianl > 상속금지 > public final class Math extends Object

    2. public final void print(){} >> 함수 final > 상속관계에서 재정의(override) 금지

## 5. finally / throws (*07_Ex07_final 03~04···)

### finally
    try{

    }catch(Exception e){

    }finally{
    강제적으로 실행되는 블럭
    }

    나는 예외가 발생하던 , 예외가 발생하지 않던 [강제적으로 실행되야 하는 구문]을 가지고 있다

    >>게임CD 설치 PC
    >>1. 설치파일 >> C:\Temp >> 복사
    >>2. 복사한 파일 >> 프로그램 설치
    >>3. 정상 설치  >> C:\Temp 복사한 파일 삭제
    >>4. 비정상 설치 >> 강제 종료 >> 복사한 파일 삭제
```java
public class Ex03_finally {

	static void copyFiles() {
		System.out.println("copy files");
	}
	static void startInstall() {
		System.out.println("install");
	}
	static void fileDelete() {
		System.out.println("file delete");
	}
	
	//실제로 예외는 아니지만 
	//개발자가 필요에 따라서 어떤 상황을 예외적이 상황이라 정의하고 예외를 발생
	//사용자 정의 예외 처리 
	//throw new IOException
	public static void main(String[] args) {
		
		try {
			copyFiles();
			startInstall();
			throw new IOException("install 중 문제가 발생 ...");
		}catch (Exception e) {
			System.out.println("예외 메시지 출력 : " + e.getMessage());
		}finally { 
			//강제 실행 블럭 예외 발생 실행되고 , 정상건이어도 실행 된다
			//함수의 강제 종료인 return 만나도 finally 강제 실행 (먼저)
			fileDelete();
    	}	
	}
}
```

### throw와 throws의 차이점
    throw : 에러를 고의로 발생시킬 때 사용합니다.
    throws : 자신을 호출한 상위 메소드로 에러를 던지는 역할을 합니다.

예외 떠넘기기 - throws 사용
    메서드 내부에서 예외가 발생했을 때 예외를 try - catch 문으로 잡아서 처리할 수 있지만 경우에 따라서 현재 메서드를 호출한 메서드로 예외를 떠넘길 수 있습니다.예외를 떠넘기는 방법은 다음과 같이 throws 키워드를 메서드 뒤에 붙여주면 됩니다.
    출처: https://dololak.tistory.com/87 [코끼리를 냉장고에 넣는 방법:티스토리]

```java
public static void generateException() throws NullPointerException{
    //NullPointerException 발생
}
```
    만약 떠넘겨야할 예외 종류가 여러개라면 쉼표(,) 를 기준으로 나열하여 선언합니다. 
```java
public static void generateException() throws NullPointerException, ArithmeticException{
    //예외 발생
}
```
    예외가 발생하는 경우 try - catch문을 통해 처리하지 않고 throws를 이용해 떠넘기면 현재 메서드를 호출한 곳으로 던져지게 됩니다.만약 모든 메서드에서 throws 를 이용해 예외를 떠넘기다 보면 최초 호출 지점인 main() 메서드 내부로 예외가 던져지게 되며 main() 메서드에서 마저 예외를 떠넘기게 된다면 JVM의 예외처리기까지 도달하여 프로그램은 그대로 종료됩니다.이렇게 되면 사실상 예외를 처리하지 않은것이나 다름 없으므로 매우 무의미한 행동이라 할 수 있겠습니다. 의도적인 경우가 아니라면 throws는 많은 생각과 필요에 의해 사용되어야 합니다.
