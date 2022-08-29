AirPlane내용
---
    자동차 영업소 입니다.

	영업사원은 고객에게 자동차를 팔려고 합니다.

	고객은 자동차의 기본 사양을 살 수 도 있고 ....  여러가지 선택 옵션을 선택 할 수 있습니다.

	자동차의 기본은

	문의 개수 4개 , 자동차의 색상 기본은 red  4개가 기본 입니다

	그런데 고객은

	문의 개수만 변경 가능하고  자동차의 색상 기본은 red  으로 할 수 있고

	문의 개수는 기본으로 하고 자동차의 색상 변경 가능하고

	문의 개수와 자동차의 색상 모든 변경 하여 차를 구매할 수 있습니다

	​

	자동차 구매

	1. 기본 사양  

	2. 옵션 : 문 변경 , 자동차의 색상 기본

	3. 옵션 : 자동차의 색상 변경 , 문 기본

	4. 옵션 : 자동차의 색상 변경 , 문 변경


```java
class Sell_Car{
	int door;
	String color;
	
	public Sell_Car(){
		door = 4;
		color = "red";
	}
	
	public Sell_Car(int d) {
		door = d;
		color = "red";
	}
	
	public Sell_Car(String c) {
		door = 4;
		color = c;
		
	}
	
	public Sell_Car(int d, String c) {
		door = d;
		color = c;
	}
	
	public void carInfoPrint() {
		System.out.printf("주문하신 차량의 옵션은 문 %d개, 색상 %s 입니다.\n", door , color);
	}
	
}

public class Ex16_Consructor_Quiz {
	public static void main(String[] args) {
		Sell_Car car1 = new Sell_Car("blue");
		car1.carInfoPrint();
		
		Sell_Car car2 = new Sell_Car(10, "Gold");
		car2.carInfoPrint();
		

```