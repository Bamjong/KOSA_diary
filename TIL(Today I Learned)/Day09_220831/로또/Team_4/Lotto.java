package Team_4;

import java.util.Scanner;

public class Lotto {
	// 변수들
		private static int lottoCount = 0;	//로또를 몇번 뽑았는지 저장
		private int[] lotto = new int[6];	//로또 담을 배열
		private int lottocheck = 0;			//로또 배열 위치 변수
		private int lottonum;				//로또 랜덤값 저장 변수
		private int menu;					//메뉴 입력값 저장 변수
		private Scanner scanner = new Scanner(System.in);//스캐너
		private boolean auto = true;		//whlie문 반복용 변수
		
		// 함수
		// 메뉴함수
		private int menuPrint() {	//메뉴를 출력하고, 입력값을 받아 return 합니다.
			System.out.println("*****************************");
			System.out.println(" 1. 로또뽑기 2. Count보기 3. 배수 뽑기 4. 종료");
			System.out.println("*****************************");
			
			//입력 받음
			menu = Integer.parseInt(scanner.nextLine());
			//입력값 리턴
			return menu;
		}
		
		//로또 출력 함수
		private void lottoCreate() {	//로또를 생성하고, 중복값을 체크하고(함수), 정렬(함수) 후 출력합니다.
			//lotto 배열의 현재 위치 변수
			lottocheck = 0;
			//로또 뽑기
			do {
				lottonum = (int)(Math.random() * 45) + 1;	// 1 ~ 45 숫자 뽑기
				
				// 중복값 체크
				if(checkLotto(lotto,lottonum)) {
					//중복이 없으면 값 저장
					lotto[lottocheck++] = lottonum;
				}
				//중복값이 있으면 저장 없이 do로 돌아가서 다시 뽑기	
			}while(lottocheck <6);	//6개 다 뽑았으면 루프 종료
			
			// 뽑은 로또 정렬
			lottoSort(lotto);
			
			//출력
			for(int value : lotto) {
				System.out.printf("[%d]\t",value);
			}
			System.out.println();
			
			lottoCount++;	//뽑은 횟수 늘리기
		}
		
		// 배수 뽑기 기능
		private void lottoNumberCreate(int number) {	//로또를 생성하고, 중복값을 체크하고(함수), 정렬(함수) 후 출력합니다.
			lottocheck = 0;
			//로또 뽑기
			do {
				lottonum = (int)(Math.random() * 45) + 1;
				//입력한 숫자(number)의 배수가 아니면 다시 뽑는다.
				if(lottonum % number != 0) continue;
				// 중복값 체크
				if(checkLotto(lotto,lottonum)) {
					//중복이 없으면 값 저징
					lotto[lottocheck++] = lottonum;
				}
				
				//중복값이 있으면 저장 없이 do로 돌아가서 다시 뽑기	
			}while(lottocheck <6);
			
			// 뽑은 로또 정렬
			lottoSort(lotto);
			
			//출력
			for(int value : lotto) {
				System.out.printf("[%d]\t",value);
			}
			System.out.println();
			
			lottoCount++;
		}
		
		// 중복 체크 함수
		private boolean checkLotto(int[] lotto, int number) {	//배열과 값을 받아 중복값이 있으면 false, 없으면 true return
			// 중복유무 저장용 변수 ck
			boolean ck = true;
			
			// ck에 중복값이 있으면 false, 없으면 true 저장
			for(int value : lotto) {
				if(value == number) ck = false;
			}
			
			// 중복 유무 리턴
			return ck;
		}
		
		// 정렬함수
		private void lottoSort(int[] lotto) {
			for(int i = 0; i< lotto.length; i++) {
				for(int j = i; j<lotto.length;j++) {
					if(lotto[i] > lotto[j]) {
						int temp = lotto[i];
						lotto[i] = lotto[j];
						lotto[j] = temp;
					}
				}
			}
		}
		
		// 실행함수
		public void run() {
			while(auto) {	//auto가 false가 될때까지(4. 종료를 입력할때까지) 루프
				switch(menuPrint()) {	//메뉴 출력 후 입력값을 받아 switch문에 올림
					case 1: lottoCreate();	//1. lottoCreate() >> 로또 번호 출력 함수 실행
						break;
					case 2: System.out.println("지금까지 뽑은 로또는 " + lottoCount + "번입니다.");
						break;
					case 3: //입력한 숫자의 배수에 해당되는 로또번호만 뽑는 기능
							// 숫자 제한(1~45)이 있어 1 ~ 7 사이의 배수만 가능하다.
						System.out.print("원하는 배수를 입력(1~7) >>");	
						int inputnum = Integer.parseInt(scanner.nextLine());
						if (inputnum <1 || inputnum >7) {	//입력 범위를 넘어가면 메뉴로 돌아간다.
							System.out.println("올바른 숫자를 입력하세요");
							break;
						}
						lottoNumberCreate(inputnum);	// 입력한 값의 배수에 해당하는 숫자로만 이루어진 로또 뽑기 함수
						break;
					case 4: auto = false;	//종료
						break;
					default : System.out.println("올바른 숫자를 입력하세요");	//값 범위를 넘어가면 다시 입력 받기
				}
			}
			System.out.println("프로그램 종료됨");
		}
		
		//생성자
		public Lotto(){	//생성됨을 알림
			System.out.println("Lotto Program 실행됨");
		}
}