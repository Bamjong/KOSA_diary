# 2022년 9월 13일 화요일
<br>


## 1. Generic(제너릭) (*08_Ex05_Generic)

#### 왜 생겨났나요?
    Collection 타입의 클래스 >> 데이터 기본 저장 공간 타입 : Object
    장점 : Object 어떤 값을 넣어도 소화 (String, Emp, int)
    단점 : 큰 타입에 대한 문제, 원하는 데이터 타입으로 변경 (Downcasting을 계속해줘야함) ... 불편

    1. 타입을 처음부터 강제 ...
    2. 타입 안정성 확보 (타입 강제)
    3. 강제 형변환 필요 없다 : (Car)Object  (필요없다)
    
    제너릭 적용을 위해서는 설계도부터 적용이 되어야함...

```java
class MyGen<T>{ //T의 의미 >> type parameter  만약 T안에 String을 넣으면 모두다 String으로 자동 형변환됨
	T obj;

	void add(T obj) {
		this.obj = obj;
	}

	T get() {
		return this.obj;
	}
}


public class Ex05_Generic {
	public static void main(String[] args) {
		MyGen<String> mygen = new MyGen<String>();
		mygen.add("문자열");
		String str = mygen.get();
		System.out.println("문자열 데이터: " + str);
	}
}
```
<br>

## 2. Stack // Queue(스택 / 큐) (*08_Ex06_Stack_Queue 06~07)
![이미지](https://dthumb-phinf.pstatic.net/?src=%22http%3A%2F%2Fcafeptthumb4.phinf.naver.net%2F20150216_25%2Fkscom444_1424085885304BE2Yv_PNG%2Fstack3.png%3Ftype%3Dw740%22&type=cafe_wa740)
![이미지](https://dthumb-phinf.pstatic.net/?src=%22http%3A%2F%2Fcafeptthumb2.phinf.naver.net%2F20150216_297%2Fkscom444_1424085862170kgUNm_PNG%2Fqueue3.png%3Ftype%3Dw740%22&type=cafe_wa740)

### Stack
	스택(Stack)은 데이터를 쌓아올리는 형태로 저장하여 추출할때는 맨 위에 있는 데이터를 먼저 꺼내는 형태이기 때문에 제일 마지막에 저장한 데이터를 제일 먼저 꺼내는 후입선출(LIFO - Last In First Out) 형태의 자료구조이다.

	스택(Stack)은 가장 마지막의 데이터의 위치에 대해 삽입이나 삭제가 발생하므로, 이러한 구조에 사용될 때 간단하며, 더욱 효율적이고 쉽게 사용이 가능하다.

실생활에서 스택의 예) 

- 쌓아놓은 물건은 아래서부터 뺄수없다.

- 인터넷을 하다가 뒤로가기를 누르면 방문한 순서대로 뒤로 간다. 

- 한글문서를 작성하다가 되돌리기를 누르면 방금전에 수행한 동작을 원래대로 되돌린다.

<br>

### Queue
	큐(Queue)는 데이터의 제거는 대기 줄의 가장 앞에서 수행되며 데이터의 삽입은 대기 줄의 가장 뒤에서 수행이 되는 제한된 리스트 구조를 말하며 가장 먼저 삽입된 데이터가 가장 먼저 제거되는 선입선출(FIFO - First In First Out) 형태의 자료구조이다.

실생활에서 큐의 예)

- 버스정류장에서 사람들이 줄을 선대로 버스에 탄다.

- 음식점에서 주문한 순서대로 음식을 받는다. 

<br><br>

## 3. Iterator() (*08_Ex09_Collection_Iterator)
표준화된 인터페이스

	자바의 컬렉션 프레임워크에서 컬렉션에 저장되어 있는 요소들을 읽어오는 방법을 표준화한 것이다.

Iterator 인터페이스

- (반복자)
- [나열된 자원에 대해 순차적으로 접근해서  값을 리턴하는 **표준**을 정의]
- 추상함수로 정의하고 있다 >> 누군가는(ArrayList) >> 추상함수를 구현(표준화된)

Iterator 메소드에는 hasNext(), next(), remove()가 있다.
각각의 기능은 다음과 같다.
 
- hasNext() : 읽어올 요소가 남아있는지 확인하는 메소드이다. 요소가 있으면 true, 없으면 false
- next() : 다음 데이터를 반환한다.
- remove() : next()로 읽어온 요소를 삭제한다.
 
메소드 호출 순서는 hasNext() -> next() -> remove()이다.


## 4. Set (*08_Ex10_Set 10~12)

	Set 인터페이스 (원 안에 들어가세요) : 순서보장(X), 중복 (X)
	순서가 없고 중복을 허락하지 않는 데이터 집합
	구현하는 클래스
	HashSet, TreeSet (자료구조)

|클래스|특징|
|-----|-----|
|**HashSet**|순서가 필요없는 데이터를 hash table에 저장|
|**TreeSet**|저장된 데이터의 값에 따라 정렬됨. red-black tree 타입으로 값이 저장.|


<br><br>

## 5. Map (*08_Ex13_Map_Interface 13~14)

Map 인터페이스

	(Key, value) 쌍의 구조를 갖는 배열
	ex) 지역번호 (key = 02,서울), (key = 032,인천)

조건)

	key 중복(x)		>> 얼추 Set과 비슷
	value 중복(o)		>> 얼추 List와 비슷

	Generic 지원

Map 인터페이스 구현하는 클래스

	구버전 : HashTable (동기화 보장) : 한강 화장실 (lock) 자원 보호
	신버전 : HashMap	 (동기화 강제하지 않아요) 성능고려 (Thread 학습....) ****






List<Product> pcart = new ArrayList<Product>();		//ArrayLIst		
List<Product> pcart = new LinkedList<Product>();	//LinkedList	

Set<String> hs = new HashSet<>();					//HashSet	
Set<Integer> lotto = new TreeSet<>();				//TreeSet	

Map map = new HashMap();							//HashMap