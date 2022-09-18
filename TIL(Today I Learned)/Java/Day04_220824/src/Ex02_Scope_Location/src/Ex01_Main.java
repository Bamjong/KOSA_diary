//import kr.or.kosa.common.Airlane; << class 앞에 아무것도 없으면 default라 불러오질못함
import kr.or.kosa.common.AirPlane;
import kr.or.kosa.common.Car;

/*
	 클래스 == 설계도== 타입
	 클래스 구성요소(설계도라고 판단할려면 최소한 무엇을 가지고 있어야한다)
	 필드 + 함수 + 생성자 함수
	 
	 필드(member field) >> 데이터, 정보 담아야한다>>고유정보, 상태정보, 부품정보 >> field>>variable
	 함수(method) >> 기능 (행위)>>자동차>> 달린다, 멈춘다, 소리가 난다.
	 +추가적으로 생성자>> 특수한 목적의 함수>> 객체가 만들어질 때 member field초기화 목적으로
	 
	 클래스, 필드, 생성자, 함수 :영역(범위) >> 접근자, 한정자, 수정자
	 >>public, private, default, protected
	 
	 >>kr.or.kosa.common 안에 Car 클래스 >> public class Car{}>>나 다 오픈할꺼야
	 >>kr.or.kosa.common 안에 Airplane >> class Airplane{>>default class Airplane}
	 >>default 같은 폴더에서는 공유 : [같은 pakage안에서는 오픈][다른 package에선ㄴ 접근 불가]
	 >>default 접근자는 : 같은 폴더(package)내에서 만들어서 연습용
	 
	 하나의 물리적인 java 파일은 여러개의 클래스를 가질 수 있다. 
	 >>Ex01_Main.java  파일은 그 안에 Ex01_Main이라는 클래스를 하나 가지고 있다. 
	 >>일반적으로 필요한 클래스를 별도의 파일로 생성해서 사용...APt.java
	 >>그냥 연습... 해볼 굳이 물리적인 파일 만들필요 있을까
	 하나의 물리적 파일은  여러개의 클래스를 가질 수 있지만 public은 하나의 클래스에서 하나만 가질 수 있다.
	 */
class Emp{
	
}

class Test{//컴파일러가 defaul class Test로 해석
	int data;//지역변수(instance variable)//컴파일러가 deault int data로 해석한다.
	public int p_data;//에러는 아니지만 다른 폴더에서 사용불가... public 의미없다. 
	private int pri_data;//private 감추다. 숨기다, 캡슐화(은닉화)
	
}
public class Ex01_Main {
	public static void main(String[] args) {
		Car car = new Car();
		AirPlane air = new AirPlane();//import 없을 떄 단축기 (ctrl + shilft +o)
		Apt apt = new Apt();
		
		
		
		
	}
	
	

}