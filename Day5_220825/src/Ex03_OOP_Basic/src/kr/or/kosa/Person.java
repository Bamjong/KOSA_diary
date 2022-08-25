package kr.or.kosa;

/*
class == 설계도 == 데이터 타입
설계도는 종이... 구체화 (메모리) ... 객체
구체화된 것 : 객체, 인스턴스

설계도 : field(고유,상태,부품) + method(기능) + constructor(생성자함수)

public class Ex01_Basic{
 	public static void main(String[] args){
 		여기안에다 코드 연습
 		main 이름을 가진 함수안 지역
 		String name="초기화; local variable > 접근자 > 함수가 호출 생성 > 함수 종료 같이 소멸
 		int age = 0;
 */



public class Person {
	public String name;	// default (자동) null
	public int age;	//	default (자동) 0
	public boolean power;	//	default	(자동)	false
	
	/*
	 member field >> instance variable >> 객체변수
	 1. instance variable 초기화를 하지 않아도 된다 >> why >> default 값
	 초기화 : 변수가 처음으로 값을 할당 받는 것
	 질문 : 저 name member field 초기화 하고 싶은데요 가능?  >> 가능합니다! but... 굳이?
	 필요하다면 🥕(당근) 으로 초기화 가능 : public int age = 100
	 
	 Today's point : why 초기화 ...
	 *********	생성되는 객체(사람) 마다, [다른 이름을 가질수 있다]	*********
	 
	 Person member field	당신이 사람을 만들때 마다 다른 값을 가지게 할 것인데 굳이 초기화 시켜야 할것이냐
	 
	 main(){
	 	Person 남자 = new Person(); //사람 1명 생성
	 	남자.name = "김유신";
	 	남자.age = 100;
	 	남자.power = true;
	 	
	 	Person 여자 = new Person(); //사람 2명 생성
	 	여자.name = "유관순";
	 	여자.age = 20;
	 	여자.power = false;
	 	
	 	
	 	*/
	public void personPrint() {
		System.out.printf("이름은 %s 나이는 %d 파워는 %s",name,age,power);
	}
}
