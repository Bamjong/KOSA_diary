import java.util.Arrays;

/*
배열은 객체다 (Array)
1. new를 통해서 생성
2. 배열은 객체이기 때문에 heap 메모리 생성(관리자원)
3. 고정배열(정적배열) : 배열을 한번 선언하면 (크기가 정해지면) 변경 불가 <-> collection(동적)
4. 자료구조 (알고리즘) 기초적인 학습
 */


public class Ex01_Array_Basic {
	public static void main(String[] args) {
		//같은 타입의 변수 여러개를 선언해서 데이터 처리하세요
		
		int[] score = new int[4];
		//score(101동)
		
		System.out.println(score[0]);
		score[0] = 101;
		score[1] = 20;
		score[2] = 300;
		score[3] = 500;
		
		//Exception in thread "main" java.lang.ArrayIndexOutOfBoundsException: Index 4 out of bounds for length 4
		//score[4] = 111;
		System.out.println(score[3]);
		
		
		//Array 배열 궁합 제어문(for문)
		for (int i = 0; i < 4; i++) {
			System.out.printf("[%d]=%d\t",i,score[i]);
		}
		
		System.out.println();
			
		for (int i = 0; i < score.length; i++) {
			System.out.printf("[%d]=%d\t",i,score[i]);
		}
		
		System.out.println();
		//Tip : Arrays.toString(score) 쓰지마세요 (실력이 감소)
		String resultArray = Arrays.toString(score);
		System.out.println(resultArray);
		
		//Tip
		
		Arrays.sort(score);
		resultArray = Arrays.toString(score);
		System.out.println(resultArray);
		
		//정렬 알고리즘 (최소 버블정렬)
		
		//Today's point
		//배열 생성 3개지
		
		int[] arr1 = new int[5]; // 기본
		int[] arr2 = new int[] {100, 200, 300}; // 초기값을 통해서 배열개수정의하고 값을 할당
		int[] arr3 = {11,22,33}; //컴파일러에게 자동으로 new 부분을 부탁...    <- 이 방법 많이씀
		//Tip) javascript : let cararr = [1,2,3,4,5];
		
		for (int i = 0; i < arr2.length; i++) {
			System.out.println(arr2[i]);
		}
		
		//배열은 객체다 (new ... heap 로드)
		int[] arr4;
		arr4 = new int[] {21,22,23,24,25};
		System.out.println(arr4);  ///I@3b6eb2ec 주소값
		
		int[] arr5 = arr4;
		System.out.println(arr4 == arr5);
		
		//배열의 타입은 : 8가지 기본 + String + 클래스 (타입)
		String[] strarr = new String[] {"가","나","다라마"};
		for (int i = 0; i < strarr.length; i++) {
			System.out.println(strarr[i]);
		}
		
		char[] carr = new char[] {'a','b','c'};
		for (int i = 0; i < carr.length; i++) {
			System.out.println(carr[i]);
		}
	}

}
