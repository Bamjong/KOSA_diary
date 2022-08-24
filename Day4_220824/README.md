# 2022년 8월 24일 수요일
<br>

### 1. Scanner 입출력 클래스 (*01_Ex08_printf_format)
---
	  Today's Point
	  
	  [문자를] => 숫자를 (정수, 실수)
	  Integer.parseInt("11111") ->> 정수 ->> 11111
	  Float.parseFloat("3.14") ->> 실수 ->> 3.14
	  
	  문자열의 비교는 == 를 쓰지 않아요
	  그래서 일단
	  String str = "+"; 이런 값이 있다면
	  if(str == "+") 하지 마시고
	  if(str.equals("+")) 하시면 됩니다

```java
      입력받기 (cmd) 사용자가 입력한 값을 ...
	  Scanner sc = new Scanner(System.in);
	  String value = sc.nextLine();
	  //입력하고 엔터를 칠때까지 대기 (프로그램 종료 되지않고 계속 대기)
	  //입력한 값을 문자열 전달해주어요 ^^
	  System.out.println(value);
	  
	  int number = sc.nextInt();
	  System.out.println("number : " + number);
	  
	  //권장사항 : Int로 받기보단 nextLine() read 타입을 바꾸자
```
      
<br>


### 2. case문, for문(*01_Ex10_Statement)
---
	제어문 
		* 조건문 : if (3가지) , switch(조건){case 값 ... break} 
		* 반복문 : for (반복횟수가 명확) , while(진위) {} , do{} ~ while{}
		* 분기문 : break(블럭탈출) , continue(아래 구문 skip)

```java
import java.util.Iterator;

public class Ex10_Statement {

	public static void main(String[] args) {
		//for문
		//1~100 누적합
		int sum = 0;
		for (int i = 1; i <= 100; i++) {
			System.out.println("i : " + i);
			sum += i;
		}

		//1~5까지의 합
		//for문과 while 쓰지 말고
		//개수 * (시작 + 끝) /2
		sum = 5 * (1+5)/2;
		System.out.println("sum : " + sum);
		
		//for문을 사용해서 1~10까지의 홀수의 합을 구하세요
		//단 for문만 사용하세요
		int sum2 = 0;
		for (int i = 1; i <= 10; i+=2) {
			sum2 += i;
		}
		System.out.println(sum2);
		
		//for문 안에 if문을 사용해서 1~1000까지의 합을 구하세요(짝수)
		int sum3 = 0;
		for (int i = 1; i <= 1000; i++) {
			//sum3 += i;
			if (i % 2 == 0) {
				
				sum3+=i;
			}
		}
		System.out.println(sum3);
		
		//입사시험 (구구단)
		//중첩 for ....
		//한개의 값을 고정 ... 반복(2 1~9, 3 1~9)
		for (int i = 2; i <= 9; i++) {  //i 라는 블럭변수는 유효범위
			for (int j = 1; j <= 9; j++) { //j 라는 블럭변수 ..
				//System.out.printf("[%d]*[%d]=[%d]\t",i ,j ,i*j);
			}
			System.out.println();
		}
		
		// for + (분기문) continue, break
		// Today's point : continue(아래 구문 skip) , break(for , while 블럭 탈출)
		for (int i = 2; i <= 9; i++) {
			for (int j = 1; j <= 9; j++) {
				if(i == j) { //
					continue;
				}
				System.out.printf("[%d]*[%d]=[%d]\t",i ,j ,i*j);
			}
			System.out.println();
		}
		
		//100부터 0 까지 출력 .. 증가감 --i
		for (int i = 100; i >= 0; i--) {
			System.out.println(i);
		}
	}
}

```
<br>


### 3. while문(*01_Ex11_Statement)
---
	for(;;){}
	* while(true) {if (조건) break;}
	* do ~ while : 일단 한번은 강제적으로 수행 하고 ... 그리고 조건을 보고 판단해라

