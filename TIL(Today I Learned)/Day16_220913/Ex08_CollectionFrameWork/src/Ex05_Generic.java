import java.util.ArrayList;

/*
Today's Point
Generic jdk 1.5

C#, Java(필수 기능)

Why)
Collection 타입의 클래스 >> 데이터 기본 저장 공간 타입 : Object
장점 : Object 어떤 값을 넣어도 소화 (String, Emp, int)
단점 : 큰 타입에 대한 문제, 원하는 데이터 타입으로 변경 (Downcasting을 계속해줘야함) ... 불편

1. 타입을 처음부터 강제 ...
2. 타입 안정성 확보 (타입 강제)
3. 강제 형변환 필요 없다 : (Car)Object  (필요없다)

제너릭 적용을 위해서는 설계도부터 적용이 되어야함...
 */

class MyGen<T>{ //T의 의미 >> type parameter  만약 T안에 String을 넣으면 모두다 String으로 자동 형변환됨
	T obj;
	
	void add(T obj) {
		this.obj = obj;
	}
	
	T get() {
		return this.obj;
	}
}

class Person{
	int age = 100;
}


public class Ex05_Generic {
	public static void main(String[] args) {
		MyGen<String> mygen = new MyGen<String>();
		mygen.add("문자열");
		String str = mygen.get();
		System.out.println("문자열 데이터: " + str);
		
		ArrayList list = new ArrayList(); //부모가 Object라 모든걸 다 소화가능
		list.add(10);
		list.add("홍길동");
		list.add(new Person());
		
		//list 값을 출력하세요
		//Person 객체는 나이 출력하고 나머지는 값을 출력
		//개선된 for문
		
		
		for(Object obj : list) {
			//System.out.println(obj);
			if(obj instanceof Person) {
				Person p = (Person)obj;
				System.out.println(p.age);
			} else {
				System.out.println(obj);
			}
		}
		
		 //Generic 타입 강제 : 다 먹지는 못하지만 (한 종류만) >> 
	      ArrayList<Person> plist = new ArrayList<Person>();
	      plist.add(new Person());
	      plist.add(new Person());
	      
	      for(Person p : plist) { //장점 : 타입을 명확히 알고 있음(강제)
	         System.out.println(p.age);
	      }
	      
	      ArrayList<String> slist = new ArrayList<String>();
	      slist.add("문자열");
	   }

}
