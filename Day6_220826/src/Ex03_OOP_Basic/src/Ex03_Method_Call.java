import kr.or.kosa.Tv;

public class Ex03_Method_Call {

	public static void main(String[] args) {
		Tv lgtv = new Tv();
		lgtv.brandname = "LG";
		
		lgtv.tvInfo();
			lgtv.ch_Up();	
			lgtv.ch_Up();
			lgtv.ch_Up();
		lgtv.tvInfo();
			lgtv.ch_Down();
			lgtv.ch_Down();
		lgtv.tvInfo();
			
			
		Tv sstv = new Tv();
		
		sstv.brandname = "SAMSUNG";
		
		sstv.tvInfo();
			sstv.ch_Up();
	}
}
