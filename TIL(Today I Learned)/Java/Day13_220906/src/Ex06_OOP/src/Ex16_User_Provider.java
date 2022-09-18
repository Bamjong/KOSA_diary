/*
user 사용자 <-> provider 제공자

class A{}
class B{}
관계: A는 B를 사용합니다

1. 상속 : A extends B
2. 포함 : A라는 클래스가 member field B를 사용  class A {B b;} 
	2.1 부분
	2.2 전체
	
	
public class B[]
public class A{
	public int i;
	public B b; //A는 B를 사용합니다 (포함)
	public A(){ //생성자 호출
		b = new B(); // 생성자를 통해서 초기화(주소값)
	}
}

>> main 함수
A a = new A();
a.b.자원

>>포함관계로 사용시
>>B는 독자생성 불가능 >> A라는 객체가 만들어져야 B도 생성
>>A a = new A() 해야만 B객체 생성된다
>>A, B 같은 운명 공동체 (전체집합)
>> 자동차와 엔진, 노트북과 cpu 
---------------------------------------------------------------------
public class B{}
public class A{
	public int i;
	public B b; //A는 B를 사용합니다
	public A() { }
	
	//method
	void m(B b){
		this.b = b;
	}
}
>> main 함수 영역
>> A a = new A();
>> B b = new B();
>> a.m(b);
>> 같은 운명이 아니다
>> 학교(A) 학생(B) (부분집합) , 노트북과 마우스


class A{}
class B{}
관계: A는 B를 사용합니다

A는 B를 참조합니다 (포함관계)
B를 member field 사용

 */

interface Icall {
	void m();
}

class D implements Icall {

	@Override
	public void m() {
		System.out.println("D Icall 인터페이스의 m() 재정의");

	}

}

class F implements Icall {
	@Override
	public void m() {
		System.out.println("F Icall 인터페이스의 m() 재정의");

	}
}
//현대적인 프로그래밍 방식은 (interface가 대세) >> 유연성 >> 대충 만들어도 대충 ...
//>> 느슨하게 ... >> 

class C {
	void method(Icall ic) { //Icall을 구현하는 모든 객체의 주소를 올 수 있다.
		ic.m();
	}
}


public class Ex16_User_Provider {
	public static void main(String[] args) {
		C c = new C();
		D d = new D();	//implements Icall
		F f = new F();	//F implements Icall
		
		
		c.method(d);
		c.method(f);
	}
}
