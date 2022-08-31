package Team_3;

import java.util.Scanner;

public class Program {

	public static void main(String[] args) {
	        boolean run = true;
	        runLotto(run);

	}
	static void runLotto(boolean run) {
        Scanner sc = new Scanner (System.in);

        while (run) {
            System.out.println();
            System.out.println("**로또 추첨 방식을 선택해주세요.**");
            System.out.println("------------------------------");
            System.out.println(" 1. 자동  2. 직접 입력 3. 종료");
            System.out.println("------------------------------");

            int lotto = sc.nextInt();

            Lotto l = new Lotto(new int[6]);

            switch (lotto) {
                case 1 : lotto = 1;
                    System.out.println("'1. 자동'을 선택하셨습니다.");
                    System.out.println();
                    l.auto(); //auto 메소드 실행
                    l.print();//System.out.println("로또 추첨 결과 : " + number); //6개 랜덤 난수 출력
                    System.out.println();

                    break;

                case 2 : lotto = 2;
                    System.out.println("'2. 직접 입력'을 선택하셨습니다.");
                    System.out.println();
                    l.semiAuto(); //semiauto 실행
                    l.print();
                    System.out.println();

                    break;

                case 3 : lotto = 3;
                    System.out.println("프로그램을 종료하겠습니다.");
                    run = false;

                    break;

                default :
                    System.out.println("올바른 숫자를 선택해주세요");
                    break;
            }
        }
    }
}