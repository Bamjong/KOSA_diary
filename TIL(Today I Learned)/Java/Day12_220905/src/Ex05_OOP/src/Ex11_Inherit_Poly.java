class Pbase{
	int p = 100;
}
class Cbase extends Pbase{
	int c = 200;
}

class Dbase extends Pbase{
	
}

public class Ex11_Inherit_Poly {
	public static void main(String[] args) {
		//[상속관계]에서 [하나의 참조변수]가 [여러개의 타입]을 가질 수 있는 것
		Cbase cbase = new Cbase();
		System.out.println(cbase.toString());
		
		Pbase p = cbase; // 다형성
		//상속관계에서 부모타입의 변수는 자식타입의 주소를 가질 수 있다.
		
		Dbase dbase = new Dbase();
		
		p = dbase; //다형성
		System.out.println(p.toString());
		
		Cbase c = (Cbase)p; // down(부모 > 자식으로(
}