```java
import java.util.Scanner;

public class Ex11_Statement {

	public static void main(String[] args) {
		//반복문 (while, do ~while)
		int i = 10;
		while (i >= 10) {
			/*
			 * 반드시
			 * 증가감을 명시
			 * i--; //증가감의 위치도 고민하자!!
			 */
			i--;
			
			System.out.println("i :" + i);
		}
		//while 1~100까지 합
		int sum = 0;
		int j = 1;
		while(j <= 100) { //for(int j = 1; j <= 100; j++)
			sum +=j;
			j++;
		}
		System.out.println("sum: " + sum);
		
		//while 구구단을 출력하세요
		// for(int i= 2; i <= 9; i++)
		//	for(int j = 1; j<= 9; j++)
		int ii = 2;
		int jj = 1;
		
		
		//while 2개 구구단
		while(ii <= 9) {
			while (jj <= 9) {
				System.out.printf("[%d]x[%d]=[%d]\t", ii,jj,ii*jj);
				jj++;
			}
			System.out.println();
			ii++;
			jj = 1;
		}
		
		
		/*
		 * 메뉴 구성
		 * 점심 메뉴 선택하세요
		 * 1. 짜장
		 * 2. 짬뽕
		 * 계속 3 입력 메뉴가 다시 나오게 다시입력 받게 ...
		 * 
		 * 프로그램 동작
		 * 당신이 원하는 메뉴 번호를 선택하세요 >> do .. 선택값 받아서
		 * while(input > 2 ) 다시 입력하세요 >> while false 구문을 종료
		 */

		Scanner sc = new Scanner(System.in);
		int inputdata = 0;
		do {
			System.out.println("숫자 입력하세요 (0~9): ");
			inputdata = Integer.parseInt(sc.nextLine()); 
		} while (inputdata >= 10); //true가 되면 계속 do문 실행
		System.out.println("당신이 입력한 숫자는: " + inputdata);
	}
}
```
<br>


### 4. Class 개념(*02_Ex01_Main)
---
	 클래스 == 설계도== 타입
	 클래스 구성요소(설계도라고 판단할려면 최소한 무엇을 가지고 있어야한다)
	 필드 + 함수 + 생성자 함수
	 
	 필드(member field) >> 데이터, 정보 담아야한다>>고유정보, 상태정보, 부품정보 >> field>>variable
	 함수(method) >> 기능 (행위)>>자동차>> 달린다, 멈춘다, 소리가 난다.
	 +추가적으로 생성자>> 특수한 목적의 함수>> 객체가 만들어질 때 member field초기화 목적으로
	 
	 클래스, 필드, 생성자, 함수 :영역(범위) >> 접근자, 한정자, 수정자
	 >>public, private, default, protected
	 
	 >>kr.or.kosa.common 안에 Car 클래스 >> public class Car{}>>나 다 오픈할꺼야
	 >>kr.or.kosa.common 안에 Airplane >> class Airplane{>>default class Airplane}
	 >>default 같은 폴더에서는 공유 : [같은 pakage안에서는 오픈][다른 package에선ㄴ 접근 불가]
	 >>default 접근자는 : 같은 폴더(package)내에서 만들어서 연습용
	 
	 하나의 물리적인 java 파일은 여러개의 클래스를 가질 수 있다. 
	 >>Ex01_Main.java  파일은 그 안에 Ex01_Main이라는 클래스를 하나 가지고 있다. 
	 >>일반적으로 필요한 클래스를 별도의 파일로 생성해서 사용...APt.java
	 >>그냥 연습... 해볼 굳이 물리적인 파일 만들필요 있을까
	 하나의 물리적 파일은  여러개의 클래스를 가질 수 있지만 public은 하나의 클래스에서 하나만 가질 수 있다.

```java

class Test{//컴파일러가 defaul class Test로 해석
	int data;//지역변수(instance variable)//컴파일러가 deault int data로 해석한다.
	public int p_data;//에러는 아니지만 다른 폴더에서 사용불가... public 의미없다. 
	private int pri_data;//private 감추다. 숨기다, 캡슐화(은닉화)
	
}
public class Ex01_Main {
	public static void main(String[] args) {
		Car car = new Car();
		AirPlane air = new AirPlane();//import 없을 떄 단축기 (ctrl + shilft +o)
		Apt apt = new Apt();
	}
}
```
<br>


### 5. private 캡슐화 getter / setter (*03_Emp)
---
```java
package kr.or.kosa;

public class Emp {
	
	
	//member field (instance variable)
	private int empno;
	private String ename;
	private String job;
	private int sal;
	
	//setter, getter method (read, write) 기능
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public int getSal() {
		return sal;
	}
	public void setSal(int sal) {
		this.sal = sal;
	}
	
	public void empDataPrint() {
		System.out.println("사원데이터 출력");
		//method (main함수)
		//함수안에 있는 변수는 지역 변수 접근자를 붙이지 않아요 (처음 하시는 분)
		int data=0; //local variable
		int input=0;
		//for
	}
}

```