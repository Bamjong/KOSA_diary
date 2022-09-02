# 2022년 9월 2일  금요일
<br>


## 1. String Class(스트링 클래스)  (*07_Ex05_String_Class 05~07, kr.or.kosa  Ex05_String_Class ···)
---
- String 클래스 (문자열)
- String 수 많은 함수 ... 문자열 조작(자르고, 합치고 ...)
- String >> static 
```java
String str1 = "AAA";
		String str2 = "AAA";
	   
		//문자열 비교
		System.out.println(str1);
		System.out.println(str2.toString()); //toString() 재정의 주소값이 아니고 값이 나온다
		System.out.println(str1 == str2);
		// == 연산자는 값을 비교 str1(주소값), str2(주소값)
		//같은 주소 판명
		//**메모리에 실제로 같은 문자열이 있으면 [재사용]
```
```java
//Point
		System.out.println(str1.equals(str2)); //주소를 찾아가서 그 안에 있는 값을 비교
		
		//why : equlas 문자열의 비교 ..
		String str3 = new String("BBB");
		String str4 = new String("BBB");
		
		System.out.println(str3 == str4);	//false (쓰면 안돼요)
		//문자열은 값이 중요해요
		System.out.println(str3.equals(str4));	//주소를 찾아가서 그 안에 값을 비교   <- 제일중요
```
그림으로 이해해보기
![image](https://user-images.githubusercontent.com/92353613/188034327-4b9cf9a5-7e01-4769-9176-4f987906e0c4.png)

```java
String str = "hello";
		String concatstr = str.concat(" World");  // 두 문자를 붙여두기
		System.out.println(concatstr);
		
		boolean bo = str.contains("ell"); //'hello'의 'el'를 읽기때문에 'true' 값이 나옴
		System.out.println(bo);
		
		String str2 = "a b c d"; //[a][ ][b][ ][c][ ][d] ... 띄어쓰기도 읽기때문에 7이 나옴
		System.out.println(str2.length());
		
		String filename = "hello java world";
		System.out.println(filename.indexOf("h"));	//'h'가 맨 앞에 있으므로 0이 출력
		System.out.println(filename.indexOf("java"));	//'java'글자가 6번째에 있으므로 '6'출력
		System.out.println(filename.indexOf("개폭망"));	//'개폭망'이란 글자가 없으므로 '-1' 출력
		//-1을 return... 배열에서 값이 없다 (-1)
		
		if(filename.indexOf("wo") != -1) {
         System.out.println("wo단어가 하나라도 있다");
		}
		System.out.println(filename.lastIndexOf("a")); //9번째방 ^^
		//length(), indexOf, substring(), replace(), split()
      
		String result = "superman";
		System.out.println(result.substring(0)); //시작 index ~
		System.out.println(result.substring(1)); //시작 index ~
		System.out.println(result.substring(1, 2)); // "u"
		//beginIndex = the beginning index, inclusive.
		//endIndex - the ending index, exclusive. // endindex -1
		System.out.println(result.substring(0, 5)); //출력 super
		System.out.println(result.substring(2, 7)); //출력 perma
```

### 퀴즈!
    String filename2 = "home.jpeg"; //or h.png or aaaaa.hwp
    //여기서 파일명과 확장자를 분리해서 출력하세요.
    
    //파일명 : home
    //확장자 : jpeg
    //조건은 단 위에서 배운 함수만 사용하기

```java
System.out.println(filename2.indexOf("."));
    int a = filename2.indexOf(".");
    
    System.out.println("파일명 : " + filename2.substring(0,a));
    System.out.println("확장자 : " + filename2.substring(++a));
```
### 퀴즈!
    주민번호 : 뒷번호 첫자리 : 1,3 남자 , 2,4 여자 라고 출력 ... 하는 문제
    main 함수 Scanner  사용 주민번호 입력받고
    앞:6자리     뒷:7자리

    입력값 : 123456-1234567 

    static 
    1. 자리수 체크 (기능)함수 (14 ok)  return true , false 
    2. 뒷번호 첫번째 자리값 1~4까지의 값만 허용 기능함수  return true, false
    3. 뒷번호 첫번째 자리값을 가지고 1,3 남자 , 2,4 여자 출력 기능함수  void  출력

```java
import java.util.Scanner;

public class Ex07_String_Total_Quiz {
	
	static boolean juminCheck(String str) {
		return str.length() == 14 ? true : false;
	}

	static boolean JunminFirstNumber(String str) {
		boolean numcheck = false;
		int num = Integer.parseInt(str.substring(7, 8));
		if (num > 0 && num < 5) {
			numcheck = true;
		}
		return numcheck;
	}
	static void JuminDisplay(String ssn) {
		// CASE1 >
		// String gender= ssn.replace("-","").substring(6,7);
		// int numgender = Integer.parseInt(gender);
		// if(numgender%2 == 0)System.out.println("여자");
		// if(numgender%2 == 1)System.out.println("남자");

		// CASE2 >
		char cgen = ssn.replace("-", "").charAt(6);
		// 123456-1234567 -> 1234561234567 > 123456[1]234567 추출> '1'
		switch (cgen) {
			case '1': // break 생략
			case '3':
				System.out.println("남자^^");
				break;
			case '2': // break 생략
			case '4':
				System.out.println("여자^^");
				break;
			default:
				System.out.println("중성");
		}
	}
	
	public static void main(String[] args) {
		String ssn = "";
		do {
			Scanner sc = new Scanner(System.in);
			System.out.print("주민번호 입력:");
			ssn = sc.nextLine();
		} while (!juminCheck(ssn) || !JunminFirstNumber(ssn));
		// 둘다 true 인경우  > false || false 탈출
		// !true || !true => false || false 탈출
		JuminDisplay(ssn);
	}

}
```

## 2. Protected
    상속관계에서 ... 접근자 : protected

    public 
    private
    default (같은 폴더)
    protected

    protected : 양면성(박쥐) >> default , public 
    >>상속이 없는 클래스 안에서 protected >> default 동일 
    >>결국 상속관계에서만 의미를 가진다 >> public 

    ```java
    import kr.or.kosa.Bird;

//설계자 

class Bi extends Bird {
	
	@Override
	public void moveFast() {
		//마음대로 ...
		super.moveFast(); // 
	}
}

class Ostrich extends Bird {
	//구체화 , 특수화
	void run() {
		System.out.println("run ...");
	}
	
	@Override
	public void moveFast() {
		run();
	}
}

public class Ex09_Inherit_Protected {

	public static void main(String[] args) {
		Bi b = new Bi();
		b.fly();
		b.moveFast();
		//moveFast() 상속관계에서 재정의 하지 않으면  당신은 사용 안되 (강제)

		Ostrich o = new Ostrich();
		o.run();
		o.moveFast();
	}

}
```
```java

package kr.or.kosa;

//새(공통:일반,추상) : 새는 날수 있다 , 새는 빠르다 
public class Bird {
	//공통기능
	public void fly() {
		System.out.println("flying");
	}
	
	//설계자 고민 : Bird [상속]하는 당신은 moveFast 자원에 대해서 [재정의] 했으면 좋겠어 90%
	protected void moveFast() {
		fly();
	}
}
```