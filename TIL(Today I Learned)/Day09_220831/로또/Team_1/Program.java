package Team_1;

import java.util.Scanner;

public class Program {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.println("로또 프로그램을 시작합니다.");
		
		Lotto lotto = new Lotto();

		while(true) {
			
			lotto.printMenu();
			int num = Integer.parseInt(scan.nextLine());
			
			switch(num) {
				case 1:
					lotto.U_number();
					break;
				case 2:
					if(lotto.resultRotto() == -1) 
						System.out.println("아직 사용자 번호를 입력하지 않았습니다.");
					else
						System.out.println(lotto.resultRotto() + "개의 번호를 맞추었습니다.");
					break;
				case 3:
					lotto.printR_num();
					break;
				case 4:
					System.out.println("종료되었습니다.");
					System.exit(0);
				default:
					System.out.println("정확한 번호를 입력해주세요");
			}
			
			System.out.println();
		}
		

	}

}