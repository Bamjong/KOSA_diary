package kr.or.kosa;

//MVC
//Model >> 데이터를 담을 수 있는 클래스(DTO), 데이터 처리(DAO)


public class CopyEmp {
	private int empno;
	private String ename;
	private int sal;
	
	
	public CopyEmp(int empno, String ename, int sal) {
		super();
		this.empno = empno;
		this.ename = ename;
		this.sal = sal;
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
	public int getSal() {
		return sal;
	}
	public void setSal(int sal) {
		this.sal = sal;
	}
	@Override
	public String toString() {
		return "Emp [empno=" + empno + ", ename=" + ename + ", sal=" + sal + "]";
	}
	
	
}
