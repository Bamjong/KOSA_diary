package kr.or.kosa.dao;

import java.util.List;

import kr.or.kosa.dto.Emp;

public interface EmpDao {
	//CRUD 함수
	
	//C
	int insert(Emp emp);
	
	//R
	List<Emp> select();
	Emp selectByEmpno(int empno);
	
	//U
	int update(Emp empno);
	
	//D
	int delete(int empno);
}
