import java.util.ArrayList;

import kr.or.kosa.Emp;

public class Ex03_ArrayList_Object {
	public static void main(String[] args) {
		//1. 사원 1명을 만드세요.
		
		Emp emp = new Emp(1000, "김유신","장군");
		System.out.println(emp.toString());
		
		System.out.println();
		
		//2. 사원 2명을 만드세요.
		Emp[] emp2 = {new Emp(100,"김씨","영업"),new Emp(200,"박씨","IT")};
		for(Emp e : emp2) {
			System.out.println(e.toString());
		}
		
		System.out.println();
		//3. 사원이 1명 더 입사를 했어요 (300,"이씨","IT")
		//방 3개 배열 생성 -> 이사 ...
		
		//ArrayList
		ArrayList elist = new ArrayList();
		elist.add(new Emp(100,"김씨","영업"));
		elist.add(new Emp(200,"박씨","IT"));
		elist.add(new Emp(300,"이씨","IT"));
		
		for (int i = 0; i < elist.size(); i++) {
			System.out.println(elist.get(i).toString());
			
			Emp e = (Emp)elist.get(i);
			e.toString();
		}
		
		System.out.println();
		
		elist.add(new Emp(400,"최씨","관리"));
		
		//toString() 사용하지 말고 4명 사원의 사번, 이름, 직종을 출력하세요.
		//for 문 안에서 getEmpno, getEname(), getJob()
		for (int j = 0; j < elist.size(); j++) {
			Object obj = elist.get(j);
			//obj.toString()
			//Object 모든 타입의 부모타입 (down casting)
			Emp e = (Emp)obj;
			System.out.println(e.getEmpno() + "." + e.getEname() + "." + e.getJob());
		}
		
		//현업 개발자 ... (Object 타입) ... downcasting .. 자식요소 접근
		//Object 쓰지 말자 ... 대안
		//타입 강제 (그 타입만 쓰게하자)
		//제너릭 (객체 생성시 타입 강제 방법)
		ArrayList<Emp> list2 = new ArrayList<Emp>();
		//list2.add(emp);
		list2.add(new Emp(1,"A","IT"));
		
		for(Emp e : list2) {
			System.out.println(e.getEmpno());
		}
	}
}
