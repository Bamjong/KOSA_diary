import java.util.Scanner;

import kr.or.kosa.Eggmayo;

public class Subway {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int userPay = 0;
		
		Eggmayo eggmayo = new Eggmayo();
		
		eggmayo.printInfo();
		eggmayo.eggAdd();
		eggmayo.eggAdd();
		eggmayo.eggSubtract();
		eggmayo.printInfo();
		
		while(eggmayo.end == 0) {
		System.out.print("돈을 넣어주세요: ");
		userPay = Integer.parseInt(sc.nextLine());
		eggmayo.priceCheck(userPay, eggmayo.price);
		}
		
		
	}
}
