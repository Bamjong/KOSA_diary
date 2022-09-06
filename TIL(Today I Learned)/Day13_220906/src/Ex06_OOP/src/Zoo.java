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