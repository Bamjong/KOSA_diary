import java.util.Scanner;

public class Cinema_Seat_Cancel_BJ {
	Scanner sc = new Scanner(System.in); 
	static String[][] seatArr = new String[4][5];
	private int Row, Column;
	
	
	public void delete() {
		showSeat();
		checknumber();
		checkSeat();
		}
	
	public void checknumber() {
		System.out.println("취소할 좌석을 알려주세요 (숫자 중간 띄어쓰기)");
			int Row = (sc.nextInt()-1);
			int Column = (sc.nextInt()-1);
			if(seatArr.length > Row && seatArr[0].length > Column) {
				this.Row = Row;
				this.Column = Column;
			}
			else {
				System.out.println("없는자리입니다. 다시 해주세요.");
				checknumber();
				return;
			}
	}
		
	public void checkSeat() {
		
			boolean i = seatArr[this.Row][this.Column].equals("예매");
			if(i != true) {
				System.out.println("빈 좌석입니다.");
			} else {
				System.out.println("예매취소 완료 되었습니다.");
				seatArr[this.Row][this.Column] = Row + "-" + ((int)Column);
			}
	}
	
	
	public void Init() {
		for(int i=0;i<seatArr.length;i++) {
			for(int j=0;j<seatArr[i].length;j++) {
				seatArr[i][j] = i+1 + "-" + ((int)j+1);
			}
		}
	}
	
	public void showSeat() {
		System.out.println("현 좌석 상태입니다.");
		for(int i=0;i<seatArr.length;i++) {
			for(int j=0;j<seatArr[i].length;j++) {
				System.out.print("["+seatArr[i][j]+ "]");
			}
			System.out.println();
		}
	}

}

