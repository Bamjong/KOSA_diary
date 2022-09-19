

//두개의 설계도

class Tv{
	boolean power;
	int ch;
	
	void power() {	//두개의 기능을 하나의 함수로 처리
		this.power = !this.power;
	}
	
	void chUp() {
		this.ch++;
	}
	void chDown() {
		this.ch--;
	}
}

class Vcr{                       //  TvVcr2 tv2 = new TvVcr2();
	boolean power;
	
	void power() {
		this.power = !this.power;	
	}
	void play() {
		System.out.println("재생하기");
	}
	void stop() {
		System.out.println("정지하기");
	}
	void rew() {}
	void ff() {}
}

//Tv설계도
//Vcr 설계도

//TvVcr 이런 제품
class TvVcr{
	Tv t;
	Vcr v;
	
	public TvVcr(){
		this.t = new Tv();
		this.v = new Vcr();
	}
}

//답은 한놈은 상속하고 한놈은 포함 ...
//어떤놈을 상속하고 어떤놈을 포함할까
//기준 Tv(상속),Vcr(포함) >> T 주기능

//메인기능을 누가 가지고 있느냐 (비중)

class TvVcr2 extends Tv{
	Vcr vcr;
	
	public TvVcr2() {
		vcr = new Vcr();
	}
}



public class Ex03_Inherit {
	public static void main(String[] args) {
		TvVcr tv = new TvVcr();
		
		tv.t.power();
		tv.v.power();
		
		System.out.println(tv.t.power);
		/////////////////////////////
		
		TvVcr2 tv2 = new TvVcr2();
		tv2.power();
		System.out.println("Tv전원 : "+ tv2.power);
		tv2.chUp();
		
		tv2.vcr.power();
		System.out.println("비디오 전원: " + tv2.vcr.power);
		
	}

}
