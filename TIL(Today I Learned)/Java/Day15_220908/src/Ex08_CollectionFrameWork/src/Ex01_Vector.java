import java.util.Iterator;
import java.util.Vector;

/*
Collection FrameWork
다수의 데이터를 다루는 [표준화된 인터페이스]를 구현하고 있는 [클래스 집합]

Collection 인터페이스	-> 상속 List (구현: ArrayList), Set (구현: HashTable, HashSet), 

- ArrayList 부모타입은 List 이다 (Ok) >> 다형성
- Collection 은 ArrayList 부모타입이다 (Ok) >> 다형성

Map 인터페이스 (Key,value) 쌍의 배열 -> (구현: HashMap)

1. List (줄을 서시오)
	- 순서(번호표), 중복(허용) > 내부적으로 데이터 (자료) > 배열(Array)관리 > [홍길동][0] , [홍길동][1], [홍길동][2]
	
	1.1 Vector(구버전) -> 동기화 보장 (멀티 스레드) -> Lock(장치)보호 -> 성능 조금 -> 한강 화장실
	1.2 ArrayList(신버전) -> 동기화 보장(멀티 스레드) -> Lock옵션 (기본 Lock(x)) -> 성능 우선 -> 한강 비빔밥 축제

기존 다수의 데이터를 다루는 방법: Array (정적, 고정)
기존 배열은 방의 개수가 한번 정해지면 방의 크기는 변경 불가

int[] arr = new int[5];
arr[0] = 100;
int[] arr2 = {10, 20, 30}
데이터가 많아지면 새로운 크기의 배열 만들고 데이터 이동 (코드로 직접 구현) ***

Array
1. 배열의 크기가 고정: Car[] cars = {new Car(), new Car()}; 방 2개
2. 접근 방법 (index 첨자) 방번호 접근 : cars[0] ,,, n(length-1)방


List 인터페이스를 구현하고 있는(Vector, ArrayList)
1. 배열의 크기를 동적으로 확장 or 축소가 가능  >>   진실은 컴파일러가 새로운 배열을 만들고 데이터 이동을 알아서
2. 순서를 유지 (내부적으로 Array를 사용), 중복값 사용
3. 데이터 저장 공간 : Array 사용
 */
public class Ex01_Vector {
	public static void main(String[] args) {
		Vector v = new Vector();
		System.out.println("초기 default 용량: " + v.capacity());  // 기본 10개 방 만듬
		System.out.println("Size: " + v.size()); //0	(실 데이터 크기)
		
		v.add("AA");
		v.add("AA");
		v.add("AA");
		v.add(10);
		
		System.out.println("Size: " + v.size());
		System.out.println(v.toString()); //[AA, AA, AA, 10] 재정의 데이터 출력
		//Array >> length >> 편법적으로 index 개념을 만들어서 마치 사이즈(size) 처럼
		//Collection >> size
		for(int i = 0; i < v.size(); i++) {
			System.out.println(v.get(i)); // get(index) 값을 return : 정적 array[index]
		}
		//개선된 for문 출력
		for(Object obj : v) {
			System.out.println(obj);
		}
		//단점: 작은 데이터 (같은 타입의 데이터) ... 가장 큰타입을 사용하는 것 불합리
		//Generic(제네릭) >> 타입을 강제 >> 추후 별도로 학습할 것(Point)
		Vector<String> v2 = new Vector<String>();
		v2.add("hello");
		//v2.add(123); // 오류남
		v2.add("world");
		
		for(String a : v2) {
			System.out.println(a);
		}
		
		Vector v3 = new Vector();
		System.out.println(v3.capacity()); // 10개
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A"); // 11번째
		
		System.out.println(v3.toString());
		System.out.println(v3.capacity());
		
		//증명 : 그냥 쓰시면 돼요 (지가 알아서 늘리고 하니 ... )
	}
}
