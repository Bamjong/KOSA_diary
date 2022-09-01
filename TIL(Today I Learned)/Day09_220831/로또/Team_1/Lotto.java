package Team_1;

import java.util.Scanner;

public class Lotto {
	private int R_num[] = new int[6]; //로또 정답
	private int U_num[] = new int[6]; //사용자 입력 받기
	
	//default 생성자
	public Lotto() {
		R_number();
	}
	
	//메뉴판 출력
	public void printMenu() {
		System.out.println("1. 추첨 || 2. 결과 보기 || 3. 로또 담청 번호 확인 || 4. 종료");
		System.out.print("번호를 선택해주세요 : ");
	}
	
	//6가지 난수 발생
	//로또 정답 생성
	private void R_number() {
		for(int i=0; i<R_num.length; i++) {
			R_num[i] = ((int)(Math.random()*45)+1);
			for(int j=0; j<i; j++){		//중복값 판별
				if(R_num[i] == R_num[j]) {
					i--;
					break;
				}
			}
		}
		sortNumber(R_num); //정렬
	}
	
	//사용자 로또 번호 받아서 저장
	public void U_number() {
		System.out.println("로또 번호 6자리를 입력해주세요");
		Scanner scan = new Scanner(System.in);
		
		for(int i=0; i<U_num.length; i++) {
			System.out.print((i+1) + "번 번호 입력 : ");
			U_num[i] = Integer.parseInt(scan.nextLine());

			if(U_num[i] < 1 || U_num[i] > 45) {				//올바른 로또 수 판별
				i--;
				System.out.println("로또 번호는 1~45사이의 수를 입력할 수 있습니다.");
				System.out.println("다시입력해주세요");
			}	

			for(int j=0; j<i; j++){			//중복값 판별
				if(U_num[i] == U_num[j]) {
					i--;
					System.out.println("중복값을 입력하셨습니다.");
					System.out.println("다시 입력해주세요");
					break;
				}
			}
		}
		sortNumber(U_num);
	}
	
	//번호 정렬
	private void sortNumber(int[] num) {
		int tmp=0;
		for(int i=0; i<num.length; i++) {
			for(int j=1; j<num.length-i; j++) {
				if(num[j] < num[j-1]) {
					tmp = num[j];
					num[j] = num[j-1];
					num[j-1] = tmp;
				}
			}
		}
	}
	
	//결과 보기
	public int resultRotto() {
		int sum = 0;
		if(U_num[0] == 0) {
			sum = -1;
		}
		else {
			for(int i=0; i<R_num.length; i++) {
				for(int j=0; j<U_num.length; j++) {
					if(U_num[j] == R_num[i]) {
						sum++;
					}else if(U_num[j] > R_num[i]) {
						break;
					}
				}
			}
		}
		
		return sum;
	}
	
	//로또 번호 확인
	public void printR_num() {
		System.out.println("***담청 번호***");
		for(int i=0; i<R_num.length; i++) {
			System.out.print(R_num[i] + " ");
		}
		System.out.println();
		System.out.println("***입력 번호***");
		for(int i=0; i<R_num.length; i++) {
			System.out.print(U_num[i] + " ");
		}
		System.out.println();
	}
}