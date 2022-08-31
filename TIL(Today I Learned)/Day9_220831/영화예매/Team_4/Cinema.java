package Team_4;

import java.util.Random;
import java.util.Scanner;

public class Cinema {
	// 변수 생성
			private String seat[][];	// 좌석 배열 변수
			private String seatinput;	// 좌석 입력 변수
			private String res[][];		// 예매번호 배열 변수
			private String resinput;		// 예매번호 입력 변수
			private int menuinput;		// 메뉴 입력 변수
			private boolean auto;		// while문 조건 변수
			private Scanner scan;		// Scannner 변수
			private Random r;			// 랜덤 변수
			
			private int point[];		// point[0], point[1]은 현재 선택한 좌석의 배열 좌표 정보 ...
										// 그냥 기능 외적인 부분에 사용할 출력용 변수
			
			//생성자 >> 초기화
			public Cinema(){
				//seat는 스트링 타입 4행 5열 크기로 초기화 한다.
				seat = new String[4][5];
				//seat 배열에 좌석번호를 넣는다.
				for(int i = 0; i<seat.length; i++) {
					for(int j = 0; j<seat[i].length;j++) {
						seat[i][j] = (i+1) + "-" + (j+1);
					}
				}
				//배열의 초기화
				seatinput = "";
				res = new String[4][5];
				
				for(int i = 0; i<seat.length; i++) {
					for(int j = 0; j<seat[i].length;j++) {
						res[i][j] = "";
					}
				}
				resinput = "";
				menuinput = 0;
				auto = true;
				scan = new Scanner(System.in);
				r = new Random();
				point = new int[] {0,0};
				
				//여기까지 초기화
			}
			
			// 메뉴를 출력하고 몇번 메뉴를 골랐는 입력값을 받아 리턴하는 함수입니다.
			private int menuPrint() {
				// 메뉴 출력하기
				System.out.println("*********************");
				System.out.println("****영화 예매 시스템****");
				System.out.println("**********************");
				System.out.println("1. 예매하기");
				System.out.println("2. 조회하기");
				System.out.println("3. 취소하기");
				System.out.println("4. 종료하기");
				//몇번을 선택했는지 menuinput 변수에 넣고 
				menuinput = Integer.parseInt(scan.nextLine());
				
				//입력받은 값을(menuinput) 리턴 
				return menuinput;
			}
			
			//메뉴에서 [1] >> 예매하기 하면 작동되는 함수 .>> 
			//좌석 출력, 좌석 입력, 예매기능을 실행시키는 함수 
			private void seatRun() {
				//좌석출력 함수로 좌석을 출력하고 
				seatPrint();
				
				// 좌석을 입력 받아서
				System.out.println("좌석을 선택해주세요. 예) 1-1");
				System.out.println("이미 예매된 좌석은 '예매'라고 표시됩니다.");
				seatinput = scan.nextLine();
				
				// 예매 함수를 사용해서 예매 시도
				// 예매 함수에 입력받은 좌석값을 넣어 실행 >> 성공.실패시 안내메세지 출력 
				if(seatCheck(seatinput)) {
					//예매 성공시
					System.out.println("예매가 완료되었습니다.");
					System.out.printf("좌석번호 : [%s], 예매번호 : %s\n",seatinput,res[point[0]][point[1]]);
				}else {
					//예매 실패시
					System.out.println("이미 예매된 좌석 또는 없는 좌석입니다.");
				}
			}
			
			// 좌석 출력 함수
			private void seatPrint() {
				//좌석 전체 출력
				for(int i = 0; i< seat.length; i++) {
					for(int j = 0; j< seat[i].length; j++) {
						System.out.printf("[%s]", seat[i][j]);
					}
					System.out.println();
				}
			}
			
			// 입력한 좌석의 예매 유무를 리턴하는 함수
			// 입력한 좌석(input)을 받아 예매를 하고 ... 성공,실패  return 하는 함수
			private boolean seatCheck(String input) {
				//성공인지 실패인지 저장(ck)
				boolean ck = false;
				// 좌석 찾기
				for(int i = 0; i <seat.length; i++) {
					for(int j = 0; j<seat[i].length; j++) {
						if(seat[i][j].equals(input)) { 	//입력한 좌석이 예매 가능한 좌석이면
							
							point[0] = i; point[1] = j; //지금 사용중인 좌석 >> 그냥 출력용 변수에 잠깐 저장
							
							seat[i][j] = "예매";			//그 좌석을 "예매"로 바꾸고
							
							// 랜덤 예매번호 생성
							String ran = Integer.toString(r.nextInt(8) + 1);
							for (int k = 0; k < 7; k++) {
								ran += Integer.toString(r.nextInt(9));
							}
							//생성한 예매번호를 배열에 (해당 좌석 위치)에 넣음
							res[i][j] = ran;
							
							//예매 성공!
							ck = true;
						}
					}
				}
				return ck;	//예매 성공 true, 실패 false return 
			}
			
			// 메뉴에서 [2] >> 조회하기 하면 작동되는 함수
			private void resSearch() {
				// 예매번호를 입력 받음
				System.out.println("예매번호를 입력해주세요");
				resinput = scan.nextLine();
				
				// 입력한 예매번호(resinput)가 예매번호 배열 (res[][]) 에 있는지 찾아보는 기능
				for(int i = 0; i < res.length; i++) {
					for(int j = 0; j<res[i].length; j++)
						// 입력한 예매번호가 있으면
						if(res[i][j].equals(resinput)) {
							// 좌석 출력 후 함수 종료
							System.out.printf("고객님이 예매하신 좌석은 [%d-%d]입니다.\n",i+1,j+1);
							return;
						}
				}
				//없으면 없다고 출력
				System.out.println("입력하신 예매번호는 없는 번호입니다.");
			}
			
			// 메뉴에서 [3] >> 취소하기 하면 작동되는 함수
			private void resDelete() {
				// 예매 번호 입력받기
				System.out.println("예매번호를 입력해주세요");
				resinput = scan.nextLine();
				
				// 입력받은 번호가 있는지 확인
				for(int i = 0; i < res.length; i++) {
					for(int j = 0; j<res[i].length; j++)
						// 입력한 예매번호가 있으면
						if(res[i][j].equals(resinput)) {
							// 좌석 정보 출력 후 취소할지 물어보고
							System.out.printf("고객님이 예매하신 좌석은 %d-%d입니다. 취소하시겠습니까?\n", i+1,j+1);
							System.out.println("1. 예\t2.아니요 중 하나를 입력");
							// 예매 취소면 (1을 입력하면) 
							if(Integer.parseInt(scan.nextLine()) == 1){
								//해당하는 좌석과 예매번호 배열 초기값으로 되돌린다 >> 예매 취소함
								res[i][j] = "";
								seat[i][j] = (i+1) + "-" + (j+1);
								System.out.print("예매가 취소되었습니다.\n");
								return;
							}else {
								//취소 안한다고하면 메뉴로 돌아감
								System.out.println("[아니요] 선택됨");
								return;
							}
						}
				}
				// 입력한 예매 번호가 없는 번호면 
				System.out.println("입력하신 예매번호는 없는 번호입니다.");
			}
			
			// 실행 변수
			public void run() {
				while(auto) {
					// 메뉴 출력 후 입력 받아서 해당하는 기능 실행
					switch(menuPrint()) {
						case 1: seatRun();
							break;
						case 2:resSearch();
							break;
						case 3:
							resDelete();
							break;
						case 4:
							auto = false;
							break;
						default:
							System.out.println("올바른 번호를 입력하세요.");
					}
				}
				System.out.println("프로그램 종료됨");
			}
	
}