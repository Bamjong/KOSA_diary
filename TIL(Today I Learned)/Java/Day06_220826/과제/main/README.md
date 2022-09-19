AirPlane내용
---
    우리 회사는 비행기를 주문 제작 판매 하는 회사입니다
    우리 회사는 비행기를 생산하는 설계도를 만들려고 합니다

    요구사항
    1. 비행기를 생산하고 비행기의 이름과 번호를 부여해야 한다
    2. 비행기가 생산되면 비행기의 이름과 번호가 맞게 부여되었는지 확인 하는 작업이 필요하다(출력)
    3. 공장장은 현재까지 만들어진 비행기의 총 누적대수를 확인 할 수 있다.

    AirPlane air101 = new AirPlane();
    air101 이름 >> 대한한공
    air101 번호 >> 707
    출력 확인..
    5대...


```java
import kr.or.kosa.AirPlane;

public class Ex07_Static_AirPlane {

	public static void main(String[] args) {
		//비행기 3대 만드시고 확인하세요
		AirPlane air1 = new AirPlane();
		air1.makeAirPlane(101, "대한한공");
		air1.airPlaneTotalCount();
		
		AirPlane air2 = new AirPlane();
		air2.makeAirPlane(202, "제주에어");
		air2.airPlaneTotalCount();
		
		AirPlane air3 = new AirPlane();
		air3.makeAirPlane(707, "진에어");
		air3.airPlaneTotalCount();
		
	}

}

```