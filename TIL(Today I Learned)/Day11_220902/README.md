# 2022년 9월 2일  금요일
<br>


## 1. String Class(스트링 클래스)  (*05_Ex01_Inherit 01~03···)
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