
public class Ex01_Cinema_Teamproject {
	
	public static void main(String[] args) {
		
		
		Cinema_Seat_Cancel_BJ cancel = new Cinema_Seat_Cancel_BJ();

		
		cancel.Init();
		cancel.seatArr[2][3] = "예매";
		cancel.delete();
	}
}
