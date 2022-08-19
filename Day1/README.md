# 2022년 8월 19일 금요일

### 1. 자바 JDK와 JRE 차이점
---
    1. JAVA 언어로 개발을 한다. 컴파일 하고 디버깅 하고 어쩌고 하려면 JDK가 필요하다.
    2. 개발을 하면서 자바에서 기본으로 제공하는 JRE 라이브러리를 사용한다.
    3. 여러 가지 환경 파일도 JRE가 가지고 있지만 개발자가 직접 다룰 일은 거의 없다.
    4. 실행하면 JVM에서 .class파일을 읽어서 바이너리코드를 검증하고 OS 환경에 적합하게 실행해준다.

    ※ 어쨌든 JDK안에 모두 다 들어 있다.
    "JDK > JRE > JVM"

    ※ 개발이 아닌 JAVA로 만들어진 프로그램을 실행하기 위해서는 JRE만 있으면 된다.(JVM 포함)
    ※ 같은 코드를 짜면 OS별로 최적화되어 있는 JVM이 알아서 환경에 맞게 실행해준다.

    기본적으로 JDK를 깔면 JAVA 개발이 가능합니다. 메모장에 코드 작성하고 컴파일하면 프로그램이 실행됩니다. 하지만 우리가 메모장에
    코딩을 할 순 없으니 이클립스와 같은 IDE를 사용합니다.

![이미지링크](https://dthumb-phinf.pstatic.net/?src=%22https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fd1gYvX%2FbtqAiXbOybR%2FITzib2xhpHXYCReizDW0X0%2Fimg.png%22&type=cafe_wa800)  



### 2. 자바 JDK8 다운
---
https://www.oracle.com/kr/java/technologies/javase/javase8-archive-downloads.html  

### 3. 환경변수 설정 
---
    java폴더 안에서 컴파일 할 필요없이 어디서든 실행 가능하게 하도록 만들기  

### 4. 자바 메모리 구조 
---
![이미지링크](https://dthumb-phinf.pstatic.net/?src=%22http%3A%2F%2Fcafeptthumb3.phinf.naver.net%2F20130524_83%2Fzeroday7_1369363867407vYoPA_PNG%2Fjvm_exe.PNG%3Ftype%3Dw740%22&type=cafe_wa740)
![이미지링크](https://dthumb-phinf.pstatic.net/?src=%22http%3A%2F%2Fcafeptthumb1.phinf.naver.net%2F20130524_115%2Fzeroday7_1369364459450INoTP_PNG%2Fjvm_struct.PNG%3Ftype%3Dw740%22&type=cafe_wa740)


### 5. 이클립스 22년 6월버전 다운
---
https://www.eclipse.org/downloads/


### 6. 이클립스를 통해 코딩해보기

```public class Ex01 {
	public static void main(String[] args) {
		System.out.println("Hello");
	}
}
```