import java.util.Scanner;

public class Ex12_Statement_Quiz {
	public static void main(String[] args) {
		//메뉴를 보여주고 사용자에게 선택 ....
		//다른 것을 선택하면 다시 선택하도록 강제 메뉴
		//while(true)
		//do ~ while()
		
		boolean auto = true;
		int balance = 0; //잔액
		Scanner sc = new Scanner (System.in);
		
		while(true) {
			System.out.println("********************************");
			System.out.println("1.예금 | 2.출금 | 3.잔고 | 4.종료");
			System.out.println("********************************");
			
			System.out.print("선택하세요: ");
			
			int input = Integer.parseInt(sc.nextLine());
			
			//판단
			
			switch (input) {
			case 1: System.out.print("얼마를 넣으시겠습니까?: ");
					balance += Integer.parseInt(sc.nextLine());
					break;
				
			case 2: System.out.print("얼마를 빼시겠습니까?: ");
					balance -= Integer.parseInt(sc.nextLine());
					break;
					
			case 3: System.out.println("당신의 잔고는 "+ balance + " 입니다.");
					break;
				
			case 4: System.out.println("다음에 또 이용해주세요 감사합니다 :)");
					auto = false;
					break;

			default:System.out.println("올바른 메뉴를 선택하세요");
					break;
			}
			
			if(auto == false) {
				break; // 또는
			}
			
			//참고
			/*
			 if(opr.equals("+")) {  //POINT 문자열의 비교는 == 아니고 (x) , equals (String) >> String  클래스
				  result = input_1 + input_2;
				  
			  }else if(opr.equals("-")) {
				  result = input_1 - input_2;
				  
			  }else if(opr.equals("*")) {
				  result = input_1 * input_2;
				  
			  }else if(opr.equals("/")) {
				  result = input_1 / input_2;
			  }else {
				  System.out.println("지원하지 않는 연산자 입니다");
				  //key point (여기서는 main 함수)
				  //return 키워드 :  [함수단위]의 종결자  > main 함수 탈출 > 종료
				  return ;
				 
				  //System.exit(0); //강제적인 프로그램 종료
				  
			  }
			*/
		}
		

	}

}