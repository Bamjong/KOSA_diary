package kr.or.kosa;

//데이터를 담을 수 있는 클래스 (1건)
//DTO, VO, DOMAIN 이름

public class Emp { //extends Object
	private int empno;
	private String ename;

	public Emp(int empno, String ename) {
		super();
		this.empno = empno;
		this.ename = ename;
	}

	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	@Override
	public String toString() {
		return "Emp [empno=" + empno + ", ename=" + ename + "]";
	}
	
	//Object >> toString() 함수는 일반적으로 재정의 가장 많이....
	//만약 제정의 하지 않으면 ... 주소값을 출력
	
	//toString 재정의 필요한대로 코딩 ... 일반적으로 member field정보를 기입해 재정의해둠

}
