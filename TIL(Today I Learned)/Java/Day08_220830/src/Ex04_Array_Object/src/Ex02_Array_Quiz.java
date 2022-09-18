import java.util.Iterator;

public class Ex02_Array_Quiz {
	public static void main(String[] args) {
		//국문과 학생들의 기말고사 시험점수입니다
		int[] score = new int[] {79,88,97,54,56,95};
		int max = score[0]; // max -> 79
		int min = score[0]; // min -> 79
		/*
			제어문을 통해서
			max 라는 변수에 시험점수중에 최대값을 담고
			min 라는 변수에 최소값을 담으세요
			출력결과 : max -> 97점	, min -> 54점
			단) for문을 한번만 사용하세요.
		 */
		
		for (int i = 0; i < score.length; i++) {

			if(score[i] > max) {
				max = score[i];
			}
			if(score[i] < min) {
				min = score[i];
			}
			
			//// 위아래 두개는 같은거임

			max = (score[i] > max) ? score[i] : max;
			min = (score[i] < min) ? score[i] : min;
			
		}
		System.out.println("max: " + max);
		System.out.println("min: " + min);
		
		
		int[] numbers = new int[10];
		// 10개의 방의 값을 1 ~ 10까지로 초기화 해라
		// for문을 통해서.. [0] = 1 , [9] = 10
		
		for (int i = 0; i < numbers.length; i++) {
			numbers[i] = i+1;
	
			System.out.println(numbers[i]);
		}
		
		
		
		//어느 학생의 기말고사 시험점수 (5과목)
		
		//1. 총과목의 수
		//2. 과목의 합
		//3. 과목의 평균
		//단 2,3번 문제는 하나의 for문으로 해결하세요.
		int[] jumsu = {100,55,90,60,78};
		int sum = 0;
		float avg = 0f;
		
		for (int i = 0; i < jumsu.length; i++) {
			sum += jumsu[i];
			if(i == jumsu.length -1) { //마지막 방 이라면
				avg = sum / jumsu.length;	
			}
			
		}
		
		System.out.printf("총 과목수: [%d] 총점: [%d] 평균[%d]",jumsu.length,sum,(int)avg);
	}
}
