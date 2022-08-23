# 2022년 8월 23일 요일
<br>

### 1. Git 기본 개념
---

    깃(Git /ɡɪt/)은 컴퓨터 파일의 변경사항을 추적하고 여러 명의 사용자들 간에 해당 파일들의 작업을 조율하기 위한
    분산 버전 관리 시스템이다. 소프트웨어 개발에서 소스 코드 관리에 주로 사용되지만 어떠한 집합의 파일의 변경사항을 지속적으로
    추적하기 위해 사용될 수 있다. 기하학적 불변 이론을 바탕으로 설계됐고, 분산 버전 관리 시스템으로서 빠른 수행 속도에
    중점을 두고 있는 것이 특징이며 데이터 무결성, 분산, 비선형 워크플로를 지원한다.

위키백과 참조

![이미지링크](https://t1.daumcdn.net/cfile/tistory/993CCF4B5F17C75211)

#### Git 구조

    Git은 내 컴퓨터에서만 운영해도 되지만 거의 99%는 원격서버와 같이 연계해서 협업을 하며 사용합니다. 

    Github, Gitlab은 원격 저장소(Remote Repository)로써 동기화가 된 상태라고 가정했을 때, 로컬 저장소(Local Repository)와 동일한
    내용을 가지고 있습니다. 

    Git을 운영하는 순서는 여러가지가 있겠지만 가장 많이 사용하는 것은 원격저장소의 파일을 로컬로 다운로드받아서 작업 후 다시 업로드 하는 식이 많습니다. 


### 2. 클래스의 기본 구성 요소
---

![이미지링크](https://dthumb-phinf.pstatic.net/?src=%22https%3A%2F%2Fdthumb-phinf.pstatic.net%2F%3Fsrc%3D%2522https%253A%252F%252Fcafeptthumb-phinf.pstatic.net%252FMjAxNzA3MjZfMjgw%252FMDAxNTAxMDYyNzM1OTkz.9P-EK-45WNIQrV3kFXILTTXbUO2HLn4q7t8oc5z4GE4g.-p_yN_vSxIqVqoI1VM6_7KcXUXQ5rLLWsdX0CqkcHIEg.PNG.i7027%252F%2525ED%252581%2525B4%2525EB%25259E%252598%2525EC%25258A%2525A4_%2525EA%2525B5%2525AC%2525EC%252584%2525B1_%2525EB%2525A9%2525A4%2525EB%2525B2%252584.PNG%253Ftype%253Dw740%2522%26amp%3Btype%3Dcafe_wa740%22&type=cafe_wa800)

![이미지링크](https://dthumb-phinf.pstatic.net/?src=%22https%3A%2F%2Fdthumb-phinf.pstatic.net%2F%3Fsrc%3D%2522https%253A%252F%252Fcafeptthumb-phinf.pstatic.net%252FMjAxNzA3MjZfMTc2%252FMDAxNTAxMDYyNzM2MTMy.wvZ8Vf80Xh0JARlkx7fP-_WzWzYoWmcobhN4jQb6pO4g.xWwfvLGzA9KEIIQNREAIlzOJbsZ-6BFvmf7vK_gLW3Ug.PNG.i7027%252F%2525ED%252595%252584%2525EB%252593%25259C_%2525EA%2525B5%2525AC%2525EC%252584%2525B1.PNG%253Ftype%253Dw740%2522%26amp%3Btype%3Dcafe_wa740%22&type=cafe_wa800)


### 3. 참조타입(*Ex05_Ref_Type)
---

```java
/*
	클래스는 설계도이다, 클래스는 데이터 타입이다.
	클래스 == 설계도 == 타입
	
	클래스는 구체화를 통해서 사용 ( 집을 짓는 행위)
	프로그램에서는 [ new 연산자 ] 를 통해서 memory 에 집을 짓는다 >> 만들어진 것 >> 객체(인스턴스)
	
	설계도 종류 2가지
	1. 독자적으로 실행 가능  >> public static void main(String[] args) {} 가지고 있는 클래스
	2. 독자적으로 실행 불가능  >> main 함수가 ㅇ벗는 나머지 클래스 >> 남을 도와주는 클래스 >> 라이브러리 (LIB)
	

 */
class Apt2{
	int door = 10;
	int window = 20;
}


public class Ex05_Ref_Type {

	public static void main(String[] args) {
		//Apt2 설계도를 가지고
		//구체화된 산물 생산 (객체)
		
		int num;
		num = 100; //정수값을 넣어주면 ...
		
		Apt2 apt2; //주소값을 ...
		apt2 = new Apt2(); //Apt2 설계도를 기반으로 아파트를 지었어요 (JVM >> memory >> heap)
		System.out.println("apt2 : " + apt2); // 주소값
		
		Apt2 ssapt = apt2; // 주소값을 할당 ... ssapt 변수는 apt2 가지고 있는 주소값으로 할당

	}

}

```

### 4.연산자 (*Ex06_Operation)
---

```java

public class Ex06_Operation {

	public static void main(String[] args) {
		int result = 100/100;
		System.out.println(result);
		
		result = 13/2; // 몫
		System.out.println(result);

		//나머지를 구하는 연산자 (%)
		result = 13 % 2;
		System.out.println(result);
		
		//증가, 감소 (증가감 연산자 : ++(1씩증가), --(1씩감소))
		int i = 10;
		++i; //전치증가
		System.out.println("전치 : " + i);
		i++; //후치증가
		System.out.println("후치 : " + i);
		//혼자는 전치, 후치의 의미가 없다
		
		//Today Point (증가감 연산자 다른 연산자와 결합되면 전치, 후치)
		int i2 = 5;
		int j2 = 4;
		int result2 = i2 + ++j2;
		System.out.println("result2 : " + result2 + " j2: " + j2); // result2 : 10 ,  j2: 5
		
		result2 = i2 + j2++;
		System.out.println("result2 : " + result2 + " j2: " + j2);

	}

}

```