import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.TreeSet;

/*
Set 인터페이스 (원 안에 들어가세요) : 순서보장(X), 중복 (X)
순서가 없고 중복을 허락하지 않는 데이터 집합
구현하는 클래스
HashSet, TreeSet (자료구조)

 */
public class Ex10_Set {
	public static void main(String[] args) {
		HashSet<Integer> hs = new HashSet<Integer>();
		
		//순서가 없는 [중복되지 않은] 데이터 집합
		hs.add(1);
		hs.add(100);
		boolean bo = hs.add(55);
		System.out.println("정상: " + bo); //정상: true
		
		bo = hs.add(1);
		System.out.println("결과: " + bo); //결과: false  , 이미 원안에는 1이라 데이터가 존재
		
		//중복 .... 로또, 차량번호
		
		System.out.println(hs.toString()); //재정의 [1, 100, 55]
		
		HashSet<String> hs2 = new HashSet<String>();
		hs2.add("J");
		hs2.add("R");
		hs2.add("H");
		hs2.add("w");
		hs2.add("Z");
		hs2.add("b");
		hs2.add("a");
		hs2.add("b");
		
		System.out.println(hs2.toString()); //[a, R, b, w, H, J, Z]
		
		String[] strobj = {"A","B","C","D","B","A"}; //1000건 (1건씩 중복)
		HashSet<String> hs3 = new HashSet<String>();
		for (int i = 0; i < strobj.length; i++) {
			hs3.add(strobj[i]); //중복데이터는 add하지 않는다.  
		}
		
		System.out.println(hs3.toString()); // [A, B, C, D]
		
		
		//Quiz
		//HashSet 1~45까지 난수 6개를 넣으세요
//		int[] lotto = new int[6];
//			
//			for(int i=0; i<lotto.length; i++) {
//				while(true){
//					num = lotto.ran()//난수 추출
//					//난수를 배열에 있는 건지 비교 -> 비교 함수따로 (파라미터로 현재 인덱스, 값)
//					if(verify(lotto, num)){
//						lotto[i] = num;//없으면 배열에 넣음
//						break;
//					}
//				}
//////////////////////////////////////////////////////////////////////////////////////////
		Set<Integer> lotto = new HashSet<Integer>();
		
		while(lotto.size() < 6) {
			lotto.add((int)(Math.random()*45 + 1));
		}
		System.out.println(lotto);
		
		System.out.println();
		
//////////////////////////////////////////////////////////////////////////////////////////
		
		Set<Integer> ran = new TreeSet<Integer>();
		while(ran.size()<6) {
			int num = ((int)(Math.random()*45 + 1));
			ran.add(num);
		}
		
		Iterator<Integer> dom = ran.iterator();
		while(dom.hasNext()) {
			System.out.print(dom.next() + " ");
		}
		
		
		System.out.println();
		System.out.println();
		
//////////////////////////////////////////////////////////////////////////////////////////
		//HashSet 다형성 >> 부모 >> Set
		
		Set set2 = new HashSet();
		
		while(set2.size() < 6) {
			int num  = ((int)(Math.random()*45 + 1));
			set2.add(num); // add 추상함수를 hashSet 클래스 재정의
		}
		System.out.println(set2);
		
//////////////////////////////////////////////////////////////////////////////////////////
		
//		HashSet<String> set3 = new HashSet<String>();
		Set<String> set3 = new HashSet<>();
		
		Iterator<String> st = set3.iterator();
		while(st.hasNext()) {
			System.out.println(st.next());
		}
	}
	
	
}
