
public class Ex09_Cinema {
	public static void main(String[] args) {
		String[][] seat = new String[3][5];
		
		for(int i=0; i<seat.length; i++) {
			for (int j = 0; j < seat[i].length; j++) {
				// 좌석을 초기화
				seat[i][j] = "__";
			}
		}
		
		//예매
		seat[2][1] = "홍길동";
		seat[0][0] = "김유신";
		
		//예매 좌석 현황 보여주기
		
		
		for(int i=0; i<seat.length; i++) {
			for (int j = 0; j < seat[i].length; j++) {
				// 좌석을 초기화
				System.out.printf("[%s]",seat[i][j].equals("__") ? "좌석" : "예매");
			}
			System.out.println();
		}
		
		//예매하려고 ... 그 좌석이 예매 가능 한지 or 예매가 되었는지 알려주어요.
		int row, col;
		row = 0;
		col = 1;
		if (seat[row][col].equals("__")) {
			System.out.println("예약 가능한 좌석 입니다.");
		} else {
			System.out.println("이미 예약 되었습니다.");
		}
		
		//모든 좌석을 초기화 하세요 "__"
	}
}
