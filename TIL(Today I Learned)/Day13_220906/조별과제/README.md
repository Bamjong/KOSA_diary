# 조별 과제(인터페이스 설계하기) [주소](https://cafe.naver.com/ArticleRead.nhn?clubid=30787723&page=1&articleid=269&referrerAllArticles=true)

    동물

    동물은 살아있다.

    동물은 이름을 가지고 있다.

    동물은 소리를 낸다.

    다리개수

    ​

    사는곳 

    육지                       해상                          공중

    땅에 산다             바다에 산다                공중에 산다

    ​

    동물이름

    ex)사자                    고래                         박쥐

    다리가 4개              다리 0개                     다리 2개

    ​

    ​

    추상클래스

    동물, 사는곳

    ​

    클래스

    동물이름 

    ​

    상속 순서

    (동물-> 사는곳(육,해,공) -> 동물이름

                다리개수     ->2개 or 4개)

    ​

    ​

    인터페이스

    새끼 낳는 방법(새끼 or 알)

    ex) 고래와 박쥐는 포유류로 묶을수 있다!

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
		Bat  bat = new Bat();
		bat.print();
		Turtle turtle = new Turtle();
		turtle.print();
		Lion lion = new Lion();
		lion.print();

//		Bat  bat = new Bat();
//		Turtle turtle = new Turtle();
//		Lion lion = new Lion();

	}

}
```


### 출력

    박쥐는 날아다니는 동물입니다.
    박쥐는 피를 빨아먹습니다.
    거북이는 헤엄치는 동물입니다.
    거북이는 산호를 먹습니다.
    사자는 걸어다니는 동물입니다.
    사자는 고기를 먹습니다..