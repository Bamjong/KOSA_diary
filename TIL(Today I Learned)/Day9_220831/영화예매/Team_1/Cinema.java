package Team_1;

import java.util.Scanner;

public class Cinema {
Scanner scan = new Scanner(System.in);
	
	public String seat1[][];
	public String seat2[][];
	private int movie;
	private int x, y;
	private String password;
	
	//생성자
	public Cinema() {
		seat1 = new String[5][5];
		seat2 = new String[8][8];
	}
	
	//예매 시스템 시작 함수
	public void start() {
		System.out.println("영화 예매 시스템을 시작합니다.");
		System.out.println();
		
		//초기화
		initSeat(seat1);
		initSeat(seat2);
		
		while(true) {
			printInfo(); //시스템 메뉴 출력
			int n = Integer.parseInt(scan.nextLine());
			
			switch(n) {
				case 1:
					printMovie(); //영화 정보 출력
					movie = selectMovie(); //영화 종류 선택
					
					if(movie == 1) {
						printSeat(seat1); //영화의 좌석 정보 출력
						selectSeat(seat1); //영화 예매
					}else {
						printSeat(seat2); //영화의 좌석 정보 출력
						selectSeat(seat2); //영화 예매
					}
					break;
				case 2:
					checkInfo(); //예약 정보 확인
					break;
				case 3:
					if(movie == 1) {
						drop(seat1);
					}else if(movie == 2){
						drop(seat2);
					}else {
						System.out.println("예매 내역이 없습니다.");
					}
					break;
				case 4: //좌석 확인
					printMovie(); //영화 정보 출력
					
					switch(selectMovie()) {
						case 1:
							printSeat(seat1);
							break;
						case 2:
							printSeat(seat2);
							break;
						default:
							System.out.println("잘못된 값입니다.");
					}
					
					break;
				case 5:
					System.out.println("프로그램을 종료합니다.");
					System.exit(0);
					break;
				default:
					System.out.println("잘못된 입력값입니다.");
					System.out.println("다시입력해주세요.");
			}
		}
	}

	//메뉴판 출력
	public void printInfo() {
		System.out.println("-----------------------------");
		System.out.println("       [영화 예매 시스템]");
		System.out.println("1. 예매하기 2. 예매조회 3. 예메취소");
		System.out.println("4. 좌석확인 5. 프로그램 종료");
		System.out.println("-----------------------------");
		System.out.println();
		System.out.print("번호를 선택해주세요 : ");
	}
	
	//영화 종류 출력
	private void printMovie() {
		System.out.println("--------------------");
		System.out.println("     [영화 예매]	");
		System.out.println("| 1. 한산 | 2. 탑건 |");
		System.out.println("--------------------");
		System.out.println();
	}
	
	//영화 종류 선택
	private int selectMovie() {
		System.out.print("원하시는 영화를 선택해주세요 : ");
		System.out.println();
		int m = Integer.parseInt(scan.nextLine());
		if(m != 1 && m != 2) {
			System.out.println("잘못된 값을 입력했습니다.");
			selectMovie();
		}
		return m;
	}
	
	//좌석 현황 출력
	private void printSeat(String[][] seat) {
		System.out.printf("        ");
		for(int i=0; i<seat[0].length; i++) {
			System.out.printf("[%d열]", i);
		}
		System.out.println();
		
		for(int i=0; i<seat.length; i++) {
			System.out.printf("[%d행] : ", i);
			for(int j=0; j<seat[i].length; j++) {
				System.out.printf("[%s]", seat[i][j].equals("__") ? "가능" : "완료");
			}
			System.out.println();
		}
		System.out.println();
	}
	
	//좌석 초기화
	private void initSeat(String[][] seat) {
		for(int i=0; i<seat.length; i++) {
			for(int j=0; j<seat[i].length; j++) {
				//좌석을 초기화
				seat[i][j] = "__"; //문자열로 초기화
			}
		}
	}
	
	//예매
	private void selectSeat(String[][] seat) {
		System.out.println("원하시는 좌석을 입력해주세요");
		
		while(true) { //좌석 범위를 벗어나는 것 방지
			System.out.print("행: ");
			x = Integer.parseInt(scan.nextLine());
			if(x >= 0 && x < seat.length)
				break;
			else
				System.out.println("올바른 행이 아닙니다.");
		}
		
		while(true) {	//좌석 범위를 벗어나는 것 방지
			System.out.print("열: ");
			y = Integer.parseInt(scan.nextLine());
			if(y >= 0 && y < seat[0].length)
				break;
			else
				System.out.println("올바른 열이 아닙니다.");
		}
		
		System.out.println("예매확인 비밀번호 4자리 문자를 입력해주세요");
		password = scan.nextLine();
		
		seat[x][y] = password;
	}
	
	//예매조회
	private void checkInfo() {
		if(movie == 0) {
			System.out.println("예매 내역이 없습니다.");
		}else {
			System.out.println("좌석 확인 비밀번호를 입력해주세요 : ");
			String tmp_p = scan.nextLine();
			if(tmp_p.equals(password)) {
				System.out.printf("[예매정보]\n영화 : ");
				System.out.print(movie == 1 ? "한산" : "탑건");
				System.out.printf("좌석: %d행 %d열\n", x, y);
			}else {
				System.out.println("비밀번호가 잘못되었습니다.");
			}
		}
		System.out.println();
	}
	
	//예매 취소
	private void drop(String[][] seat) {
		System.out.println("예매를 취소하시려면 예매확인 비밀번호를 입력해주세요");
		String tmp_p = scan.nextLine();
		if(tmp_p.equals(password)) {
			password = null;
			movie = 0;
			seat[x][y] = "__";
			x = 0;
			y = 0;
			System.out.println("예매가 취소되었습니다.");
		}else {
			System.out.println("비밀번호가 잘못되었습니다.");
		}
	}
}