/*
원칙 : 객체를 만들 때 생성사는 1개만 호출 가능(new Car() or new Car(10)...)

this(객체) : (여러개의 생성자를 호출 가능)

코드량도 감소
 */

class Zcar{
	String color;
	String geartype;
	int door;
	
	Zcar(){ //default
		this("red","auto",2);	
		System.out.println("default....");
	}
	
	Zcar(String color, String geartype, int door){
		this.color = color;
		this.geartype = geartype;
		this.door = door;
	}
	
	void print() {
		System.out.printf("%s , %s , %d",this.color, this.geartype, this.door);
	}
}

public class Ex20_this {
	public static void main(String[] args) {
		Zcar zcar = new Zcar("Gold","auto",4);
		zcar.print();
		
		Zcar zcar1 = new Zcar();
		zcar1.print();
		
		
	}

}
