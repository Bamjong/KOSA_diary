# 2022년 9월 14일 수요일
<br>


## 1. Map(맵 인터페이스) (*08_Ex15_Map_Generic 15~16)
    HashMap만 주로 사용함
    HashMap<k,v>  -- k=key, v=value    

    HashMap<String,String>
    HashMap<Integer,String>
    HashMap<String,Student>		<- Point!

    Generic

    >>put("kglim", new Student());

    class Student { // 클래스 == 데이터 타입

    //실무에서는 Map
    //학생의 성적 데이터
    //kim, [국어, 영어, 수학]	>> Array, Collection (ArrayList (o))
    //value 값은 객체타입 (Emp, Student...) <- value값으로 객체가 들어올 수 있다.

[ 소스 ]
```java
    Map<String, Student> smap = new HashMap<>();
		smap.put("hong", new Student(100, 80, 50, "홍길동"));
		smap.put("kim", new Student(50, 30, 60, "김유신"));
```
    map generic에 Student와 같이 객체타입을 적을수도 있다.

[ Student 소스 ]
```java
class Student{
	int kor;
	int math;
	int eng;
	String name;
	public Student(int kor, int math, int eng, String name) {
		super();
		this.kor = kor;
		this.math = math;
		this.eng = eng;
		this.name = name;
	}
}
```
    이를통해 value 값을 꼭 하나만 적는것이 아닌 여러게 작성하는것도 가능하다


<br><br>

## 2. Properties (*08_Ex17_Properties)

    Map 인터페이스를 구현한 클래스
    특수한 목적: <String><String>		(key, value)타입이 고정...

[ 사용목적 ]
1. APP 전체에 사용되는 자원 관리
2. 환경변수
3. 프로그램 버전
4. 파일 경로
5. 공통변수

[ 클래스 ]
- MAP 계열의 컬렉션 프레임워크와 비슷하게 동작하는 파일
- "Key = Value" 형태로 된 "파일이름.properties" 파일 또는 Xml 파일
- key를 주면 Value를 반환하는 기능을 가짐
- DB의 연결정보 등을 저장해두는 용도로 많이 쓰임
- Enum(열거형) 클래스나 MAP 컬렉션 API와 비슷한 개념의 파일 버전입니다. 코드를 건들이지 않고도 정보를 변경할 수 있다는 강점이 있습니다. 

[ 생성 ]

- 파일을 직접 여는 클래스가 아니므로 FileReader 또는 FileInputStream 객체를 매개변수로 받음
- 외부 리소스와 직접 연결되지 않으므로 '확인된 예외'가 throw되어 있지 않음
- load() 메소드를 통해 파일 정보를 넣어줌

[ 소스 ]
```java
	Properties prop = new Properties();
		prop.setProperty("admin", "kosa@or.kr");
		prop.setProperty("version", "2.x.x.x");
		prop.setProperty("downpath", "C:\\Temp\\images");
		
		// 각각의 개발 페이지에서
		System.out.println(prop.getProperty("admin"));
		System.out.println(prop.getProperty("version"));
		System.out.println(prop.getProperty("downpath"));
```
[ 출력 ]

    kosa@or.kr
    2.x.x.x
    C:\Temp\images

<br><br>

## 3. LinkedList
![이미지](https://dthumb-phinf.pstatic.net/?src=%22http%3A%2F%2Fi.stack.imgur.com%2FskN72.png%22&type=cafe_wa740)

    linkedlist와 arraylist의 가장큰 차이는
    linkedlist 는 각 원소마다 앞,뒤 원소의 위치값을 가지고 있고,
    arraylist 는 index가 있다.

    이러한 각각의 특징은 조회,삽입,삭제시에 성능상의 차이를 발생시킨다.

### 조회(get)

    조회시에 arraylist는 index가 있기 때문에, 조회가 한번에 가능하다,
    그러나 linkedlist의 경우 처음부터 하나씩 다 타고들어가야 되기때문에 뒤에있는 놈을 찾을 수록 오래걸린다.

### 삽입(add)

    arraylist는 마지막에 추가할경우 자체적으로 확장을 하면되고 
    중간에 삽입이 되는 경우는 해당 위치를 기준으로 arraycopy를 진행한다.

### 삭제(remove) 

    arraylist 같은경우에는 내부적으로 remove 해야되는 item을 제외하고 삽입처럼 arraycopy를 시도한다. 반면 linkedlist는 삽입과 마찬가지로 해당 item을 찾아 제거하고, 앞뒤 원소의 위치값만 조정해주면 된다.


![이미지](https://dthumb-phinf.pstatic.net/?src=%22http%3A%2F%2Fwww.programcreek.com%2Fwp-content%2Fuploads%2F2013%2F03%2Farraylist-vs-linkedlist1.png%22&type=cafe_wa740)

    조회시에는 arraylist가 우위지만,
    삽입/삭제 시에는 linkedlist가 뛰어난 성능을 보여준다.   

<br><br>

### ***즉 대량의 삽입삭제가 빈번하게 발생하는 곳에서는 linkedlist를***
### ***db에서 단순히 조회만 할 경우에는 arraylist를 사용하면 된다.***


<br><br><br>


## 4. Wrapper class(래퍼 클래스) (*08_Ex08_Wrapper)

### 자바 8가지 기본 타입(값타입) : JAVA API 제공
    8가지 기본 타입에 대해서 객체 형태로 사용 가능 하도록 만든 클래스(wrapper class)

|기본타입|래퍼클래스|
|-------|---------|
|char|Character|
|boolean|Boolean|
|byte|Byte|
|short|Short|
|int|Integer|
|long|Long|
|float|Float|
|double|Double|

    잘 보면 알수있는건 기본에서 대문자만 적으면 사실상 래퍼 클래스이다. 몇몇개 빼고

 [ 사용 ]
1. 매개변수 객체 요구될때
2. 기본형 값이 아닌 객체 형태로 저장이 필요시
3. 객체간 값 비교
4. 타입 변환시 처리 
    
    generic 안에는 래퍼클래스만 적어야하기 때문에
    int를 안적고 Integer 적는 (객체 형태) > int > Integer

```java
Integer i2 = new Integer(100);
		Integer i3 = new Integer(100);
		System.out.println(i2 == i3); //false // 주소값을 비교
		System.out.println(i2.equals(i3)); //true // 주소를 찿아가서 그 값을 비교
		
		//String  >> 문자열값 비교 >> equals (재정의)
```

## 5. Calendar(캘린더) (*07_Ex09_Calendar)

* Calendar 를 상속받아 완전히 구현한 클래스는 
* GregorianCalendar 
* buddhisCalendar 있는데 getInstance()는 [시스템의 국가와 지역설정]을 [확인]해서

        태국인 경우 buddhisCalendar 의 인스턴스를 반환하고
        그 외에는 GregorianCalendar 의 인스턴스를 반환한다 


        GregorianCalendar 는 Calendar를 상속받아 오늘날 전세계 공통으로 사용하고 있는 
        그레고리력에 맞게 구현한 것으로 태국을 제외한 나머지 국가에서는 GregorianCalendar 사용
        그래서 인스턴스를 직접 생성해서 사용하지 않고 메서드를 통해서 인스턴스를 반환받게하는
        이유는 최소의 변경으로 프로그램 동작을 하도록 하기 위함

[ 소스 ]
```java
class MyApp{
static void main(){
Calendar cal = new GregorianCalendar();
다른 종류의 역법의 사용하는 국가에서 실행하면 변경...... } }
class MyApp{
static void main(){
Calendar cal = new getInstance();
다른 종류의 역법의 사용하는 국가에서 실행하면 변경...... } }
API : 생성자 Protected Calendar() 
```