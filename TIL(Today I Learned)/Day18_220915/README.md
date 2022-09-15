# 2022년 9월 15일 목요일
<br>


## 1. Calendar Format(캘린더 포맷) (*07_Ex10_Format_Date)


### [Date]
```java
Date currdate = new	Date();
System.out.println("date: " + currdate);
//date: Thu Sep 15 09:20:32 KST 2022 날짜형식
```
- Date는 옛날 자바가 날짜를 출력하기 위함이었던것.
- 옛날것이기 때문에 요즘은 잘 안씀
- 그래서 새로나온것이 Calendar

<br>

### [Calendar]
```java
Calendar cal = Calendar.getInstance();
		System.out.println("cal: " + cal);
		//cal: java.util.GregorianCalendar[time=1663201258423,areFieldsSet=true,areAllFieldsSet=true,lenient=true,zone=sun.util.calendar.ZoneInfo[id="Asia/Seoul",offset=32400000,dstSavings=0,useDaylight=false,transitions=30,lastRule=null],firstDayOfWeek=1,minimalDaysInFirstWeek=1,ERA=1,YEAR=2022,MONTH=8,WEEK_OF_YEAR=38,WEEK_OF_MONTH=3,DAY_OF_MONTH=15,DAY_OF_YEAR=258,DAY_OF_WEEK=5,DAY_OF_WEEK_IN_MONTH=3,AM_PM=0,HOUR=9,HOUR_OF_DAY=9,MINUTE=20,SECOND=58,MILLISECOND=423,ZONE_OFFSET=32400000,DST_OFFSET=0]
```

- Calendar를 선언하고 그대로 출력하면 엄청 길게 나옴
- 그렇기에 캘린더는 Date처럼 그냥 쓰는게 아닌 매소드를 통해 잘라주어야함
- 날짜형식으로 포맷을 위해 getTime()을 이용

<br>

### [getTime()]
```java
System.out.println("cal getTime() 함수: " +cal.getTime());
		//cal getTime() 함수: Thu Sep 15 09:21:29 KST 2022
```

- getTime() 을 이용해서 date와 같은 시간이 출력되는걸 볼 수가 있음.

<br>

### [SimpleDateFormat]
```java
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd-HH/mm");
    
    String s = dateFormat.format(currdate);			//2022-09-15-09/24
    //currdate는 date클래스로 뽑아낸것
    String s2 = dateFormat.format(cal.getTime());	//2022-09-15-09/24
```

- 위와같이 SimpleDateFormat("yyyy-MM-dd-HH/mm"); 괄호안에 적은 내용대로 원하는 날짜 출력 가능


<br><br>


## 2. Decimal Format (소수 포맷) (*07_Ex11_Format_ETC)

### [DecimalFormat]
```java
double money = 123456.5678;

DecimalFormat df = new DecimalFormat("0.0"); //123456.6  반올림
DecimalFormat df2 = new DecimalFormat("0");	//123457 반올림
DecimalFormat df3 = new DecimalFormat("0.000000"); //123456.567800 없는 자리는 0으로 채움
DecimalFormat df4 = new DecimalFormat("#.#######"); //123456.5678 
```

- DecimalFormat을 통해 소수점 몇부터 반올림 할건지 정할 수 있음.

<br>

### [MessageFormat]
```java
String userId = "kglim";
String userName = "홍길동";
String userTel = "010-111-1111";
String message = "회원 Id : {0} \n회원 이름 : {1} \n회원 전화번호 : {2}";
String result = MessageFormat.format(message, userId, userName, userTel);

System.out.println(result);
```

[출력]

    회원 Id : kglim 
    회원 이름 : 홍길동 
    회원 전화번호 : 010-111-1111


- message를 포맷 맨 앞에다 적어줘야 제대로 출력이 된다.

<br><br>

## 3. I/O (Input/Output) (입출력) (*09_Ex01_Stream 01~06)

### Steram(스트림)

![이미지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbvH00I%2FbtqydR4e1Ju%2FDaCDExX0OKOaZquiHWzWLK%2Fimg.png)

- 자바에서 데이터는 스트림을 통해 입출력함
- 프로그램이 데이터의 출발지인지 도착지인지의 여부에 따라
- 스트림은 '데이터의 흐름’입니다. 배열 또는 컬렉션 인스턴스에 함수 여러 개를 조합해서 원하는 결과를 필터링하고 가공된 결과를 얻을 수 있습니다.

***즉, 배열과 컬렉션을 함수형으로 처리할 수 있습니다.***

<br>

![이미지](https://mblogthumb-phinf.pstatic.net/MjAxNzAzMDdfMzcg/MDAxNDg4ODc1NTU1NzYz.Jh8-r-RQcxjkX0W2LKMtVT-1BDD1kHl9MwLqEflkySgg.i0cmhOjAE8R72W9oY_VuQVCpsPAndzgmFDgnIGkDvYsg.PNG.mcm1092/%EB%B0%94%EC%9D%B4%ED%8A%B8%EC%8A%A4%ED%8A%B8%EB%A6%BC_%EB%AC%B8%EC%9E%90%EC%8A%A4%ED%8A%B8%EB%A6%BC.png?type=w800)

바이트 기반 스트림
- 그림, 멀티미디어 등의 바이너리 데이터를 읽고 출력

문자 기반 스트림
- 문자 데이터를 읽고 출력할 때 사용


***Stream이 있으면 바이트 기반 없으면 문자 기반***

<br>

    Byte 데이터를 read, write >> 그 대상이 >> File
    FileInputStream
    FileOutputStream

    (이미지, 엑셀파일) read, write

    File >> 1.txt, data.txt (데이터를 파일에 기록)


    FileInputStream fs = null; 굳이 이렇게 하는 이유

    I/O 클래스는 예외를 강제 해야하기 때문에 하는거임

    I/O 자원은 개발자가 직접적으로 자원에 해제 (여러 사용자들이 접근 사용 가능)
    >> close() 