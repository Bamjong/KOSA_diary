import kr.or.kosa.AirPlane;

public class Ex07_Static_AirPlane {

	public static void main(String[] args) {
		//비행기 3대 만드시고 확인하세요
		AirPlane air1 = new AirPlane();
		air1.makeAirPlane(101, "대한한공");
		air1.airPlaneTotalCount();
		
		AirPlane air2 = new AirPlane();
		air2.makeAirPlane(202, "제주에어");
		air2.airPlaneTotalCount();
		
		AirPlane air3 = new AirPlane();
		air3.makeAirPlane(707, "진에어");
		air3.airPlaneTotalCount();
		
	}

}
