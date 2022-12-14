package dao;

import java.sql.SQLException;
import java.util.List;

import vo.Dept;

public interface DeptDao {
	
	//전체 게시물
	List<Dept> getDepts() throws ClassNotFoundException, SQLException;
	
	//게시물 삭제
	int delete(String seq) throws ClassNotFoundException, SQLException;
	
	//게시물 수정
	int update(Dept dept) throws ClassNotFoundException, SQLException;
	
	//게시물 상세
	Dept getDept(String seq) throws ClassNotFoundException, SQLException;
	
	//게시물 입력
	int insert(Dept n) throws ClassNotFoundException, SQLException;
}
