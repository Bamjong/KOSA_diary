package kr.or.kosa;

//사원을 정의 하세요
public class Emp { // Emp라는 클래스는 데이터 타입이다 (큰타입)
	public int number;
	private int empno;
	public int getEmpno() { // read
		return empno;
	}
	public void setEmpno(int empno) { // write
		// 전달하기 전에 검증...
		if (empno < 0) {
			this.empno = 0;
		} else {
			this.empno = empno;
		}
	}
	
	public void print() {
		 System.out.println("사원번호 : " + empno);
	}
	
}

//사원은 급여정보 이름 사원번호 입사일
