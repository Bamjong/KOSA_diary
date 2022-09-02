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