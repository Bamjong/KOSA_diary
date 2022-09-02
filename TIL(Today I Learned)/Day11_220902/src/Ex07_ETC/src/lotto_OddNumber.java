
public class lotto_OddNumber {
	public static void main(String[] args) {
		
		int [] lotto = new int[6];
		
		int cnt = (int)(Math.random() * (45 - 1 + 1) + 1); // a[0]초깃값 설정변수
		int i = 0; //while 기준 변수
		
		//////////////////////////////////////////////////////
		
		// 홀수 로또 번호
		
		while(i<lotto.length) {			// while(1 < 6)
			if(cnt % 2 != 0) {		// 초깃값이 홀수면
				lotto[i] = cnt;			// 홀수 넣어주고
				i++;				// 그 다음으로 넘어가고
				cnt = (int)(Math.random() * (45 - 1 + 1) + 1);	//다음 랜덤수 돌려주기
				}
			else {
				cnt = (int)(Math.random() * (45 - 1 + 1) + 1);	//짝수면 초깃값 재설정 후 while 돌리기
			}
		}
		
		for(int arr : lotto) {                // lotto[] 배열 값 확인용
			System.out.print(arr + " ");
		}
		
	}
	
}

