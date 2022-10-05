import java.util.Calendar;
import java.util.Date;
import java.util.List;

import DAO.EmpDao;
import DTO.Emp;

/*
MVC 패턴
>>잘하는 것만 해 

Model  : 데이터 java
View   : 화면   >> jsp
Controller: 조정 (제어) >> servlet

jsp ,servlet , java .....

Model : dto(vo) , dao  >> java
View  : java (console)
...



*/
public class Program_Emp {

	public static void main(String[] args) {
		//main 함수 (View) 영역
		
		//DAO객체 요청
		EmpDao dao = new EmpDao(); //6개의 함수
		Date nowDate = new Date();
		int row = 0;
		
		Calendar cal = Calendar.getInstance();
		
		
		
		System.out.println("[전체조회]*******");
		List<Emp> emplist =dao.getEmpAllList();
		//화면구성
		if(emplist != null) {
			empPrint(emplist);
		}
		//조건조회
		System.out.println("[조건조회]*******");
		Emp emp =dao.getEmpListByEmpno(7934);
		if(emp != null) {
			empPrint(emp);
		}else {
			//.....
		}
		
//		System.out.println("[데이터 삽입]*******");
//		Emp insertemp = new Emp();
//		
//		insertemp.setEmpno(555);
//		insertemp.setEname("KOKO");
//		insertemp.setJob("Hustler");
//		insertemp.setMgr(9999);
//	
//	    insertemp.setHiredate(cal.getTime());
//
//		insertemp.setSal(7777);
//		insertemp.setComm(200);
//		insertemp.setDeptno(10);
//		
//		row = dao.insertEmp(insertemp);
//		if(row > 0) {
//			System.out.println("insert rowcount : " + row);
//		}
		
		System.out.println("[방금전 insert 데이터 전체조회]*******");
		emplist =dao.getEmpAllList();
		//화면구성
		if(emplist != null) {
			empPrint(emplist);
		}
		
//		System.out.println("[방금전 insert 데이터 수정하기]*******");
//		Emp updateemp = new Emp();
//		updateemp.setEname("GOGO");
//		updateemp.setJob("Homeless");
//		updateemp.setSal(777);
//		updateemp.setHiredate(cal.getTime());
//		updateemp.setEmpno(555);
//		
//		row = dao.updateEmp(updateemp);
//		if(row > 0) {
//			System.out.println("update rowcount : " + row);
//		}
		
		System.out.println("[방금전 update 데이터 전체조회]*******");
		emplist =dao.getEmpAllList();
		//화면구성
		if(emplist != null) {
			empPrint(emplist);
		}
		
//		System.out.println("[방금전 update 데이터 삭제하기]*******");
//		row = dao.deleteEmp(555);
//		if(row > 0) {
//			System.out.println("delete rowcount : " + row);
//		}
		
		System.out.println("[방금전 delete 데이터 전체조회]*******");
		emplist =dao.getEmpAllList();
		//화면구성
		if(emplist != null) {
			empPrint(emplist);
		}
		
		System.out.println("[like] 라이크ㅡㅡ으");
		emplist = dao.getEmpListByEname("FORD");
		
		if(emplist != null) {
			empPrint(emplist);
		}
	}
	public static void empPrint(Emp emp) {
		System.out.println(emp.toString());
	}
	public static void empPrint(List<Emp> list) {
		for(Emp data : list) {
			System.out.println(data.toString());
		}
	}

}