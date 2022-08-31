import java.util.Scanner;

public class Ex11_Statement {

	public static void main(String[] args) {
		//반복문 (while, do ~while)
		int i = 10;
		while (i >= 10) {
			/*
			 * 반드시
			 * 증가감을 명시
			 * i--; //증가감의 위치도 고민하자!!
			 */
			i--;
			
			System.out.println("i :" + i);
		}
		//while 1~100까지 합
		int sum = 0;
		int j = 1;
		while(j <= 100) { //for(int j = 1; j <= 100; j++)
			sum +=j;
			j++;
		}
		System.out.println("sum: " + sum);
		
		
		//while 구구단을 출력하세요
		// for(int i= 2; i <= 9; i++)
		//	for(int j = 1; j<= 9; j++)
		int ii = 2;
		int jj = 1;
		
		
		
		
		//while 2개 구구단
		while(ii <= 9) {
			while (jj <= 9) {
				System.out.printf("[%d]x[%d]=[%d]\t", ii,jj,ii*jj);
				jj++;
			}
			System.out.println();
			ii++;
			jj = 1;
		}
		
		
		
		/*
		 * for(;;){}
		 * while(true) {if (조건) break;}
		 * do ~ while : 일단 한번은 강제적으로 수행 하고 ... 그리고 조건을 보고 판단해라
		 * 
		 * 메뉴 구성
		 * 점심 메뉴 선택하세요
		 * 1. 짜장
		 * 2. 짬뽕
		 * 계속 3 입력 메뉴가 다시 나오게 다시입력 받게 ...
		 * 
		 * 프로그램 동작
		 * 당신이 원하는 메뉴 번호를 선택하세요 >> do .. 선택값 받아서
		 * while(input > 2 ) 다시 입력하세요 >> while false 구문을 종료
		 */

		Scanner sc = new Scanner(System.in);
		int inputdata = 0;
		do {
			System.out.println("숫자 입력하세요 (0~9): ");
			inputdata = Integer.parseInt(sc.nextLine()); 
		} while (inputdata >= 10); //true가 되면 계속 do문 실행
		
		System.out.println("당신이 입력한 숫자는: " + inputdata);
		
		
	}
}