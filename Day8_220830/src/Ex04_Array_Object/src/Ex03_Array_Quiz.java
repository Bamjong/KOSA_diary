/*
1. 1~45 까지의 난수를 발생시켜서 6개의 정수값을 배열에 담으세요  완료!
2. 배열에 담긴 6개의 배열값은 중복값이 나오면 안됨. (중복값 검증)
3. 배열에 있는 6개의 값은 낮은 순으로 정렬 시키세요(정렬 : 자리바꿈)
4. 위 결과를 담고있는 배열을 출력하세요

main함수 안에서 모두 작성하셔도 되고요

static 함수를 만들어 기능 나누는거 허용

별도의 Lotto.java 클래스 생성 x
 */


public class Ex03_Array_Quiz {
	public static void main(String[] args) {
		
		int[] lotto = new int[6];
		int temp = 0;
		
		for (int i = 0; i < lotto.length; i++) {  //랜덤 난수 생성
			lotto[i] = (int)(Math.random() * (45 - 1 + 1) + 1); //(int) Math.random() * (최댓값-최소값+1) + 최소값
			for (int j = 0; j < i; j++) {
				if(lotto[i] == lotto[j]) {
					i--;
				}
			}
		}
		
		for (int i = 0; i < lotto.length; i++) {
			for (int j = 0; j < i; j++) {
				if(lotto[i] < lotto[j]) {
					temp = lotto[i];
					lotto[i] = lotto[j];
					lotto[j] = temp;
				}
			}
		}
		
		for (int i = 0; i < lotto.length; i++) {
			System.out.print(lotto[i] + " ");
		}

	}
}
	
