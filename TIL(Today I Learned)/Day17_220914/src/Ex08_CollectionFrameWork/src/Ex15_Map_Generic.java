import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/*

HashMap<k,v>

HashMap<String,String>
HashMap<Integer,String>
HashMap<String,Student>		<- Point!

>>put("kglim", new Student());

class Student { // 클래스 == 데이터 타입
 */

class Student{
	int kor;
	int math;
	int eng;
	String name;
	public Student(int kor, int math, int eng, String name) {
		super();
		this.kor = kor;
		this.math = math;
		this.eng = eng;
		this.name = name;
	}
}

class ArrayTest{
	
	//주의사항
	//Generic 타입으로 배열 가능
	List<String[]> al = new ArrayList<String[]>();
}

public class Ex15_Map_Generic {
	public static void main(String[] args) {
		Map<String, String> sts = new HashMap<>();
		sts.put("A","AAA");
		
		System.out.println(sts.get("A"));
		
		//실무에서는 Map
		//학생의 성적 데이터
		//kim, [국어, 영어, 수학]	>> Array, Collection (ArrayList (o))
		//value 값은 객체타입 (Emp, Student...) <- value값으로 객체가 들어올 수 있다.
		
		
		//Today's point
		Map<String, Student> smap = new HashMap<>();
		smap.put("hong", new Student(100, 80, 50, "홍길동"));
		smap.put("kim", new Student(50, 30, 60, "김유신"));
		
		Student sd = smap.get("hong");
		
		System.out.println(smap.get("hong"));
		System.out.println(sd.kor);
		System.out.println(sd.math);
		
		ArrayTest at = new ArrayTest();
		String[] starr = {"A","B","C"};
		at.al.add(starr);
		

		//Tip
		Set set = smap.entrySet();		//Map key, value 가공 >> key+"="+value
		Iterator it = set.iterator();
		while(it.hasNext()) {
			System.out.println(it.next());
		}
		
//		hong=Student@6504e3b2
//		kim=Student@5e91993f
		
		//Tip key, value 분리되서 결과를 보고 싶어요
		//class Entry{Object key, Object value}
		//Map {Entry[] elements} >> Map.Entry
		for(Map.Entry m : smap.entrySet()) {
			System.out.println(m.getKey() + "/" + ((Student)m.getValue()).name);
		}
		
	}
}
