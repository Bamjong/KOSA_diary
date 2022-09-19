import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

/*
AllDay's Point
 */
public class Ex02_ArrayList {
	public static void main(String[] args) {
		//ArrayList : List 인터페이스 구현 (순서보장, 중복데이터 허용)
		
		ArrayList arraylist = new ArrayList();
		//Object 타입으로
		arraylist.add(100);
		arraylist.add(200);
		arraylist.add(300);
		
		for (int i = 0; i < arraylist.size(); i++) {
			System.out.println(arraylist.get(i));
		}
		System.out.println(arraylist.toString());
		
		//add 함수는 순차적으로 데이터 넣기
		arraylist.add(0,111);
		System.out.println(arraylist.toString());
		arraylist.add(4,444);
		System.out.println(arraylist.toString());
		/*
		**비순차적인 데이터 추가, 삭제 >> ArrayList 자료구조에 적합x >> 순서가 있는 데이터 집합이 좋아요!
		**순차적인 데이터 추가, 삭제 ^^
		
		arraylist.remove(111); 111을 index로 판단해 111번째 방을 삭제한다는 뜻이므로 오류 생김
		[111, 100, 200, 300, 444]
		ArrayList 함수 공부 (초급)
		*/
		System.out.println(arraylist.contains(200)); //true
		System.out.println(arraylist.contains(2000)); //false
		
		arraylist.clear();//데이터 삭제 (공간은 남아 있어요)
		System.out.println(arraylist.size()); //0
		System.out.println(arraylist.isEmpty()); //true
		
		arraylist.add(101);
		arraylist.add(102);
		arraylist.add(103);
		
		System.out.println(arraylist.isEmpty()); //false
		System.out.println(arraylist.size()); //3
		Object value = arraylist.remove(0); //101삭제 ... 자리바꿈
		System.out.println(arraylist.toString());
		
		/*
		POINT
		인터페이스 부모 타입
		개발자 습관적으로 .. 다형성 (확장성, 유연성)
		 */
		
		List li = new ArrayList();	//습관적으로 부모타입
		//ArrayList List li = new ArrayList();
		li.add("가");
		li.add("나");
		li.add("다");
		li.add("라");
		
		System.out.println(li.toString());
		List li2 = li.subList(1, 3);	// subList 함수는 내부적으로 new ArrayList() 생성
		System.out.println(li2.toString());
		
		List alist = new ArrayList();
		alist.add(50);
		alist.add(1);
		alist.add(7);
		alist.add(40);
		alist.add(46);
		alist.add(3);
		alist.add(15);
		
		System.out.println(alist.toString());//	[50, 1, 7, 40, 46, 3, 15]
		
		Collections.sort(alist); //내부적으로 정렬	>> 초급개발자 프로젝트 시 쓰면 감점....
		
		System.out.println(alist.toString());//	[1, 3, 7, 15, 40, 46, 50]
		//높은 값으로 정렬해보시오.
		Collections.reverse(alist);
		System.out.println(alist.toString());//	[50, 46, 40, 15, 7, 3, 1]

		
	}
}
