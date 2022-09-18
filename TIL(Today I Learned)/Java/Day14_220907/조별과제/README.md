# 조별 인터페이스 설계(UML 그림 그리기)

    툴 자유 (....) 선택

    하시고 그림 그려서 답글 ....

<br>

<details>
<summary>코드</summary>

```java
interface breed{
boolean bady(); //true : 새끼, false : 알 
}

abstract class Animal{
	abstract void eating();
	abstract void legs();
	abstract void alive();
}


abstract class landPlace extends Animal{
	void alive() {
		System.out.println("걸어다니는 동물입니다.");
	}
}

abstract class seaPlace extends Animal{
	void alive() {
		System.out.println("헤엄치는 동물입니다.");
	}
}

abstract class skyPlace extends Animal{
	void alive() {
		System.out.println("날아다니는 동물입니다.");
	}
}

//육지

class Lion extends landPlace implements breed{
	
	String name;
	int legs;
	
	public Lion() {
		this.name = "사자";
		this.legs=4;
	}
	
	@Override
	public boolean bady() {
		return true;
	}
	
	@Override
		
	void eating() {
		System.out.println("고기를 먹습니다..");
		
	}
	@Override
	void legs() {
		System.out.printf("다리가 %d개입니다.",this.legs);
	}
	void print() {
		System.out.printf("%s는 ",this.name);
		super.alive();
		System.out.printf("%s는 ",this.name);
		eating();
	}
}

//바다

class Turtle extends seaPlace implements breed{
	
	String name;
	int legs;
	
	public Turtle() {
		this.name = "거북이";
		this.legs=4;
	}
	
	@Override
	public boolean bady() {
		return false;
	}
	
	@Override
		
	void eating() {
		System.out.println("산호를 먹습니다.");
		
	}
	@Override
	void legs() {
		System.out.printf("다리가 %d개입니다.",this.legs);
	}
	void print() {
		System.out.printf("%s는 ",this.name);
		super.alive();
		System.out.printf("%s는 ",this.name);
		eating();
	}
}
//공중
class Bat extends skyPlace implements breed{
	
	String name;
	int legs;
	
	public Bat() {
		this.name = "박쥐";
		this.legs=2;
	}
	
	@Override
	public boolean bady() {
		return true;
	}
	
	@Override
		
	void eating() {
		System.out.println("피를 빨아먹습니다.");
		
	}
	@Override
	void legs() {
		System.out.printf("다리가 %d개입니다.",this.legs);
	}
	void print() {
		System.out.printf("%s는 ",this.name);
		super.alive();
		System.out.printf("%s는 ",this.name);
		eating();
	}
}

class makeAnimal{
//	Animal animal;

	public makeAnimal(Animal animal) {
		if(animal instanceof landPlace)
		{
			//함수
		}
		else if(animal instanceof seaPlace)
		{
			
		}
		else {
			
		}
	}
}

public class Zoo {

	public static void main(String[] args) {
//		Bat  bat = new Bat();
//		bat.print();
//		Turtle turtle = new Turtle();
//		turtle.print();
//		Lion lion = new Lion();
//		lion.print();

		Bat  bat = new Bat();
		Turtle turtle = new Turtle();
		Lion lion = new Lion();

	}

}
```

</div>
</details>

이를 바탕으로 Class 다이어그램 작성
![이미지](https://cafeptthumb-phinf.pstatic.net/MjAyMjA5MDdfMjAz/MDAxNjYyNTE4NTIwOTAy.H2v2RZjPyDMZsm2iiIbIjWn98twzd7MmIHrPYmJSK-4g.1GkWnD-qJJMpMJMeX48Bo5ianqsJaJCYBwMOzT7jgIMg.PNG/2%EC%A1%B0.png?type=w1600)

<br><br><Br>

# 조별과제 Class(UML) 그리기
    클래스 다이어그램

    Product

    KtTv

    Audio

    NoteBook
    5 클래스를 그리시고 관계 표시 (상속, 의존 ,연관 ....)



<details>
<summary>코드</summary>

```java
class Product{
	int price;
	int bonuspoint;
	
	Product(int price) {
		this.price = price;
		this.bonuspoint = (int)(this.price / 10.0);
	}
}

class KtTv extends Product{
	KtTv(){
		super(500);
	}

	@Override
	public String toString() {
		return "KtTv";
	}
}
class Audio extends Product{
	Audio(){
		super(100);
	}
	
	@Override
	public String toString() {
		return "Audio";
	}
}
class NoteBook extends Product{
	NoteBook(){
		super(150);
	}
	
	@Override
	public String toString() {
		return "NoteBook";
	}
}


//구매자
class Buyer{
	int money = 1000;
	int bonuspoint;
	
	void Buy(Product n) {  //구매하려는 물건의 정보가 필요
		if(this.money < n.price) {
			System.out.println("고객님 잔액이 부족합니다 ^^" + this.money);
			return; //함수의 종료  (구매행위 종료)   수업 목적상 ....
		}
		//실 구매행위
		this.money -=n.price;
		this.bonuspoint += n.bonuspoint;
		System.out.println("구매한 물건은 : " + n.toString());
	}
}

```
</div>
</details>

### 위 코드를 기반으로 작성한 클래스 다이어그램)
![image](https://user-images.githubusercontent.com/92353613/188844705-4c1574fd-f695-4856-836a-0bedf308d479.png)


<br><br><br>

# UML 자판기 요구사항 만들어 보기

![이미지](https://cafeptthumb-phinf.pstatic.net/MjAyMjA5MDdfMjUz/MDAxNjYyNTM0Mzc4MzI1.Nh1AP1HDs58Piy_1WAAzwVjhtSZHWxiqLlQkZ8gEp9Ag.RzGAHwGCiM5u7WHKVbKOCgpWVhJCsBUgm51BXyymw0wg.PNG/22.09.07__%EC%98%A4%ED%9B%84_%ED%82%A4%EC%98%A4%EC%8A%A4%ED%81%AC.PNG?type=w1600)

위 유스케이스의 시나리오 

	<시나리오>

	관리자는 키오스크에 상품을 등록할 수 있다(Insertingitem). 

	관리자는 키오스크 시스템을 구동할 수 있다. (Starting system)

	관리자는 키오스크 시스템을 종료할 수 있다(Stop System). 

	관리자는 매니징 시스템을 이용할 수 있다(매출확인 등 Managing system) 

	​

	고객은 키오스크에 등록된 상품을 선택할 수 있다.(selecting menu)

	상품을 선택한 후 수량을 선택할 수 있다. (selecting count)

	결제를 할 때 포인트 적립을 할 수도 있다(saving point). 

	사용자가 상품 선택을 완료하면 결제를 할 수 있다. (payment)

	​
	결제가 완료되면 관리자에게 주문이 넘어간다.

위 유스케이스의 기술서

![이미지](https://cafeptthumb-phinf.pstatic.net/MjAyMjA5MDdfMjE0/MDAxNjYyNTM2OTI4MTAz.Y-P3mE3r-UqRrSHlFVo96F1DVTjBpj-0hKYU2pS0Y0Ag.eBIWwj5-Oc8_JKAFGv10uGmiFtac2aLgduQBqXre4NIg.PNG/%ED%82%A4%EC%98%A4%EC%8A%A4%ED%81%AC.png?type=w1600)