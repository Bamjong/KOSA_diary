# 조별 인터페이스 설계(UML 그림 그리기)

    툴 자유 (....) 선택

    하시고 그림 그려서 답글 ....

<br>

우리조가 작성한 코드
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

이를 바탕으로 Class 다이어그램 작성
![이미지](https://cafeptthumb-phinf.pstatic.net/MjAyMjA5MDdfMjAz/MDAxNjYyNTE4NTIwOTAy.H2v2RZjPyDMZsm2iiIbIjWn98twzd7MmIHrPYmJSK-4g.1GkWnD-qJJMpMJMeX48Bo5ianqsJaJCYBwMOzT7jgIMg.PNG/2%EC%A1%B0.png?type=w1600)

<br><br><Br>

# 클래스 실습

## 조별과제 Class(UML) 그리기
    클래스 다이어그램

    Product

    KtTv

    Audio

    NoteBook
    5 클래스를 그리시고 관계 표시 (상속, 의존 ,연관 ....)




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

![image](https://user-images.githubusercontent.com/92353613/188844705-4c1574fd-f695-4856-836a-0bedf308d479.png)


