class Human2{
	String name;
	int age;
}

class Test2{
	Human2 add(Human2 h) {
		//코드는 여러분 마음
		h.name = "으악!";
		h.age = 200;
		return h; //Human 2
		//return null; // Human2는 주소를 가지고 있지 않아요
	}
	
	Human2 add(Human2 h , Human2 h2) {
		h.name = h.name;
		h2.age = h2.age;
		
		return h2;
	}
}


public class Ex14_Method_Overloading {
	public static void main(String[] args) {
		Test2 t = new Test2();
		
		Human2 man = new Human2();
		Human2 man2 = t.add(man);
	  //Human2 man2 = man;
		
		System.out.println(man == man2);
	}
}
